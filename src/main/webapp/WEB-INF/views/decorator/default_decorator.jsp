<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Project - <decorator:title/></title>
<!-- Custom fonts for this template -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="/vendor/jquery/jquery.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
<decorator:head/>
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3"> Project <sup>sp</sup></div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- 사이드바 메뉴 부분 -->
			<li class="nav-item">
				<a class="nav-link" href="/main/main.do">
					<i class='fas fa-home'></i> <span>Main</span>
				</a>
			</li>
			
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			
			<li class="nav-item">
				<a class="nav-link" href="/notice/list.do">
					<i class='fas fa-bell'></i> <span>Notice</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/image/list.do">
					<i class="fa fa-image"></i> <span>Image</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/board/list.do">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Board</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/qna/list.do">
					<i class="fa fa-question-circle"></i> <span>QnA</span>
				</a>
			</li>
			
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
			
			<c:if test="${!empty login && login.gradeNo == 9}">
				<li class="nav-item">
					<a class="nav-link" href="/member/list.do">
						<i class="fas fa-address-card"></i> <span>Member Management</span>
					</a>
				</li>
			</c:if>
			
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- 상단바 검색창 -->
					<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- 오른쪽 상단 메뉴 : 로그인 로그아웃 -->
					<ul class="navbar-nav ml-auto">
						<!-- 로그인이 되어 있지 않은 경우 -->
						<c:if test="${empty login }">
							<li class="nav-item">
								<a class="nav-link" href="/member/write.do">
									<i class="fas fa-user-plus fa-sm fa-fw mr-1 text-gray-600"></i>
									<span class="text-gray-600">Join</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/member/login.do">
									<i class="fas fa-sign-in-alt fa-sm fa-fw mr-1 text-gray-600"></i> 
									<span class="text-gray-600">Login</span>
								</a>
							</li>
						</c:if>
						
						<!-- 로그인이 되어 있는 경우 -->
						<c:if test="${!empty login }">
							<!-- 메세지 -->
	                        <li class="nav-item dropdown no-arrow mx-1">
	                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="fas fa-envelope fa-fw"></i>
	                                <!-- Counter - Messages -->
	                                <span class="badge badge-danger badge-counter">7</span>
	                            </a>
	                            <!-- Dropdown - Messages -->
	                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="messagesDropdown">
	                                <h6 class="dropdown-header">Message Center</h6>
	                                
	                                <a class="dropdown-item d-flex align-items-center" href="#">
	                                    <div class="dropdown-list-image mr-3">
	                                        <img class="rounded-circle" src="/upload/member/undraw_profile_1.svg"
	                                            alt="...">
	                                        <div class="status-indicator bg-success"></div>
	                                    </div>
	                                    <div class="font-weight-bold">
	                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
	                                            problem I've been having.</div>
	                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
	                                    </div>
	                                </a>
	                                <a class="dropdown-item d-flex align-items-center" href="#">
	                                    <div class="dropdown-list-image mr-3">
	                                        <img class="rounded-circle" src="/upload/member/undraw_profile_2.svg"
	                                            alt="...">
	                                        <div class="status-indicator"></div>
	                                    </div>
	                                    <div>
	                                        <div class="text-truncate">I have the photos that you ordered last month, how
	                                            would you like them sent to you?</div>
	                                        <div class="small text-gray-500">Jae Chun · 1d</div>
	                                    </div>
	                                </a>
	                                <a class="dropdown-item d-flex align-items-center" href="#">
	                                    <div class="dropdown-list-image mr-3">
	                                        <img class="rounded-circle" src="/upload/member/undraw_profile_3.svg"
	                                            alt="...">
	                                        <div class="status-indicator bg-warning"></div>
	                                    </div>
	                                    <div>
	                                        <div class="text-truncate">Last month's report looks great, I am very happy with
	                                            the progress so far, keep up the good work!</div>
	                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
	                                    </div>
	                                </a>
	                                <a class="dropdown-item d-flex align-items-center" href="#">
	                                    <div class="dropdown-list-image mr-3">
	                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
	                                            alt="...">
	                                        <div class="status-indicator bg-success"></div>
	                                    </div>
	                                    <div>
	                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
	                                            told me that people say this to all dogs, even if they aren't good...</div>
	                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
	                                    </div>
	                                </a>
	                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
	                            </div>
	                        </li>
	
	                        <div class="topbar-divider d-none d-sm-block"></div>
						
	                        <!-- 사용자 정보 -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${login.name }</span>
	                                <img class="img-profile rounded-circle" src="${login.photo }">
	                            </a>
	                            <!-- Dropdown - User Information -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="/member/view.do">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
	                                </a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
	                                </a>
	                            </div>
	                        </li>
                        </c:if>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- 개발한 jsp 들어가는 부분 -->
				<div class="container-fluid">
					<decorator:body/>
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>BackEnd made by MunSJ</span><br>
							<span>Copyright &copy; Your Website 2020</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	
	<!-- 처리 결과 모달 -->
	<c:if test="${!empty result }">
		<script type="text/javascript">
			$(function() {
				// history.state가 있으면(true가 됨) 모달을 보여주지 않음
				// 페이지가 보여주는 맨 처음에는 history.state가 없는 상태로 진행됨
				if (history.state)
					return;
				// 모달 창 보여주기
				$("#resultModal").modal("show");
				// 모달 창 뒤로가기 처리
				//history.state의 데이터를 세팅(바꾼다)한다 -> history.state가 생김
				history.replaceState({}, null, null)
			});
		</script>

		<div id="resultModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Modal Title</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</c:if>
		
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Do you want to logout?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/member/logout.do">Logout</a>
                </div>
            </div>
        </div>
    </div>

	<!-- Bootstrap core JavaScript-->
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/js/demo/datatables-demo.js"></script>
</body>
</html>
