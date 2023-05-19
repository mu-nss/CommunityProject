<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>500</title>

<div id="page-top">
	<div id="wrapper">
		<div class="container-fluid">
			<div class="text-center">
				<div class="error mx-auto" data-text="500">500</div>
				<p class="text-gray-800 mb-5">${exception.message }</p>
				<a href="/main/main.do">&larr; Back to Main</a>

				<ul class="list-group" style="text-align: left;">
					<c:forEach items="${exception.stackTrace }" var="stack"> 
						<li class="list-group-item">${stack }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>