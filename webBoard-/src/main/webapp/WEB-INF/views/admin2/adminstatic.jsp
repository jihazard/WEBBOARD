<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
               
                  <img src="/graph/pieChart.jpg" alt="" />
               
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
		  	
		  	<c:if test="${empty list1}">
		  	 <tr>
		  	 	<td colspan=5>"등록된 회원이 없습니다.</td>
		  	 
		  	 </tr>
		  	
		  	</c:if>
		  	
		  
		  	   <c:forEach var="member" items="${list1}">
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