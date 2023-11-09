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
        <h3 class="box-title">회원가입</h3>
      </div>


      <form role="form" id="joinForm" method="post" action="/member/join">
        <div class="box-body">
          <div class="form-group row">
            <label for="mbsp_id" class="col-2">아이디</label>
            <div class="col-8">
              <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디 입력">
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-outline-info" id="idCheck">중복체크</button>
            </div>
          </div>

          <div class="form-group row">
            <label for="" class="col-2">비밀번호</label>
            <div class="col-10">
              <input type="password" class="form-control" name="user_password" id="user_password" placeholder="비밀번호 입력">
            </div>
          </div>

          <div class="form-group row">
            <label for="mbsp_password2" class="col-2">비밀번호확인</label>
            <div class="col-10">
              <input type="password" class="form-control" name="user_password2" id="user_password2" placeholder="비밀번호를 한 번 더 입력하세요">
            </div>
          </div>

          <div class="form-group row">
            <label for="mbsp_name" class="col-2">이름</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름 입력">
            </div>
          </div>

          <div class="form-group row">
            <label for="mbsp_email" class="col-2">이메일</label>
            <div class="col-8">
              <input type="email" class="form-control" name="user_email" id="user_email" placeholder="이메일 입력">
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-outline-info">메일인증</button>
            </div>
          </div>

          <div class="form-group row">
            <label for="authCode" class="col-2">인증번호</label> 
            <div class="col-8">
              <input type="text" class="form-control" name="authCode" id="authCode" placeholder="인증번호 입력">
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-outline-info">인증확인</button>
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_postcode" class="col-2">우편번호</label>
            <div class="col-8">
              <input type="text" class="form-control" name="user_zipcode" id="user_zipcode" placeholder="우편번호">
            </div>
            <div class="col-2">
              <button type="button" class="btn btn-outline-info">우편번호 찾기</button>
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_address" class="col-2">기본주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_addr" id="user_addr" placeholder="주소 입력">
            </div>
          </div>

          <div class="form-group row">
            <label for="sample2_detailAddress" class="col-2">상세주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_deaddr" id="user_deaddr" placeholder="상세주소">
              <input type="hidden" placeholder="">
            </div>
          </div>
          
          <div class="form-group row">
            <label for="mbsp_phone" class="col-2">핸드폰</label>
            <div class="col-10">
              <input type="text" class="form-control" name="user_phone" id="user_phone" placeholder="핸드폰 번호 입력">
            </div>
          </div>

        </div>
        
        <div class="box-footer">
          <button type="submit" class="btn btn-primary">회원가입</button>
        </div>
      </form>
    </div>

  </div>

  <%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</div>

	<%@ include file="/WEB-INF/views/comm/plugIn.jsp" %>
  <script>
    $(document).ready(function() {

      // 아이디 중복체크 사용유무
      let useIdCheck = false;

      $("#idCheck").on("click", function() {
        // alert("아이디 중복체크");
        if($("#user_id").val() == "") {
          alert("아이디를 입력하세요");
          $("#user_id").focus();
          return;
        }

      // 아이디 중복체크 작업
      $.ajax({
        url : "/member/idCheck",
        type : "get",
        dataType : "text", // String
        data : {user_id : $("#user_id").val()},
        // data : {폼데이터변수 : QueryString}
        success : function(result) {
          if(result == "yes") {
            alert("아이디 사용가능");
            useIdCheck = true;
          } else {
            alert("아이디 사용불가");
            useIdCheck = false;
            $("#user_id").val(""); // ID 텍스트 박스 공백처리
            $("#user_id").focus();
          }
        }
      });
      
    });
    
  });//
  </script>
  </body>
</html>
    