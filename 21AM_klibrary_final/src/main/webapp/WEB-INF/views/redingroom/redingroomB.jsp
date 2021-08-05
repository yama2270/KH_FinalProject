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
    	<h2 id="title11">열람실 B</h2>
    <br>
  </div>
    <section id="ad_containerad">
        <div class="list-group-containers" >
	            <ul class="list-group">
	              <li class="list-group-items" id="menutitle">이용안내</li>
	              <li class="list-group-items" onclick="location.assign('${path}/notice/booktime.do')">이용시간</li>
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
    <div id="he_rights">
            <div id="titleheadname">열람실안내 -> 좌석예약</div>
	<div style="overflow: overlay; margin: auto;">
		<div id="contBodyroom">
			<div id="roomHeaWrap">
				<div class="rooTabTit">열람실 B</div>
				<table id="roomHeaTabs">
					<tr>
						<td>총좌석 : <c:out value="${total }"/></td>
						<td>이용좌석 : <c:out value="${usetotal }"/></td>
						<td>잔여좌석 : <c:out value="${Available }"/></td>
						<td>사용불가 : <c:out value="${cannotused }"/></td>
					</tr>
				</table>
			</div>
			<div id="roomWraps">
				<div id="room-doors">출입문</div>
				<table id="roomTabs" style="border-spacing: 1em 0.5em;">
				<c:choose>
                    	<c:when test="${not empty list }">
					<tr>
                    	<c:forEach var="n" items="${list }" begin="0" end="9"><!-- begin : 시작번호 end : 끝번호 -->
							<td>
								<c:out value="${n.seatNo }"/>
								<input type="hidden" class="test" value="${n.usageStatus }">
							</td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="n" items="${list }" begin="10" end="19">
							<td><c:out value="${n.seatNo }"/></td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="n" items="${list }" begin="20" end="29">
							<td><c:out value="${n.seatNo }"/></td>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach var="n" items="${list }" begin="30" end="39">
							<td><c:out value="${n.seatNo }"/></td>
						</c:forEach>
					</tr>
                    	</c:when>
		        </c:choose>
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
	
	var cells = document.getElementsByTagName('td');
	for(var i = 0; i < cells.length; i++){
	    cells[i].addEventListener('click', clickHandler);
	}
	
	function clickHandler()
	{
		var userid="${loginMember.userId}";
		console.log(userid);
	    open("${path}/notice/redingroom.do?seatno="+this.textContent+'&userid='+userid,"_blank","height=440,width=660");
	}
	
    /* const seat=()=>{
    	var y = document.getElementById("seatno").innerText;
    	console.log(y);
       open("${path}/notice/redingroom.do","_blank","height=440,width=660");
    } */
    
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