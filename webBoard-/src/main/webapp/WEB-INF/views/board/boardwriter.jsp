<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		//[리스트 버튼] 클릭 시 리스트로 이동 
		$("#listbtn").click(function(){
			location.href="/board/boardlist.do";
			
		})
		
		
		$("#writebtn").click(function(){
		
			if(!chkSubmit($("#b_name"),'이름을'))return;
			else if(!chkSubmit($("#b_title"),'제목을'))return;
			else if(!chkSubmit($("#b_content"),'내용을'))return;
			else{
				
				$("#writeform").attr({
					"method":"post",
					"action":"/board/boardinsert.do"
					
				})
				$("#writeform").submit();
				
			}//else
			
		})
		
		
		
	})


</script>

</head>
<body>
<div class="row">
<div class="col-md-10">
<h1>글쓰기</h1>


<div class="well">
<form class="form-horizontal" id="writeform">
  
 
  <div class="form-group">
    <label for="b_name" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="b_name" name="b_name" >
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="b_title" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="b_title" name="b_title">
    </div>
  </div>
  
    <div class="form-group">
    <label for="b_content" class="col-sm-2 control-label">내 용</label>
    <div class="col-sm-10">
      
       
    
                    <textarea id="b_content" name="b_content" rows="10" cols="80">
                                            This is my textarea to be replaced with CKEditor.
                    </textarea>
    
         
      
      
    </div>
  </div>
  
   <div class="form-group">
    <label for="b_pwd" class="col-sm-2 control-label">비밀번호</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="b_pwd" name="b_pwd" >
    </div>
  </div>





  <div class="form-group">
  <label  class="col-sm-2 control-label"></label>
    <div class="col-sm-10">
      <input type="button" class="btn btn-success" value="등록" id="writebtn">
      <input type="button" class="btn btn-success" value="리스트" id="listbtn">
    </div>
    
    </div>
</form>
  </div>


	
</div>
</div>

</body>
</html>