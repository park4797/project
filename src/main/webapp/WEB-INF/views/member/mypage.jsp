<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    

    <!-- Bootstrap core CSS -->
	<%@ include file="/WEB-INF/views/comm/plugIn2.jsp" %>


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

  </head>
  <body>
    
	<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="container">
  <div class="text-center">

    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">회원정보 수정</h3>
      </div>


      <form role="form" id="userForm" method="post" action="/member/mypage">
        <div class="box-body">
          <div class="form-group row">
            <label for="user_id" class="col-2">아이디</label>
            <div class="col-8">
              <input type="text" class="form-control" name="user_id" id="user_id" value="${memberVO.user_id}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="mbsp_name" class="col-2">이름</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_name" id="user_name" value="${memberVO.user_name}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="mbsp_email" class="col-2">이메일</label>
            <div class="col-8">
              <input type="email" class="form-control" name="user_email" id="user_email" value="${memberVO.user_email}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_postcode" class="col-2">우편번호</label>
            <div class="col-8">
              <input type="text" class="form-control" name="user_zipcode" id="sample2_postcode" value="${memberVO.user_zipcode}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_address" class="col-2">기본주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_addr" id="sample2_address" value="${memberVO.user_addr}"readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_detailAddress" class="col-2">상세주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_deaddr" id="sample2_detailAddress" value="${memberVO.user_deaddr}" readonly>
              <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="mbsp_phone" class="col-2">핸드폰</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_phone" id="user_phone" value="${memberVO.user_phone}" readonly>
            </div>
          </div>

        </div>
        
        <div class="box-footer">
          <button type="button" id="btn_user_delete" class="btn btn-primary">회원탈퇴</button>
        </div>
      </form>
    </div>

  </div>

  <%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</div>

	<%@ include file="/WEB-INF/views/comm/plugIn.jsp" %>
  <script>
    $(document).ready(function() {

      let userDelete = $("#userForm");

      $("#btn_user_delete").click(function() {
        userDelete.submit(); // 폼전송
      })
    });
  </script>
  </body>
</html>
    