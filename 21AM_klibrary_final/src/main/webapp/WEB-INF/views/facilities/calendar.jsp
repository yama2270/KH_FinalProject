<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path }/resources/css/main.css">   
<script src="${path }/resources/js/main.js"></script> 
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
 <script>
 var calendar;
 //DB에서 가져온값 일정에 넣어주기
 $(function(){
	 $.get("${path}/notice/eventCalendar.do",data=>{
		console.log(data); 
		$.each(data,function(i,s){
			let event={};
			event.title=s.calendartitle;
			let date=new Date(s.calendardate);
			console.log(date);
			console.log(date.getFullYear());
			event.start=date.getFullYear()+"-"+((date.getMonth()+1<10)?"0":"")+(date.getMonth()+1)+"-"+date.getDate();
			
			console.log(event);
			calendar.addEvent(event);
		})
		calendar.render();
	 });
 })
    document.addEventListener('DOMContentLoaded', function() {
    	  var calendarEl = document.getElementById('calendar');

    	  calendar = new FullCalendar.Calendar(calendarEl, {
    	    initialView: 'dayGridMonth',
    	    headerToolbar: {
	    	    left: 'addEventButton',
	    	    center: 'title',
	    	  	right: 'prev,next today'
    	    },
    	    
    	    navLinks: true, // can click day/week names to navigate views selectable: true,
        	selectable: true,
        	selectMirror: true,
        	
        	
    	    customButtons: {
    	      addEventButton: {
    	        text: '일정추가',
    	        click: function() {
    	          var dateStr = prompt('등록할날짜 0000-00-00');
    	          var content = prompt('등록할일정');
    	          var date = new Date(dateStr + 'T00:00:00'); // will be in local time

    	          if (!isNaN(date.valueOf())) { // valid?
    	            calendar.addEvent({
    	              title: content,
    	              start: dateStr,
    	              allDay: true
    	            });
    	            $.ajax({
    	            	url:"${path}/insertcalendar.do",
    	            	data: {"title":content,"str":dateStr},
    	            	//async:false,
    	            	success:data=>{
    	            		console.log(data);
		    	            alert('등록성공');
    	            	}
    	            });
    	          } else {
    	            alert('등록실패.');
    	          }
    	        }
    	      }
    	    },
    	    locale: 'ko',
    	    events: [
    	
    	    	 {
    	             title : 'evt1',
    	             start : '2021-07-21'
    	         },
    	         {
    	             title    :    'evt2',
    	             start    :    '2021-07-10',
    	             end    :    '2021-07-20'
    	         },
    	         {
    	             title    :    'evt3',
    	             start    :    '2019-09-25T12:30:00',
    	             allDay    :    false
    	         }
    	      ]   
    	  });
    	  calendar.render();
    	  
    	  
    	});
    
    
    
    </script>
    

 
<body>
    <div id='calendar'></div>
</body>
<script>
    function test(){
        close();
    }
</script>