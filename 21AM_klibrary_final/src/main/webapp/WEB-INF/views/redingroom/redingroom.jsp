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
	              <li class="list-group-item" onclick="location.assign('${path}/notice/booktime.do')">이용시간</li>
	              <li class="list-group-item">편의시설 <i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li onclick="location.assign('${path}/notice/copymachine.do')">자료복사</li>
	                    <li onclick="location.assign('${path}/notice/parkinglot.do')">주차안내</li>
                    </ul>
	              </li>
	              <li class="list-group-item">열람실 안내<i class="fas fa-plus"></i>
	              	<ul class="submenu">
	                    <li onclick="location.assign('${path})">열람실 A</li>
	                    <li onclick="location.assign('${path})">열람실 B</li>
	                    <li onclick="location.assign('${path})">열람실 C</li>
	                    <li onclick="location.assign('${path})">열람실 D</li>
	                    <li onclick="location.assign('${path})">열람실 E</li>
	                    <li onclick="location.assign('${path}/notice/redingroomnotice.do')">열람실이용안내</li>
                    </ul>
	              </li>
	            </ul>
        	</div>
        <div id="he_right">
            <div id="titleheadname">열람실안내 -> 좌석예약</div>
            <div id="contbody">
                <div class="roombody">
                    <div class="roomhead">
                        <h2>열람실 A</h2>
                        <div class="roomall">
                            <table>
                                <tr>
                                    <th class="classbody">총좌석 : </th>
                                    <th class="classbody">이용좌석 :</th>
                                    <th class="classbody">잔여좌석 :</th>
                                    <th class="classbody">사용불가 :</th>
                                </tr>
                            </table>
                        </div>
                        <div class="menu">사용중</div>
                        <div class="menu2">이용불가</div>
                        <div class="menu3">사용가능</div>
                        <div class="classinfo">
                            <button onclick="seat();">1</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<script>
    
    const seat=()=>{
       open("readingroomseat.html","_blank","height=700,width=700");
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