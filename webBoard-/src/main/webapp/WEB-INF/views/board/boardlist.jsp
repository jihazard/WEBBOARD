<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/chk.js"></script>
<link rel="stylesheet" href="/resources/include/css/bootstrap.css" />
<script src="/resources/include/js/bootstrap.min.js"></script>

<style>
.paginate{width:100%; height:20px; text-align: center;vertical-align: top;}
.paginate span. textAn{vertical-align: bottom;}
.paginate a.on{color: #FF3300;}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	$(function(){
		
		     var word="<c:out value='${key.keyword}' />"
			
	
			if(word!=""){
				$("#keyword").val("<c:out value='${key.keyword}'/>");
				$("#option").val("<c:out value='${key.option}'/>");
			
			if($("#option").val()!='b_content'){	
				
				if($("#option").val()=='b_title')value="#list tr td .number";
				else if($("#option").val()=='b_name')value="#list tr td .name";
				
			$("#list tr td:contains('"+word+"')").each(function(){
				var regex=new RegExp(word,'gi');
				$(this).html($(this).text().replace(regex,"<span class='required'>"+word+"</span>"))
				
			})
			}
		   } //if word 종료

		     if("<c:out value='${key.pagesize}' />"!=""){
				   $("#pagesize").val("<c:out value='${key.pagesize}'/>")
			   }
		   
		     
		   //검색대상 변경될 때마다 처리 이벤트
		   $("#option").change(function(){
			   if($("#option").val()=="all"){
				   $("#keyword").val("전체 데이터 조회합니다.");
				   
			   }else if($("#option").val()!="all"){
				   $("#keyword").val("");
				   $("#keyword").focus("");
			   }
		   })
		   
		   //검색 버튼 클릭 시 처리 이벤트
		   $("#searcbtn").click(function(){
			   if($("#option").val()!="all"){
				   if(!chkSubmit($('#keyword'),"검색어를")) return;
			   }
			   goPage(1)
		   })
		   
		   
		   $(".order").click(function(){
			   var order_by=$(this).attr("data-value");
			   
			   $("#order_by").val(order_by);
			   	if($("#order_sc").val()=='desc'){
			   		$("#order_sc").val('asc');
			   		
			   	}else{
			   		$("#order_sc").val('desc')
			   	}
			   	goPage(1)
		   })
		   
		   
		   $("#pagesize").change(function(){
			   goPage(1);
		   })
		   
		   
		     
		
		$("#searchbtn").click(function(){
			alert($("#option").val())
			alert($("#keyword").val())
			
			$("#searchform").attr({
				"method":"get",
				"action":"/board/boardlist.do"
			})
			$("#searchform").submit();
			
			
		})
		
		$("#writebtn").click(function(){
			location.href="/board/boardwriter.do"
			
		})
		
		$(".number").click(function(){
			var b_num=$(this).parents("tr").attr("data-num");
			$("#b_num").val(b_num);
			
			$("#listform").attr({
				"method":"GET",
				"action":"/board/boarddetail.do"
				
			})
			$("#listform").submit();
			
			
			
			
		})
		
	})

	
	function goPage(page){
		if($("#option").val()=="all"){
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#searchform").attr({
			"method":"get",
			"action":"/board/boardlist.do"
			
		})
		$("#searchform").submit();
		
	}
	

</script>

<title>Insert title here</title>

</head>

<body>
${key.pagesize}
${total}

<div class="row">
  <div class="col-md-10">
  
  <div id="search" class="form-group">
  	<form id="searchform">
  	  <input type="hidden"   id="page" name="page" value="${key.page}"/>
    <input type="hidden"   id="order_by" name="order_by" value="${key.order_by}"  />
    <input type="hidden"   id="order_sc" name="order_sc" value="${key.order_sc}"  />
  	<div class="col-sm-2">
     <select id="option" name="option">
     
     		<option value="all" id="option" >전체</option>
     		<option value="b_title" id="option">제목</option>
     		<option value="b_date" id="option">날짜</option>
     		<option value="b_name" id="option">작성자</option>
     
     </select>	
     </div>
  	  	     
     <div class="col-sm-4">
      <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색" >
    </div>
 
  	<input type="button" class="btn btn-default" id="searchbtn" value="검색" />
  	
  	<div class="col-sm-1">
  	<select id="pagesize" name="pagesize">
     
     		<option value="1" id="pagesize" >1줄</option>
     		<option value="2" id="pagesize" >2줄</option>
     		<option value="3" id="pagesize" >3줄</option>
     		<option value="4" id="pagesize" >4줄</option>
     		<option value="5" id="pagesize" >5줄</option>
        
     </select>	
  	</div>
  	
  	</form>
  
  </div>
  
  
  <!--검색기능을 위한 hidden form  -->


  <form id="listform">
    <input type="hidden"  id="b_num" name="b_num" />

  </form>
  
  
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

 <div id="boardPage" class="text-center">
 	<tag:paging page="${param.page }" total="${total}" list_size="${key.pagesize}"/>
 
 </div>

  <div id="btnpo">
  <input type="button" class="btn btn-success" value="글쓰기 버튼" id="writebtn" />
  </div>

	</div>
</div>






  
</body>
</html>