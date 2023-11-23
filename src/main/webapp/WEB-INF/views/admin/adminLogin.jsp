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

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/sign-in/">

    <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

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
    <link href="https://getbootstrap.com/docs/4.6/examples/sign-in/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<form class="form-signin" action="/admin/admin_ok" method="post">
  <img class="mb-4" src="https://getbootstrap.com/docs/4.6/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">관리자</h1>
  <label for="inputId" class="sr-only">ID</label>
  <input type="text" name="admin_id" id="admin_id" value="admin" class="form-control" placeholder="ID입력" required autofocus>
  <label for="inputPW" class="sr-only">Password</label>
  <input type="password" name="admin_pw" id="admin_pw" value="1234" class="form-control" placeholder="Password 입력" required>
  <div class="checkbox mb-3">
    <label>
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
</form>
    
  <script>
    $(document).ready(function() {

      let msg = "${msg}";

      if(msg == 'failID') {
        alert("아이디가 일치하지 않습니다.")
      }else if (msg == 'failPW') {
        alert("비밀번호가 일치하지 않습니다.");
      }
    });
  </script>
  </body>
</html>
