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
		    url : '/admin2/adadmin3.do',
		    dataType:'text',
		    success : function(dataresult) {
		    	window.open(dataresult, name, "width=200","height=100");
		      
              alert(dataresult);
	/* 	    })
		    $("#form").submit(); */
		
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
	<input type="button" value="발송하기" id="btn1" />
</form>

</body>
</html>