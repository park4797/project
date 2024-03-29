<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en" class="h-100">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.101.0">
	<title>Sticky Footer Navbar Template · Bootstrap v4.6</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sticky-footer-navbar/">



	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}
	</style>


	<!-- Custom styles for this template -->
	<link href="/resources/sticky-footer-navbar.css" rel="stylesheet">
</head>

<body class="d-flex flex-column h-100">

	<header>
		<%@include file="/WEB-INF/views/comm/header.jsp" %>
	</header>
	<!-- Begin page content -->
	<main role="main" class="flex-shrink-0">
		<div class="container">
			<section>
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">게시판</h3>
							</div>

							<div class="box-body">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th style="width : 10%">번호</th>
											<th style="width : 40%">제목</th>
											<th style="width : 20%">작성자</th>
											<th style="width : 20%">등록일</th>
											<th style="width : 10%">조회수</th>
										</tr>
										<!-- list 작업이므로 for문 사용 list에 대한 정보를 board 변수에 담는다  -->
										<c:forEach items="${list}" var="board">
											<tr>
												<td>${board.bno}</td>
												<td><a class="move" href="#" data-bno="${board.bno}">${board.title}</a></td>
												<td>${board.writer}</td>
												<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
												<td>${board.viewcount}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

							<div class="box-footer clearfix">
								<div class="row">
									<div class="col-6">
										<nav aria-label="...">
											<ul class="pagination">

												<c:if test="${pageMaker.prev}">
													<li class="page-item">
														<a href="/board/list?pageNum=${pageMaker.startPage - 1}" class="page-link">Previous</a>
													</li>
												</c:if>
												<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
													<li class='page-item ${pageMaker.cri.pageNum == num ? "active" : ""}' aria-current="page">
														<a class="page-link movepage" href="#" data-page="${num}">${num}</a>
													</li>
												</c:forEach>

												<c:if test="${pageMaker.next}">
													<li class="page-item">
														<a href="/board/list?pageNum=${pageMaker.endPage + 1}" class="page-link" href="#">Next</a>
													</li>
												</c:if>
											</ul>
										</nav>
									</div>
									<div class="col-6">
										<form action="/board/list" method="get">

											<!-- 검색어 작업 -->
											<select name="type">
												<option selected>검색종류</option>
												<option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
												<option value="C" ${pageMaker.cri.type == 'W' ? 'selected' : ''}>내용</option>
												<option value="W" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>작성자</option>
												<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : ''}>제목 or 내용</option>
												<option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : ''}>제목 or 작성자</option>
												<option value="TWC" ${pageMaker.cri.type == 'TWC' ? 'selected' : ''}>제목 or 작성자 or 내용</option>
											</select>
											<input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
											<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
											<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
											<button type="submit" class="btn btn-primary">검색</button>
										</form>
										<form id="actionForm" action="/board/list" method="get">
											<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
											<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}" />
											<input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
											<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
											<input type="hidden" name="bno" id="bno" />
										</form>
									</div>
								</div>
								<a class="btn btn-primary" href="/board/register" role="button">글쓰기</a>
							</div>
						</div>

					</div>
				</div>
			</section>
		</div>
	</main>

	<footer class="footer mt-auto py-3">
		<%@include file="/WEB-INF/views/comm/footer.jsp" %>
	</footer>
	<%@include file="/WEB-INF/views/comm/plug-in.jsp" %>

	<script>

		// 1) 페이지 번호 클릭시 동작되는 이벤트 작업
		let actionForm = document.getElementById("actionForm"); // 페이징데이터 참조
		const movePages = document.getElementsByClassName("movepage"); // 목록데이터 참조

		Array.from(movePages).forEach(function(mv_page) {
			mv_page.addEventListener("click", function(event) {
				event.preventDefault();
				// console.log("페이지 번호", event.target.dataset.page);

				document.getElementById("pageNum").value = event.target.dataset.page;
				// pageNum의 value에 dataset.page를 불러와 삽입

				actionForm.setAttribute("action", "/board/list");
				actionForm.submit(); // board/list로 전송
			})
		});

		// 2) 제목클릭시 이벤트 설정
		const moves = document.getElementsByClassName("move");
		Array.from(moves).forEach(function(move) {
			move.addEventListener("click", function(event) {
				event.preventDefault();

				document.getElementById("bno").remove();

				let bno = event.target.dataset.bno;

				const newInput = document.createElement("input");
				newInput.setAttribute("type", "hidden");
				newInput.setAttribute("name", "bno");
				newInput.setAttribute("id", "bno");
				newInput.setAttribute("value", bno);
				actionForm.appendChild(newInput);

				actionForm.setAttribute("action", "/board/get");

				actionForm.submit();
			})
		})
	</script>
</body>
</html>