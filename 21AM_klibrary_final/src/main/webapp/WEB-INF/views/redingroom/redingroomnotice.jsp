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
            <div id="titleheadname">열람실안내 -> 이용안내</div>
            <div id="contbody">
                <div class="readingroombody">
                    <h2>열람실 좌석 이용 안내</h2>
                    <div>
                        <h3>로그인</h3>
                        <ul>
                            <li>회원가입을 하지 않은 경우 먼저 홈페이지에서 회원가입을 하시기 바랍니다</li>
                        </ul>
                        <h3>열람실 선택</h3>
                        <ul>
                            <li>원하는 열람실을 선택합니다.</li>
                        </ul>
                        <h3>좌석 선택</h3>
                        <ul>
                            <li>선택가능한 좌석 중에서 원하는 좌석을 선택합니다.</li>
                            <li>자리가 다 차서 선택이 불가능할 수 있습니다.</li>
                        </ul>
                    </div>
                    <table class="table">
                        <tr>
                            <th class="readingroomtablehead" rowspan="5";>열람실 이용제한</th>
                            <th class="readingroomtablehead2">구분</th>
                            <th class="readingroomtablehead2">
                                30분이상 장기이석<br>
                                퇴실 미처리,<br>
                                외출 미복귀
                            </th>
                            <th class="readingroomtablehead2">
                                대리발권<br>
                                (다수발권)
                            </th>
                        </tr>
                        <tr>
                            <td class="readingroomred">1회</td>
                            <td class="readingroomtablehead2">당일퇴실</td>
                            <td class="readingroomtablehead2">당일퇴실</td>
                        </tr>
                        <tr>
                            <td class="readingroomred">2회</td>
                            <td class="readingroomtablehead2">당일포함 3일</td>
                            <td class="readingroomtablehead2">당일포함 3일</td>
                        </tr>
                        <tr>
                            <td class="readingroomred">3회</td>
                            <td class="readingroomtablehead2">당일포함 7일</td>
                            <td class="readingroomtablehead2">당일포함 7일</td>
                        </tr>
                        <tr>
                            <td class="readingroomred">4회</td>
                            <td class="readingroomtablehead2">당일포함 15일</td>
                            <td class="readingroomtablehead2">당일포함 15일</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>

<script>
    
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