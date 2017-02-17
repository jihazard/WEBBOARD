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

<script>
	$(function(){
		var b_num=${detail.b_num}
		$("#b_num").val(b_num);
	
		$("#listbtn").click(function(){
			location.href="/board/boardlist.do"
			
		})
		
		$("#deletebtn").click(function(){
			alert(b_num)
			var question=confirm("삭제 하시겠습니까?")
			if(question==1){
			$("#detailform").attr({
				"method" : "post",
				"action" : "/board/boarddelete.do"
			})
			
			$("#detailform").submit();
			}else
				   alert("삭제가 취소되었습니다.")
			
		})
		
		
		$("#updatebtn").click(function(){
			alert(b_num)
			$("#detailform").attr("action" , "/board/boardupdateform.do");
			$("#detailform").submit();
		})
		
	})

</script>

</head>
<body>
<div class="row">
<div class="col-md-10">
<h1>디테일</h1>

	<form id="detailform">
	 <input type="hidden" id="b_num" name="b_num" />
	</form>

 
<div class="well">
<form class="form-horizontal" id="writeform">
  
 
  <div class="form-group">
    <label for="b_name" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-10">
      ${detail.b_name}
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="b_title" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-10">
            ${detail.b_title}
      
    </div>
  </div>
  
    <div class="form-group">
    <label for="b_content" class="col-sm-2 control-label">내 용</label>
    <div class="col-sm-10">
           ${detail.b_content}
     
    </div>
  </div>
  
   




  <div class="form-group">
  <label  class="col-sm-2 control-label"></label>
    <div class="col-sm-10">
      <input type="button" class="btn btn-success" value="수정" id="updatebtn">
      <input type="button" class="btn btn-success" value="삭제" id="deletebtn">
      <input type="button" class="btn btn-success" value="리스트" id="listbtn">
    </div>
    
    </div>
</form>
  </div>


	
</div>
</div>


<div id="replypo">

<jsp:include page="reply.jsp"></jsp:include>


</div>


</body>
</html>