<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>


    <h2>회원리스트</h2>
		<div="row">
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
		  	
		  	<c:choose>
		  	  <c:when test="${not empty list} ">
		  	    <c:forEach var="member" items="${list}">
		  	      <tr align="center">	 
		  					  	
				  		<td>${member.idx}</td>
				  		<td>${member.id}</td>
				  		<td>${member.name}</td>
				  		<td>${member.email}</td>
				  		<td>${member.phone}</td>
				  		<td>${member.joindata}</td>
				  	</tr>
				  	
				  </c:forEach>
				  </c:when>
			  </c:choose>
				  	
				  	
		  </table>
		
		
		
		</div>

</body>
</html>