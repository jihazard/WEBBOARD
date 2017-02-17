<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>

<!--IE8이하 적용/--> 
<!--[if lt IE 9]>
	<script src="./js/html5shiv.js"></script>
<![endif]--> 
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/chk.js"></script>
<script>
	var xnum=0;
    var b_num="<c:out value='${detail.b_num}' />"
	$(function(){
		listAll(b_num);
		//글 삭제 ajax 처리
		
/* 		$(document).on("click",".deletebtn",function(){
			 var r_num=$(this).parents("li").attr("data-num");
			 alert(r_num)
			 if(confirm("선택하신 댓글을 삭제 하겠습니까?")){
				 $.ajax({
					 type:'DELETE',
					  url:'/replies/'+r_num+".do",
					 headers:{
						 
						"Content-Type":"application/json",
						"X-http-Method-Override":"DELETE"
					 },
					 dataTyep : "TEXT",
					 error:function(){
						 alert("삭제 실패 관리자에게 문의하세요 ㅇ")
					 },
					 success:function(result){
						 if(result=='SUCCESS'){
							 alert("삭제 완료되었습니다.");
						 	listAll(b_num);
						 }
					 }
					 
				 })
				 
			 }	
		}) */
		
		
		//글 수정 ajax
		$(document).on("click",".update_btn",function(){
						
		  var r_num=$(this).parents("li").attr("data-num");
		  var r_content=$("#content").val();
		  if(!chkSubmit($("#content"),"댓글 내용을")) return;
		  else{
			  $.ajax({
				  url:'/replies/'+r_num+".do",
				  type:'put',
				  headers:{
					  "content-Type":"application/json",
						"X-HTTP-Method-Override":"put"
					  
				  },
				  data:JSON.stringify({
					 r_content:r_content
					  
				  }),
				  dataType:'text',
				  success:function(result){
					  console.log("result:"+result)
					  if(result=="SUCCESS"){
						  alert("수정완료했습니다.")
						  listAll(b_num)
					  }
				  }
			  })
			  
		  }
			
			
		})
	//삭제버튼 클릭 시 비밀번호 체크 
    $(document).on("click",".deletebtn",function(){
    	  var r_num=$(this).parents("li").attr("data-num");
    	  var context=$(this).parents("li").children().eq(1).html();
    	   $(this).parents("li").find("input[type='button']").hide();
    	   var conArea=$(this).parents("li").children().eq(1);
    	   conArea.html("");
    	   
    		var data="<div class='posi'><input type='text' class='pwdvalue' name='pwdvalue'>"
    		data+="<input type='button' class='pwdchk_btn' value='비밀번호확인'> ";
    		data+="<span class='msg'>비밀번호를 입력해주세요</span></div>";
    		
    		conArea.html(data);
    		
    		$(document).on("click", ".pwdchk_btn ",function(){
    			alert("비번확인")
    			var b_pwd=$(".pwdvalue").val();
    			
    			if(!chkSubmit($('.pwdvalue'),'비밀번호를')) return;
    			else{
    				$.ajax({
    					url: "/replies/pwdchk.do",
    					type:"post",
    					headers:{
    						"content-Type":"application/json",
    						"X-HTTP-Method-Override":"POST"
    					},
    					data: JSON.stringify({
    						r_num:r_num,
    						r_pwd:b_pwd
    						
    					}),
    					error:function(){
    						alert("비번일치 하지 않습니다. 관리자에게 문의하세요")
    					},
    					success:function(result){
    						if(result=="SUCCESS"){
    							alert("비번이 일치합니다.")
    							
    							 alert(r_num)
    							 if(confirm("선택하신 댓글을 삭제 하겠습니까?")){
    								 $.ajax({
    									 type:'DELETE',
    									  url:'/replies/'+r_num+".do",
    									 headers:{
    										 
    										"Content-Type":"application/json",
    										"X-http-Method-Override":"DELETE"
    									 },
    									 dataTyep : "TEXT",
    									 error:function(){
    										 alert("삭제 실패 관리자에게 문의하세요 ㅇ")
    									 },
    									 success:function(result){
    										 if(result=='SUCCESS'){
    											 alert("삭제 완료되었습니다.");
    										 	listAll(b_num);
    										 }
    									 }
    									 
    								 })
    								 
    							 }else{
    								 listAll(b_num);
    							 }	
    						}//success if
    						
    					}//success
    					
    				})
    				
    				
    			}
    		})
    		
    	  	
    	
    		
    	});
	
	//수정버튼 클릭 시 비밀번호 체크	
    $(document).on("click",".updatebtn",function(){
    	  var r_num=$(this).parents("li").attr("data-num");
    	  var context=$(this).parents("li").children().eq(1).html();
    	   $(this).parents("li").find("input[type='button']").hide();
    	   var conArea=$(this).parents("li").children().eq(1);
    	   conArea.html("");
    	   
    		var data="<div class='posi'><input type='text' class='pwdvalue' name='pwdvalue'>"
    		data+="<input type='button' class='pwdchk_btn' value='비밀번호확인'> ";
    		data+="<span class='msg'>비밀번호를 입력해주세요</span></div>";
    		
    		conArea.html(data);
    		
    		$(document).on("click", ".pwdchk_btn ",function(){
    			alert("비번확인")
    			var b_pwd=$(".pwdvalue").val();
    			
    			if(!chkSubmit($('.pwdvalue'),'비밀번호를')) return;
    			else{
    				$.ajax({
    					url: "/replies/pwdchk.do",
    					type:"post",
    					headers:{
    						"content-Type":"application/json",
    						"X-HTTP-Method-Override":"POST"
    					},
    					data: JSON.stringify({
    						r_num:r_num,
    						r_pwd:b_pwd
    						
    					}),
    					error:function(){
    						alert("비번일치 하지 않습니다. 관리자에게 문의하세요")
    					},
    					success:function(result){
    						if(result=="SUCCESS"){
    							alert("비번이 일치합니다.")
    							conArea.html("");
    							var data="<textarea name='content' id='content'>"+context+"</textarea>";
    				    		data+="<input type='button' class='update_btn' value='수정완료'>";
    				    		data+="<input type='button' class='reset_btn' value='취소'>";
    				    		conArea.html(data); 
    						}
    						
    					}
    					
    				})
    				
    				
    			}
    		})
    		
    	  	
    	
    		
    	});
    	
    	$(document).on("click", ".reset_btn",function(){
    		var context =$(this).parents("li").find("textarea").html();
    		$(this).parents("li").find("input[type='button']").show();
    		var conArea=$(this).parents("li").children().eq(1);
    		conArea.html(context);
    	}) 
    	 
    	
    	
	
		
	$("#replyInsert").click(function(){
		alert("클릭")
		alert(b_num)
		if(!chkSubmit($('#r_name'),'이름을')) return;
		else if(!chkSubmit($('#r_pwd'),'비밀번호를')) return;
		else if(!chkSubmit($('#r_content'),'리플을')) return;
		else {
			var inserturl="/replies/replyinsert.do";
			$.ajax({
				url:inserturl,
				type:"post",
				headers:{
					"content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				data: JSON.stringify({
					b_num:b_num,
					r_name:$("#r_name").val(),
					r_pwd:$("#r_pwd").val(),
					r_content:$("#r_content").val(),
				}),
				error:function(){
					alert("등록 실패 관리자에게 문의하세요")
				},
				success:function(result){
					if(result=="SUCCESS"){
						alert("업데이트 되었습니다.")
						listAll(b_num);
						datareset()
					}
					
				}
				
			})
		}
		
	})	
		
	})
	
	function listAll(b_num){
		$("#comment_list").html("");
		var url="/replies/all/"+b_num+".do";
		$.getJSON(url,function(data){
			console.log(data.length);
			
			
			$(data).each(function(){
				var r_num=this.r_num;
				var r_name=this.r_name;
				var r_content=this.r_content;
				var r_date=this.r_date;
				addNewItem(r_num,r_name,r_content,r_date);
				
			})
			
		}).fail(function(){
			alert("댓글 불러오는데 실패했습니다.")
		})
	}
	function addNewItem(r_num,r_name,r_content,r_date) {
		
		var new_li=$("<li>");
		new_li.attr("data-num",r_num);
		
		var writer_p=$("<p>")
		
		var name_span=$("<span>");
		name_span.html(r_name+"    님        ");
		
		var date_span=$("<span>");
		date_span.html("/"+r_date+"      ");
		
		var content_p=$("<p>");
		content_p.html(r_content);
		
		
		var editbtn = $("<input>");
        editbtn.attr({
            "type": "button",
            "value": "수정하기",
            "class" :"updatebtn"
        });        
		
        var deletebtn = $("<input>");
        deletebtn.attr({
            "type": "button",
            "value": "삭제하기",
            "class" :"deletebtn"
        });        
		
		  writer_p.append(name_span).append(date_span).append(editbtn).append(deletebtn);
		  new_li.append(writer_p).append(content_p);
		  $("#comment_list").append(new_li);
		
	}
	function datareset(){
		
		r_name:$("#r_name").val("")
		r_pwd:$("#r_pwd").val("")
		r_content:$("#r_content").val("")
	}


</script>
</head>
<body>
	<div class="row">
        <div class="col-md-10">
           <div class="well">
			<form id="comment_form">
				<table>
				  
					<tr>
			
						<td class="rc">
												
						<label for="r_name">작성자</label>
						
						
						
						</td>
						<td><input type="text" name="r_name" id="r_name"></td>
						<td class="rc"><label for="r_pwd">비밀번호</label></td>
						<td><input type="password" name="r_pwd" id="r_pwd"></td>
						<td><input type="button" id="replyInsert" value="저장"></td>
					</tr>
					<tr>
						<td class="rc"><label for="r_content">댓글 내용</label></td>
						<td colspan="4">
							<textarea name="r_content" id="r_content" cols="60" rows="8"></textarea>
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>
	
	
	<div class="row">
        <div class="col-md-10">
           <div class="well">
           
           <ul id="comment_list"></ul>
           
           </div>
           </div>
           </div>
	
	
	
	</body>
	</html>