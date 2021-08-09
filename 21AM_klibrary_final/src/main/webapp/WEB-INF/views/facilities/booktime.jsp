<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/main.js"></script> 
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>   
<link rel="stylesheet" href="${path }/resources/css/main.css">   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="도서관일정"/>
</jsp:include>
<body>
        <div class="divcontainer1">
    <br>
    	<h2 id="title11">이용시간</h2>
    <br>
  </div>
    <section id="ad_containerad">
        <div class="list-group-containers" >
	            <ul class="list-group">
	              <li class="list-group-item" id="menutitle">이용안내</li>
	              <li class="list-group-item" onclick="location.assign('${path}/notice/booktime.do')">이용시간</li>
	              <li class="list-group-items">편의시설 <i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/copymachine.do')">자료복사</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/parkinglot.do')">주차안내</li>
                    </ul>
	              </li>
	              <li class="list-group-items">열람실 안내<i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomA.do')">열람실 A</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomB.do')">열람실 B</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomC.do')">열람실 C</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomD.do')">열람실 D</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomnotice.do')">열람실이용안내</li>
                    </ul>
	              </li>
	            </ul>
        	</div>
            <div id="he_right">
                <div id="titleheadnamec">이용시간
                <c:if test='${loginMember!=null && (loginMember.userId).equals("admin") }'>
                	<%-- <button class="btn btn-outline-dark" onclick="location.assign('${path }/notice/calendar.do')">일정추가</button> --%>
                	<button class="btn btn-outline-dark" onclick="setcalendar();">일정추가</button>
                </c:if>
                </div>
                
                <div id='calendar'></div>
                <div class="table3">
                    <div class="timehead">이용시간</div>
                    <table class="table4">
                        <tr>
                            <th class="tablehead">구분</th>
                            <th class="tablehead">월</th>
                            <th class="tablehead">화</th>
                            <th class="tablehead">수</th>
                            <th class="tablehead">목</th>
                            <th class="tablehead">금</th>
                            <th class="tablehead">토</th>
                            <th class="tablehead">일</th>
                        </tr>
                        <tr>
                            <td class="tablehead" id="timebody">A열람실</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                        </tr>
                        <tr>
                            <td class="tablehead" id="timebody">B열람실</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                        </tr>
                        <tr>
                            <td class="tablehead" id="timebody">C열람실</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                        </tr>
                        <tr>
                            <td class="tablehead" id="timebody">D열람실</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody">09:00~21:00</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                            <td class="tablehead" id="timebody2">휴관</td>
                        </tr>
                    </table>
                </div>
            </div>
    </section>
    
</body>
 
    <script>
    function setcalendar(){
    	open("${path }/notice/calendar.do","_blank","height=440,width=660");
    }
    
    
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
	    	    left: 'dayGridMonth',
	    	    center: 'title',
	    	  	right: 'prev,next today'
    	    },
    	    
    	    navLinks: true, // can click day/week names to navigate views selectable: true,
        	selectable: true,
        	selectMirror: true,
        	
        	
    	    locale: 'ko',
    	    events: [
    	
    	    	 {
    	             title : 'evt1',
    	             start : '2021-07-21'
    	         },
    	         {
    	             title    :    'evt2',
    	             start    :    '2021-07-10',
    	             
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
    
// navigation 이벤트
    
    $(function(){

        const naviList = $(".list-group").children();
        const options = $(".submenu")

        $(naviList).click((e)=>{
            $(naviList).children().not('i').hide();
            $(naviList).children().filter('i').attr("class","fas fa-plus");
            $(options).children().css({"font-size":"15px","fontWeight":"normal"})
            $(e.target).find("ul").show();
            $(e.target).find("i").attr("class","fas fa-minus");
           
        })

        // navigation - option 이벤트 

        $(options).mouseover((e)=>{
            $(e.target).css("textDecoration","underline");
        })

        $(options).mouseout((e)=>{
            $(e.target).css("textDecoration","");
        })

        $(options).click((e)=>{
            $(options).children().css({"font-size":"15px","fontWeight":"normal"})
            $(e.target).css({"font-size":"20px","fontWeight":"bold"})
            return false;
        })

    })
    
    $(function(){
		console.log(window.location.href );
		
		  
		  $(".list-group").children().eq(1).css({"backgroundColor" : "lightgrey"})
		  
			 	   
		})
    
    
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>