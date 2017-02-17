<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/chk.js"></script>
<link rel="stylesheet" href="/resources/include/css/bootstrap.css" />
<script src="/resources/include/js/bootstrap.min.js"></script>

    <title>Dashboard Template for Bootstrap</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>


    <!-- Bootstrap core CSS -->
    <link href="/resources/include/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/resources/include/admin/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/admin/assets/dashboard.css" rel="stylesheet">



    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <script>
   $(function(){
	   $("#search").click(function(){
		   
		   alert($("#start").val())
		   alert($("#end").val()) 
		   
		   $("#searchform").attr({
			  "method":"post",
			  "action":"/admin/admin.do"
		   })
		   
		   $("#searchform").submit();
	   })
	   
	   
	   
   })
  
  
  
  </script>
  
  </head>
   


  </script>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">회원리스트</a></li>
            <li><a href="#">게시판 리스트</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
        
          </ul>
          <ul class="nav nav-sidebar">
      
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          
          
         
          
          
          <h2 class="sub-header">Section title</h2>
          
          
           <div class="row">
          <div class="well">
          <div class="form-group">
      
    		<form class="form-inline" id="searchform">
    		
    		<div class="col-md-6">
    	
    			<div class="col-md-3"> <input type="date" id="start" name="start"/></div>
    			<div class="col-md-3"> <input type="date" id="end" name="end" /></div>
    			<div class="col-md-2"><input type="button" class="btn btn-success btn-sm" value="검색" id="search"/>   </div>			
    		</div>
    		
    			
          </form>
          </div>
          </div>
                    
          </div> 
          
          
          
          <div class="table-responsive">
            
            <table class="table table-hover">
   <thead>
  	<tr class=".success">
  		<th data-value="b_num" class="order" >글번호
  	  <c:choose>
  		    <c:when test="${key.order_by=='b_num' and key.order_sc=='asc'}"> ㅗ </c:when>
  		    <c:when test="${key.order_by=='b_num' and key.order_sc=='desc' }"> ㅜ </c:when>
  		    <c:otherwise>ㅗ </c:otherwise>
  		    </c:choose> 
  		    </th>
  		
  		<th >이름</th>
  		<th >타이틀</th>
  		<th >조회수</th>
  		<th data-value="b_date" class="order">작성일
  		   <c:choose>
  		    <c:when test="${key.order_by=='b_date' and key.order_sc=='asc'}"> ㅗ </c:when>
  		    <c:when test="${key.order_by=='b_date' and key.order_sc=='desc' }"> ㅜ </c:when>
  		    <c:otherwise>ㅗ </c:otherwise>
  		    </c:choose> 
  		</th>
  	</tr>
  	</thead>
  	<tbody id="list">
  <c:if test="${empty data }">
	  <tr>
	  <td colspan=4> 등록 정보가 존재하지않습니다.	  
	  </tr>
  </c:if>
  <c:forEach var="l" items="${data}">
   
  	<tr  data-num="${l.b_num}">
  		<td>${l.b_num}</td>
  		<td class="name">${l.b_name}</td>
  		<td class="number">${l.b_title}</td>
  		<td>${l.hit}</td>
  		<td>${l.b_date}</td>
  	</tr>
  </c:forEach>
  
  </tbody>
  </table>
            
            
            
            
            
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/resources/include/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/resources/include/admin/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/admin/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
