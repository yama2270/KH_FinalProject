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
<body>
    <div class="divcontainer1">
    <br>
    <h2 id="title11">열람실 D</h2>
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
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomE.do')">열람실 E</li>
	                    <li class="list-group-itemss" onclick="location.assign('${path}/notice/redingroomnotice.do')">열람실이용안내</li>
                    </ul>
	              </li>
	            </ul>
        	</div>
    <div id="he_right">
            <div id="titleheadname">열람실안내 -> 좌석예약</div>
	<div style="overflow: overlay; margin: auto;">
		<div id="contBodyroom">
			<div id="roomHeaWrap">
				<div class="rooTabTit">열람실 D</div>
				<table id="roomHeaTabs">
					<tr>
						<td>총좌석 : X</td>
						<td>이용좌석 : X</td>
						<td>잔여좌석 : X</td>
						<td>사용불가 : X</td>
					</tr>
				</table>
			</div>
			<div id="roomWraps">
				<div id="room-doors">출입문</div>
				<table id="roomTabs" style="border-spacing: 1em 0.5em;">
					<tr>
						<td onclick="seat();">A1</td>
						<td onclick="seat();">A2</td>
						<td onclick="seat();">A3</td>
						<td onclick="seat();">A4</td>
						<td onclick="seat();">A5</td>
						<td onclick="seat();">A6</td>
						<td onclick="seat();">A7</td>
						<td onclick="seat();">A8</td>
						<td onclick="seat();">A9</td>
						<td onclick="seat();">A10</td>
					</tr>
					<tr>
						<td onclick="seat();">A11</td>
						<td onclick="seat();">A12</td>
						<td onclick="seat();">A13</td>
						<td onclick="seat();">A14</td>
						<td onclick="seat();">A15</td>
						<td onclick="seat();">A16</td>
						<td onclick="seat();">A17</td>
						<td onclick="seat();">A18</td>
						<td onclick="seat();">A19</td>
						<td onclick="seat();">A20</td>
					</tr>
					<tr>
						<td onclick="seat();">A21</td>
						<td onclick="seat();">A22</td>
						<td onclick="seat();">A23</td>
						<td onclick="seat();">A24</td>
						<td onclick="seat();">A25</td>
						<td onclick="seat();">A26</td>
						<td onclick="seat();">A27</td>
						<td onclick="seat();">A28</td>
						<td onclick="seat();">A29</td>
						<td onclick="seat();">A30</td>
					</tr>
					<tr>
						<td onclick="seat();">A31</td>
						<td onclick="seat();">A32</td>
						<td onclick="seat();">A33</td>
						<td onclick="seat();">A34</td>
						<td onclick="seat();">A35</td>
						<td onclick="seat();">A36</td>
						<td onclick="seat();">A37</td>
						<td onclick="seat();">A38</td>
						<td onclick="seat();">A39</td>
						<td onclick="seat();">A40</td>
					</tr>
				</table>
			</div>
			<div id="seatStas">
				<button type="button" class="btn btn-primary">사용중</button>
				<button type="button" class="btn btn-secondary">사용가능</button>
				<button type="button" class="btn btn-danger">이용불가</button>
			</div>
		</div>
	</div>
</div>
    </section>
    

<script>
    
const seat=()=>{
    open("${path}/notice/redingroom.do","_blank","height=440,width=660");
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