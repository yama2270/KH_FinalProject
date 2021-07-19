<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
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
            <div id="titleheadname">편의시설 -> 자료복사</div>
            <div id="contbody">
                <div class="notice">
                    <div class="noticehead">이용안내</div>
                    <ul>
                        <li>도서관 자료복사는 저작권법에 의거하여 부분복사(1/3)만 가능</li>
                        <li>고서 원문 데이터베이스의 자료는 도서관 외부에서 직접 출력 가능</li>
                        <li>자료복사는 각 층의 복사실에서 가능하며, 외부 전문복사업체에서 복사실을 운영함</li>
                        <li>자료의 복사와 프린터 출력은 유료(저작권료 포함)</li>
                        <li>도서관을 방문하여 필요한 자료를 찾아 관내에서 직접 복사</li>
                        <li>출력: 도서관 홈페이지에서 원문자료 출력 (A4 1면 기준: 흑백 55원, 컬러 500원)</li>
                        <li>스캔: A4 1면 기준 100원</li>
                    </ul>
                    <table class="table">
                        <tr>
                            <th class="copfile">대상자료</th>
                            <th class="copy">이용방법</th>
                            <th class="money">요금(면당)</th>
                        </tr>
                        <tr>
                            <td class="copyfile">도서관소장자료</td>
                            <td class="copy">
                                <ul>
                                    <li>도서관을 방문하여 필요한 자료를 관내에서 직접 복사</li>
                                    <li>이용시간: 평일 09:00~21:00</li>
                                    <li>이용장소: 3~4층 복사실</li>
                                </ul>
                            </td>
                            <td class="money">
                                <ul>
                                    <li>A4 기준: 40원</li>
                                    <li>B4 기준: 60원</li>
                                    <li>A3 기준: 80원</li>
                                </ul>
                            </td>
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