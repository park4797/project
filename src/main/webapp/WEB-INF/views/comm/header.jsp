<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal"><a href="/">Pak Mall</a></h5>
  <c:if test="${sessionScope.loginStatus != null }">
	<div>
		<b>${sessionScope.loginStatus.user_name }님</b>
		<b>${sessionScope.loginStatus.user_email }님</b>
		<b>최근 로그인 시간 : <fmt:formatDate value="${sessionScope.loginStatus.user_lastlogin }" pattern="yyyy-MM-dd hh:mm:ss"/></b>
	</div>
  </c:if>
  <nav class="my-2 my-md-0 mr-md-3">
  
  	<!-- 로그인 이전 표시  -->
  	<c:if test="${sessionScope.loginStatus == null }">
	    <a class="p-2 text-dark" href="/member/login">로그인</a>
	    <a class="p-2 text-dark" href="/member/join">회원가입</a>
		<a class="p-2 text-dark" href="/board/list">게시판</a>
	</c:if>
    <!-- 로그인 이후 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
	    <a class="p-2 text-dark" href="/member/logout">로그아웃</a>
	    <a class="p-2 text-dark" href="/member/confirm_info">정보수정</a>
	    <a class="p-2 text-dark" href="/member/mypage">MyPage</a>
	    <a class="p-2 text-dark" href="/board/list">게시판</a>
	</c:if>
    
	    <a class="p-2 text-dark" href="#">Order</a>
	    <a class="p-2 text-dark" href="#">Cart</a>
	    
	    <a class="p-2 text-dark" href="/admin/intro">[Admin]</a>
  </nav>
</div>