<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->

<html>
 <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    
    <script type="text/javascript">
     var data;
     var chart;
     var obj;
     var google_data;
      // Load the Visualization API and the piechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      
    
         
      
      function drawChart() {
       var url="/admin2/adadmin.do";
       
    
      var o =null;
      
	
/*    var x= $.ajax({
    	 
    	   url : '/admin2/adadmin.do',
           dataType:'json',
           async:false    	   
       }).responseText;
       
       alert(x)  */ 

    
       
     /*   var arr = new Array();

       for(var i=0; i < x.length; i++){

       arr[i] = [x[i].city, x[i].amount];
      
       } */
        
      /*  alert(arr[0])
       var data = new google.visualization.DataTable(x);
       data.addColumn('string', 'Topping');
       data.addColumn('number', 'Slices');
  
       data.addRows(arr);
   

        	
       var options = {'title':'How Much Pizza I Ate Last Night',
               'width':400,
               'height':300};

var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
chart.draw(data, options);  
       
         

        */
       
       
       

       
      $.ajax({
           url : '/admin2/adadmin.do',
           dataType:'json',
           success : function(dataresult) {
                obj = JSON.stringify(dataresult)
              /*  alert('data : '+dataresult.length);
               obj1=JSON.stringify(dataresult[2].city) */ //배열 접속
            
               alert("데이터 리설트"+dataresult)
               
               var list = new Array(); 
                             
               
               
              
               
               var arr = new Array();
               //var arr2 = new Array();

               for(var i=0; i < dataresult.length; i++){

               arr[i] = [dataresult[i].city, dataresult[i].amount];
              

               }
                alert("arr"+arr)
               var data = new google.visualization.DataTable();
               data.addColumn('string', 'Topping');
               data.addColumn('number', 'Slices');
               data.addRows(obj);
               
  
                	
               var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

       var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
       chart.draw(data, options);  
        
               
           }
           
       
       })
       
  
      }
      /*  var data = new google.visualization.DataTable();    
       
       
     	data = new google.visualization.DataTable();
       data.addColumn('string', 'city');
       data.addColumn('number', 'amount');
       
  		$.getJSON(url,function(data1){
			console.log(data.length);
			
			
			$(data1).each(function(){
				var city=		this.city;
				var amount=		this.amount;
				
			
				data.addRows([city,amount])
		          					
				
			})
			
		}).fail(function(){
			alert("카테고리 불러오는데 실패했습니다.")
		})
          
		  // Instantiate and draw our chart, passing in some options.
        chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        google.visualization.events.addListener(chart, 'select', selectHandler);
        chart.draw(data, options);
    
      
		
      }	
		
 */	
	

  /*         $.ajax({
              url : '/admin2/adadmin.do',
              dataType:'text',
              success : function(data) {
                  //obj = JSON.stringify(Data)
                  alert('data : '+data.length);
                  alert(data)
                  /* for (var i=0; i<obj.length; i++) {
					    var data = ""
					    for (key in obj[i]) {
					    data += key + " = " + obj[i][key] + " ";
					    alert(data);
					    }
					    

                  } */
                                   
              
     /*          },
                  error : function(xhr, type) {
                  alert('server error occoured')
              }
          }); */ 
    	  
   
          
       
          
          
         /*  data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);  */
        
       
    	  // Create our data table.
       
   
      


 

    </script>
  </head>
  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div" style="width:400; height:300"></div>
    <input type="button" id="btn" value="버튼고고" />
    
    ${list}
  </body>

</html>