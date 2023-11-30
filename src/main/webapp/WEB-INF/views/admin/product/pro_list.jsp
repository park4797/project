<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@ include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
  
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="row"> <!-- <tr>과 같은 느낌. row 안에는 <td>를 합이 12까지 사용 가능하다. -->
        <div class="col-md-12"> <!-- <tr> 하나에 <td>를 하나만 쓰겠다는 의미 -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Product List</h3>
            </div>

            <div class="box-body">
              <div> <!-- 검색어 작업 -->
                <form action="/admin/product/pro_list" method="get">
                  <select name="type">
                    <option selected>검색종류선택</option>
                    <option value="N" ${pageMaker.cri.type == 'N' ? 'selected' : ''}>상품명</option>
                    <option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : ''}>상품코드</option>
                    <option value="P" ${pageMaker.cri.type == 'P' ? 'selected' : ''}>제조사</option>
                    <option value="NC" ${pageMaker.cri.type == 'NC' ? 'selected' : ''}>상품명 or 상품코드</option>
                    <option value="NP" ${pageMaker.cri.type == 'NP' ? 'selected' : ''}>상품명 or 제조사</option>
                    <option value="NPC" ${pageMaker.cri.type == 'NPC' ? 'selected' : ''}>상품명 or 상품코드 or 제조사</option>
                  </select>
                  <input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
                  <!-- 검색한 데이터 출력을 위해 pageNum과 amount 값을 필요로 한다. -->
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                  <button type="submit" class="btn btn-primary">검색</button>
                </form>
              </div>
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <th style="width : 2%"><input type="checkbox" id="checkAll"></th>
                    <th style="width : 8%">상품코드</th>
                    <th style="width : 25%">상품명</th>
                    <th style="width : 10%">상품가격</th>
                    <th style="width : 20%">상품등록일</th>
                    <th style="width : 15%">판매여부</th>
                    <th style="width : 10%">수정</th>
                    <th style="width : 10%">삭제</th>
                  </tr>

                  <!-- forEach문 내부에서는 id를 사용할 수 없다. -->
                  <c:forEach items="${pro_list}" var="productVO"> <!-- var = ProductVO class 성격이 된다. -->
                    <tr>
                      <td><input type="checkbox" name="check"></td>
                      <td>${productVO.pro_num}</td>
                      <td>
                        <!-- s_ 는 썸네일 이미지명 -->
                          <a class="move" href="#"><img src="/admin/product/imageDisplay?dateFolderName=${productVO.pro_up_folder}&fileName=s_${productVO.pro_img}"></a>
                          <a class="move pro_name" href="#" data-pro_num="${productVO.pro_num}">${productVO.pro_name}</a>
                      </td>
                      <td><input type="text" value="${productVO.pro_price}"></td>
                      <td><fmt:formatDate value="${productVO.pro_date}" pattern="yyyy-MM-dd" /></td>
                      <td>
                        <select id="pro_buy" name="pro_buy">
                          <option value="Y" ${productVO.pro_buy == 'Y' ? 'selected' : ''}>판매가능</option>
                          <option value="N" ${productVO.pro_buy == 'N' ? 'selected' : ''}>판매불가능</option>
                        </select>
                      </td>
                      <td><button type="button" class="btn btn-link">수정</button></td>
                      <td><button type="button" class="btn btn-danger">삭제</button></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <div class="box-footer clearfix">
              <div class="row">
                <div class="col-md-2">
                  <!-- 1) 페이지번호 클릭시 사용 [이전] 1 2 3 4 5 [다음], action="/admin/product/list"-->
                  <!-- 2) 목록에서 제목 클릭시 사용, actionForm.setAttribute("action", "/admin/product/get");-->
                  <form id="actionForm" action="" method="get">
                    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}" />
                    <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
                    <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
                  </form>
                </div>
                <div class="col-md-8 text-center">
                  <nav aria-label="...">
                    <ul class="pagination">
                      <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                          <a href="${pageMaker.startPage - 1}" class="page-link movepage">Previous</a> <!-- page-link movepage를 주어 페이징에 사용한 태그들을 관리한다 -->
                        </li>
                      </c:if>
                      <!--
                      begin과 end 속성은 반복 범위를 정의합니다.
                      pageMaker.startPage와 pageMaker.endPage 의 범위내에서 반복문을 수행한다.
                      num 은 반복되는 페이지 번호를 나타낸다.
                      -->
                      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                        <li class='page-item ${pageMaker.cri.pageNum == num ? "active":"" }'
                          aria-current="page">
                          <a class="page-link movepage" href="${num}" data-page="${num}">${num}</a>
                        </li>
                      </c:forEach>

                      <c:if test="${pageMaker.next}">
                        <li class="page-item">
                          <a href="${pageMaker.endPage + 1}" class="page-link movepage" href="#">Next</a>
                        </li>
                      </c:if>
                    </ul>
                  </nav>
                </div>
                <div class="col-md-2 text-right">
                  <button class="btn btn-primary" id="btn_pro_regist" role="button">상품등록</button>
                </div>
                  
              </div>
              
            </div>
          </div>
        </div>

    </div>
  </div>

    </section>
    <!-- /.content -->
</div>
  <!-- /.content-wrapper -->

	<!-- Main Footer -->
  <%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>

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

<script src="/bower_components/ckeditor/ckeditor.js"></script>
<script>
  // 동적코딩을 할 때 값을 변경하는 작업을 할때는 절차적으로 작업해야 한다.
  $(document).ready(function() {

    let actionForm = $("#actionForm");

    $(".movepage").on("click", function(event) {
      event.preventDefault();

      actionForm.attr("action", "/admin/product/pro_list");

      // actionForm 태그를 가지고 있는 하위요소중 input 태그의 name 이 pageNum인 것을 찾는 작업
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

      actionForm.submit();
    })

    $("#btn_pro_regist").on("click", function() {
      location.href="/admin/product/pro_regist";
    })
  });
</script>
</body>
</html>