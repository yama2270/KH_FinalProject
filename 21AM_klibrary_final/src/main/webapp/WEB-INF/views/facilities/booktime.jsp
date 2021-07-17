<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
<body id="ad_body">
        <header id="ad_header">
            <div id="header_title">K-도서관</div>
            <div id="header_options">
                <div id="header_moveMain">메인페이지</div>
                <div id="header_logout">로그아웃</div>
            </div>
        </header>
        <section id="ad_container">
           <div class="leftmenu" >
	            <ul class="list-group">
	              <li class="list-group-item" id="menutitle">이용안내</li>
	              <li class="list-group-item">이용시간</li>
	              <li class="list-group-item">편의시설 <i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li>자료복사</li>
	                    <li>주차안내</li>
                    </ul>
	              </li>
	              <li class="list-group-item">열람실 안내<i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li>열람실 A</li>
	                    <li>열람실 B</li>
	                    <li>열람실 C</li>
	                    <li>열람실 D</li>
	                    <li>열람실 E</li>
	                    <li>열람실이용안내</li>
                    </ul>
	              </li>
	            </ul>
        	</div>
            <div id="he_right">
                <div id="titleheadname">이용시간</div>
                
                <div id="calendarForm"></div>
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
                        <tr>
                            <td class="tablehead" id="timebody">E열람실</td>
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
        (function () {
            calendarMaker($("#calendarForm"), new Date());
        })();

    var nowDate = new Date();
    function calendarMaker(target, date) {
        if (date == null || date == undefined) {
            date = new Date();
        }
        nowDate = date;
        if ($(target).length > 0) {
            var year = nowDate.getFullYear();
            var month = nowDate.getMonth() + 1;
            $(target).empty().append(assembly(year, month));
        } else {
            console.error("custom_calendar Target is empty!!!");
            return;
        }

        var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
        var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


        var tag = "<tr>";
        var cnt = 0;
        //빈 공백 만들어주기
        for (i = 0; i < thisMonth.getDay(); i++) {
            tag += "<td></td>";
            cnt++;
        }

        //날짜 채우기
        for (i = 1; i <= thisLastDay.getDate(); i++) {
            if (cnt % 7 == 0) { tag += "<tr>"; }

            tag += "<td style='font-size:1rem'>" + i + "</td>";
            cnt++;
            if (cnt % 7 == 0) {
                tag += "</tr>";
            }
        }
        $(target).find("#custom_set_date").append(tag);
        calMoveEvtFn();

        function assembly(year, month) {
            var calendar_html_code =
                "<table class='custom_calendar_table'>" +
                "<colgroup>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "<col style='width:150px'/>" +
                "</colgroup>" +
                "<thead class='cal_date'>" +
                "<th><button type='button' class='prev'><</button></th>" +
                "<th colspan='5'><p><span>" + year + "</span>년 <span>" + month + "</span>월</p></th>" +
                "<th><button type='button' class='next'>></button></th>" +
                "</thead>" +
                "<thead  class='cal_week'>" +
                "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
                "</thead>" +
                "<tbody id='custom_set_date'>" +
                "</tbody>" +
                "</table>";
            return calendar_html_code;
        }

        function calMoveEvtFn() {
            //전달 클릭
            $(".custom_calendar_table").on("click", ".prev", function () {
                nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
                calendarMaker($(target), nowDate);
            });
            //다음날 클릭
            $(".custom_calendar_table").on("click", ".next", function () {
                nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
                calendarMaker($(target), nowDate);
            });
            //일자 선택 클릭
            $(".custom_calendar_table").on("click", "td", function () {
                $(".custom_calendar_table .select_day").removeClass("select_day");
                $(this).removeClass("select_day").addClass("select_day");
            });
        }
    }

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
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>