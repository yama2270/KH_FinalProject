<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="관리자 메인페이지" />
</jsp:include>

<!-- Chart.js CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>

<div id="ad_right">
	<div id="contHeader">관리자페이지</div>
	<div id="contbody">
		<div id="mainWrap">
			<div id="canTop">
				<div class="canQua">
					<div class="canQuaHea">홈페이지 방문자 수</div>
					<div id="quaVis">
						<div style="text-align: right; padding-right: 80px">
							<input type="date" style="margin-right: 3px;"><input
								type="date">
						</div>
						<canvas id="visChart" width="450px" height="250px"></canvas>
					</div>
				</div>
				<div class="canQua">
					<div class="canQuaHea" style="margin-left: 10px;">종류별 도서</div>
					<div id="quaCat" style="margin-top: 27px;">
						<canvas id="catBook" width="450px" height="250px"></canvas>
					</div>
				</div>
			</div>
			<div id="canBot" style="margin-top:50px;">
				<div class="canQua">
					<div class="canQuaHea">기간별 대출도서</div>
					<div>
						<canvas id="myChart" width="450px" height="250px"></canvas>
					</div>
				</div>
				<div class="canQua">
					<div class="canQuaHea" style="margin-left: 10px;">관심도서 랭킹</div>
					<div>
						<div></div>
						<canvas id="myChart" width="450px" height="250px"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>

<script>

 
	$(document).ready(function(){
	
	// 방문자수 canvas 
		
	const visCan = document.getElementById("visChart").getContext("2d");
	
	const data = {월요일:10,화요일:20}
	
	const barChar = new Chart(visCan, {
	  type: "line", // pie, line, donut, polarArea ...
	  data: {
		  labels : ["월요일","화요일","수요일","목요일","금요일","토요일","일요일"],
		  datasets : [{
			  data:[10,20],
			  label : "방문자 수"
		  }]
	  }, // data END
	  options : {
		  responsive : false
	  }
	  })
	
	// 베스트 대출 도서 canvas 
	$.ajax({
		url:"${path}/admin/book/countCatBook.do",
		success:function(data){
		
		console.log(Object.keys(data));
		console.log(Object.values(data));
			
		const catBookCan = document.getElementById("catBook").getContext("2d");
		const catBookCha = new Chart(catBookCan,{
			type: "doughnut",
			data : {
				labels : ["총류","철학","종교","예술","언어","문학","역사","영미문학","도서학,서지학","형이상학","비교종교학","건축술","한국문학","아시아","의학"],
				datasets : [{
					data : Object.values(data),
					backgroundColor : ['#A7EEFF','#BECDFF','#8CBDED','#28A0FF','#A0A0FF','#B4B4DC','#65FFBA','#FFCAD5','#D2FFD2','#27DBB7','#FFDAD7','#FFB4FF','#FAFAD2','#F5D08A','#D25A5A']
				}]
			},
			options : {
				responsive : false,
				plugins : {
					legend : {
						position : "right" 
					}
				}
			}
			})
		}
	})
	
	
	
	
	
	
	}); //Jquery END
	
	
	
	
	
	
</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />