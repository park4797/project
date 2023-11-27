<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@ include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
  
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Main content -->
    <section class="content container-fluid">
      <div class="row"> <!-- <tr>과 같은 느낌. row 안에는 <td>를 합이 12까지 사용 가능하다. -->
    		<div class="col-md-12"> <!-- <tr> 하나에 <td>를 하나만 쓰겠다는 의미 -->
    			<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title mt-5">상품등록</h3> <!-- mt-5 : bootstrap의 margin-top -->
            </div>
          
          <!--form 태그내에 input type="file"이 존재하면 enctype 추가-->
          <form role="form" method="post" action="/admin/product/pro_regist" enctype="multipart/form-data"> 
          <div class="box-body">
            <div class="form-group row">
              <label for="title" class="col-sm-2">카테고리</label>
              <div class="col-sm-3">
                <select class="form-control" id="firstCategory">
                  <option>1차 카테고리 선택</option>
                  <c:forEach items="${firstCategoryList}" var="categoryVO">
                    <option value="${categoryVO.cg_code}">${categoryVO.cg_name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-sm-3">
                <!-- name과 ProductVO의 변수명이 일치해야 한다. -->
                <select class="form-control" id="secondCategory" name="cg_code">
                  <option>2차 카테고리 선택</option>
                </select>
              </div>
            </div>

            <div class="form-group row">
              <label for="" class="col-sm-2">상품명</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pro_name" id=""pro_name>
              </div>
              <label for="" class="col-sm-2">상품가격</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pro_price" id="pro_price">
              </div>
            </div>

            <div class="form-group row">
              <label for="" class="col-sm-2">할인율</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pro_discount" id="pro_discount">
              </div>
              <label for="" class="col-sm-2">제조사</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pro_publisher" id="pro_publisher">
              </div>
            </div>

            <div class="form-group row">
              <label for="" class="col-sm-2">상품이미지</label>
              <div class="col-sm-4">
                <input type="file" class="form-control" name="" id="">
              </div>
              <label for="" class="col-sm-2">미리보기 이미지</label>
              <div class="col-sm-4">
                <img id="" style="width:200px; height:200px;">
              </div>
            </div>

            <div class="form-group row">
              <label for="" class="col-sm-2 col-form-label">상품설명</label>
              <div class="col-sm-10">
                <textarea class="form-control" name="pro_content" id="pro_content" rows="3"></textarea>
              </div>
            </div>

            <div class="form-group row">
              <label for="" class="col-sm-2">수량</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="pro_amount" id="pro_amount">
              </div>
              <label for="" class="col-sm-2 col-form-label">판매여부</label>
              <div class="col-sm-4">
                <select class="form-control" id="pro_buy" name="pro_buy">
                  <!-- value값이 없으면 "판매가능", "판매불가능"이 값으로 들어간다 -->
                  <option value="Y">판매가능</option>
                  <option value="N">판매불가능</option>
                </select>
              </div>
            </div>
          </div>
            
            <div class="box-footer">
              <div class="form-group">
                <ul class="uploadedList"></ul>
              </div>
              <div class="text-center">
                <button type="submit" class="btn btn-primary">상품등록</button>
                <button type="button" class="btn btn-primary" id="btn_modify_cancle">취소</button>
              </div>
            </div>
            </form>
				  </div>
    		</div>
    	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

	<!-- Main Footer -->
  

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<%@ include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

  <script>
    $(document).ready(function() {
      $("#firstCategory").change(function() {

        // 1차 카테고리는 선택한 option 값
        let cg_parent_code = $(this).val();
        // console.log("1차카테고리", cg_parent_code)

        // 1차 카테고리 선택 후 2차카테고리 정보를 가져온다.
        let url = "/admin/category/secondCategory/" + cg_parent_code + ".json";

        // $.getJSON() : 스프링에 요청시 데이터를 json으로 받는 기능으로 ajax기능 제공
        $.getJSON(url, function(secondCategoryList) {
          // console.log("2차카테고리", secondCategoryList)
          // console.log("2차카테고리 갯수", secondCategoryList.length + 1);

          // 2차카테고리 참조
          let secondCategory = $("#secondCategory");

          // ex) <option value='10'>바지</option>
          let optionStr = "";

          secondCategory.find("option").remove();
          secondCategory.append("<option value=''>2차 카테고리 선택</option>");

          for(let i=0; i<secondCategoryList.length; i++) {
            optionStr += "<option value='" + secondCategoryList[i].cg_code + "'>" + secondCategoryList[i].cg_name + "</option>";
          }

          // console.log("optionStr", optionStr);
          secondCategory.append(optionStr); // 2차카테고리에 <option> 태그들을 추가
        })
      });

      
    });
  </script>

</body>
</html>