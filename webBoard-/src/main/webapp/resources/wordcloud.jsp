<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script type=”text/javascript” src=”https://www.google.com/jsapi”></script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  
 

<script>

 var oauth_verifier="";
 var oauth_token="";
 
 $(function(){
	$("#btn").click(function(){
	  /*  window.open("","pop","width=550, height=320");
		$("#form").attr({
			"action":'/admin2/adadmin3.do',
			"target":"pop" */
					
		 $.ajax({
		    url : '/admin2/wordcloud.do',
		    dataType:'text',
		    success : function(data) {
		    	alert(data)
		   
			   

		 }
		 })
	})

	
	$("#btn1").click(function(){
		$.ajax({
		    url : '/admin2/twitter.do',
		    dataType:'text',
		    success : function(data) {
		    	if(data=="success"){
		    		alert("발송완료"+data)
		    	}
		    }
		})
	})
	
	
	 
 })

    

 



</script>
</head>
<body>
<div id=”chart_div”></div>
<div id="fb-root"></div>
 <form id=form>
	<input type="button" value="등록하기" id="btn" />

</form>
<div id="url"></div>

 <img src="/graph/whale_small.png" alt="" />
 <img src="/graph/whale_wordcloud_small.png" alt="" />
    <c:if test="${empty tweet}" >
           트윗이 없습니다.
    </c:if>
    
	<c:forEach var="t" items="${tweet}" >
          ${tweet} 
    </c:forEach>


</body>
</html>