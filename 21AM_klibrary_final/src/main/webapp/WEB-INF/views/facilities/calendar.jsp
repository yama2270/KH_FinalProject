<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <link href='${path }/resources/css/main.css' rel='stylesheet' />
    <script src='${path }/resources/js/main.js'></script>
    <script src='${path }/resources/js/main.min.js'></script>
    <script src='${path }/resources/js/locales-all.js'></script>
    <script src='${path }/resources/js/locales-all.min.js'></script>
    <script>
	
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
      
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>