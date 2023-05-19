# 💻 communityProject
처음부터 다시 공부하기 위해 웹짱 유튜브 채널을 참고하여 만들었으며, 스프링 프레임워크와 부트스트랩4 템플릿을 활용한 가장 기본적인 기능만 있는 커뮤니티 웹 페이지입니다.

## # community
<img width="1276" alt="커뮤니티프로젝트 화면 구성" src="https://github.com/mun-sojeong/communityProject/assets/82130275/e5f4b107-5d5c-48b1-aa79-ba15f63e5240">

## # 개발 인원 
- 1명(개인 프로젝트)

## # 개발 기간
- 2023.02.21 ~ 2023.05.17(약 3개월)

## # 플랫폼
- web

## # 개발 환경
- `JAVA 8`
- `JDK 1.8.0_341`
- **Framework** : Spring framework 3.9.12 / Mybatis 3.4.6
- **IDE** : Eclipse IDE v.2019-09 / STS 3.9.17
- **Server** : Apache Tomcat9
- **Datebase** : Oracle 11g
- **FrontEnd** : Bootstrap 4

## # DB ERD
![커뮤니티프로젝트_ERD](https://github.com/mun-sojeong/communityProject/assets/82130275/d20126a4-788e-4e60-9ec7-bd3056ef2191)

## # 주요 기능
> CRUD

1. C(create)
  - 게시판, 공지사항, 이미지, 이미지 댓글, 질문답변의 글을 등록(write)한다.
  - 회원 가입(write)
  
2. R(Read)
 - 게시판, 공지사항, 이미지, 이미지 댓글, 질문답변의 전체 데이터 개수(getTotalRow)를 가져와서 리스트(list)로 보여준다.
 - 게시판, 공지사항의 select문은 sql문으로 추가한 검색(search) 기능을 수행할 수 있다. 
```java
<select id="list" resultType="com.project.board.vo.BoardVO">
  <![CDATA[
    select no, title, writer, writeDate, hit
    from(	
      select /*+ INDEX_DESC(board SYS_C007554) */
        rownum rno, no, title, writer, writeDate, hit
      from board
      where
  ]]>
      <include refid="search" />
  <![CDATA[
        rownum <= #{endRow}
    ) 
    where rno > #{startRow} - 1
  ]]>
</select>

<select id="getTotalRow" resultType="Long">
  select count(no) from board
  where		
    <include refid="search" />
    no > 0
</select>

<!-- 검색 쿼리 -->
<sql id="search">
  <if test="word != null and !word.equals(''.toString())">
    <trim prefix= "( 1=0 " suffix=") and">
      <if test="key.contains('t'.toString())">
        or title like '%' || #{word} || '%'
      </if>
      <if test="key.contains('c'.toString())">
        or content like '%' || #{word} || '%'
      </if>
      <if test="key.contains('w'.toString())">
        or writer like '%' || #{word} || '%'
      </if>
    </trim>
  </if>
</sql>
```


 - 리스트에서 해당 글을 클릭하면 보기(view)로 넘어가고 상세 내용을 보여준다.
 - 로그인(login)과 해당 아이디를 확인(idCheck)할 수 있다.
 - 가입된 전체 회원의 데이터 개수(getTotalRow)를 가져와서 리스트(list)로 보여준다.
 - 로그인된 아이디 중 등급 번호가 1(일반 회원)인 경우는 '나의 정보 보기(view)', 등급 번호가 9(관리자)인 경우 '회원 정보 보기(view)'를 보여준다.
``` java
// 회원 정보 보기 / 내 정보 보기
@GetMapping("/view.do")
public String view(String id, Model model, HttpSession session) throws Exception {
  if(id == null) {
    model.addAttribute("title", "My Profile"); // 내 정보 보기
    id = ((LoginVO)session.getAttribute("login")).getId();
  } else {
    model.addAttribute("title", "Member Profile"); // 회원 정보 보기
  }
  model.addAttribute("vo", service.view(id));
  return "member/view";
}
```
```java
<select id="view" resultType="com.project.member.vo.MemberVO">
  select m.id, m.name, m.birth, m.gender, m.tel, m.email, m.status, m.gradeNo, m.photo, g.gradeName, m.regDate, m.photo
  from member m, grade g
  where (id = #{id}) and (m.gradeNo = g.gradeNo)
</select>
 ```
 
3. U(Update) 
 - 게시판, 공지사항, 이미지, 이미지 댓글, 질문답변의 글을 수정(update)한다. 
 - 게시판의 조회수(hit)를 1씩 증가시킨다.
 - 로그인한 아이디가 같은 경우 나의 정보 수정(update)할 수 있다.
 - 관리자로 로그인한 경우 상태 변경(changeStatus)과 등급 변경(changeGradeNo)을 변경 할 수 있다. 

4. D(Delete)
 - 게시판, 공지사항, 이미지, 이미지 댓글, 질문답변의 글을 삭제(delete)한다.
 - 일반 회원은 회원 탈퇴(delete)할 수 있다.

## # 오류와 해결
 * log4j.dtd가 없다고 했을 때
   - log4j.xml에서 log4j.dtd의 경로가 정확하게 입력되지 않아서 생긴 것이였고 http://~이 부분을 추가해줌으로써 해결했다.
```
<!DOCTYPE log4j:configuration PUBLIC "-//APACHE//DTD LOG4J 1.2//EN" "http://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/xml/doc-files/log4j.dtd">
```

* 콘솔 창에 log.info의 출력이 되지 않았을 때
  - 전에 공부하던 프로젝틔의 log4j.xml을 복시해 오면서 에서 <logger> 패키지의 name을 수정해야 되는데 하지 않아서 발생
  
* Mybatis 오류: Invalid bound statement(not found)
  - 나의 경우에는 mapper의 패키지 경로는 같았지만 ImageMappler.java와 ImageMappler.xml에서 파일명의 대소문자가 틀려서 찾지 못한 오류 였다.
   
  - Invalid bound statement(not found)의 그 외 오류 발생 원인
	  - Mapper 인터페이스와 xml의 오타
	  - mapper-locations - 쿼리가 작성되어 있는 mapper.xml이 위치한 경로를 application.properties에 정의하지 않았거나 잘못 선언한 경우
    - 동일한 이름, 다른 패키지 경우
    - yaml 파일 오타
    - DataSource Configuration
	
* 이미지와 질문답변에서 등록(write)을 하면 500번 오류 - numberformatexception: for input string: ""이 발생
    - 리스트(list)에서 등록 버튼의 href에 perPageNum을 넘겨주지 않아서 발생
```
<c:if test="${!empty login }">
	<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-sm btn-primary float-right">New Register</a>
</c:if>
```
