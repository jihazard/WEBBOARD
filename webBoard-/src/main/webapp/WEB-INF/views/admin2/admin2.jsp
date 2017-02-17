<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script>
   $(function(){
	   $("#search").click(function(){
		   
		   alert($("#start").val())
		   alert($("#end").val()) 
		   
		   $("#searchform").attr({
			  "method":"post",
			  "action":"/admin2/admin2.do"
		   })
		   
		   $("#searchform").submit();
	   })
	   
	
	   $("#excel").click(function(){
		   
		   $("#searchform").attr({
				  "method":"get",
				  "action":"/admin2/excel.do"
			   })
			   
			   $("#searchform").submit();
		   })
		 		   
	   
   })
  
    
  </script>
</head>



      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      
      
      <div class="box box-danger">111</div>
        <div class="box-tools pull-center"></div>
      
      <div class="row">
      <div class="col-md-8">    
      <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">게시글 테이블</h3>

                  <div class="box-tools pull-right">
                    <span class="label label-danger">테이블 검색 </span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="   " data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                 <!-- /.box-header -->
                <div class="box-body no-padding">
                  
                   <!--본문영역  -->
                  
         
      
      
           
          <div class="table-responsive">
            <!--검색영역  -->
                  <div class="row">
         
          
          <div class="form-group">
      
    		<form class="form-inline" id="searchform">
    		
    		<div class="col-md-6">
    			
    			<div class="col-md-8"> <input type="date" id="start" name="start"/>
    			<input type="date" id="end" name="end" /></div>
    			<div class="col-md-4"><input type="button" class="btn btn-success btn-sm" value="검색" id="search"/> 
    			 <input type="button" class="btn btn-success btn-sm" value="excel" id="excel"/>
    			    			</div>
    			
    					
    		</div>
    		
    			
          </form>
          </div>
                    
          </div> 
            
            
            
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
  		<th>조회수 그래프</th>
  	</tr>
  	</thead>
  	<tbody id="list">
  <c:if test="${empty data }">
	  <tr>
	  <td colspan=5> 등록 정보가 존재하지않습니다.	  
	  </tr>
  </c:if>
  <c:forEach var="l" items="${data}">
   
  	<tr  data-num="${l.b_num}">
  		<td>${l.b_num}</td>
  		<td class="name">${l.b_name}</td>
  		<td class="number">${l.b_title}</td>
  		<td>${l.hit}</td>
  		<td>${l.b_date}</td>
  		<td class="col-md-3">  		
  		  <div class="progress">
          <div class="progress-bar progress-bar-success progress-bar-striped" style="width: ${l.hit}%" role="progressbar" aria-valuenow="${l.hit}" aria-valuemin=0 aria-valuemax="200">
          <span class="sr-only">20% Complete</span>
           </div></div>
  		</td>
  	</tr>
  </c:forEach>
  
  </tbody>
  </table>
            
             
            
            
          </div>
      
            
               </div><!--box-body no-padding  -->
               </div> <!--box box-danger -->
         </div>
         </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Your Page Content Here -->
      
         
      <!--최신 멤버 -->
      <div class="col-md-8">
              <!-- USERS LIST -->
              <div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">Static</h3>

                  <div class="box-tools pull-right">
                    <span class="label label-danger">chart</span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                 
               <!--차트영역  -->  
               <div>
               
                  <img src="/graph/pieChartagestatic.jpg" alt="" />
                  <img src="/graph/pieChartsexstatic.jpg" alt="" />
                   <img src="/graph/pieChartbar.jpg" alt="" />
               
               </div>    
                   
    <h2></h2>
		<div class="row">
		  <table class="table table-bordered">
		  	<tr>
		  		<td>회원번호</td>
		  		<td>아이디</td>
		  		<td>이름</td>
		  		<td>이메일</td>
		  		<td>핸드폰</td>
		  		<td>등록일</td>
		  	</tr>
		  	
		  	<c:if test="${empty list}">
		  	 <tr>
		  	 	<td colspan=5>"등록된 회원이 없습니다.</td>
		  	 
		  	 </tr>
		  	
		  	</c:if>
		  	
		  
		  	   <c:forEach var="member" items="${list}">
		  	      <tr align="center">	 
		  					  	
				  		<td>${member.idx}</td>
				  		<td>${member.userid}</td>
				  		<td>${member.username}</td>
				  		<td>${member.email}</td>
				  		<td>${member.phone}</td>
				  		<td>${member.joindate}</td>
				  	</tr>
				  	
				  </c:forEach>
		
				  	
				  	
		  </table>
		
                   
                </div>
                <!-- /.box-body -->
               
                <!-- /.box-footer -->
              </div>
              <!--/.box -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
      
      
      
  
      
      
      
      
      
      

   