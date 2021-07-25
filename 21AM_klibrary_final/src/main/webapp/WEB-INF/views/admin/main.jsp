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
						<div class="quaInpWrap" style="text-align: right; padding-right: 80px">
							<input type="date" style="margin-right: 3px;"><input
								type="date">
						</div>
						<canvas id="visChart" width="450px" height="250px" style="margin-top:10px;"></canvas>
					</div>
				</div>
				<div class="canQua">
					<div class="canQuaHea" style="margin-left: 10px;">종류별 도서</div>
					<div class="quaCat">
						<canvas id="catBook" width="450px" height="250px"></canvas>
					</div>
				</div>
			</div>
			<div id="canBot" style="margin-top:50px;">
				<div class="canQua">
					<div class="canQuaHea">기간별 대출도서</div>
					<div class="quaInpWrap">
							<input type="date" style="margin-right: 3px;"><input
								type="date">
						</div>
					<div>
						<canvas id="renBook" width="450px" height="250px"></canvas>
					</div>
				</div>
				<div class="canQua">
					<div class="canQuaHea" style="margin-left: 10px;">관심도서 랭킹</div>
					<div class="quaCat">
						<canvas id="likeBook" width="450px" height="250px"></canvas>
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
			  data:[10,20]
		  }]
	  }, // data END
	  options : {
		  responsive : false,
		  plugins : {
			  legend : {
				  display:false
			  }
		  }
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
	
	// 기간별 대출도서
	
	/* $.ajax({
		url : "${path}/admin/book/countRenBook.do",
		success : function(data){
			// chart 객체 
			const renCan = document.getElementById("renBook").getContext("2d");
			const renChart = new Chart(renCan,{
				type : "bar",
				datasets : {
					labels : [1,2,3,4,5],
					data : [1,2,3,4,5],
					label : "대출 도서 수"
				}
			})
		}
	})  */
	
	// chart 생성하기 
	const renCan = document.getElementById("renBook").getContext("2d");
	const renCha = new Chart(renCan,{
		type : "bar",
		data : {
			labels : ["월요일","화요일","수요일","목요일","금요일","토요일","일요일"],
			datasets : [{
				data : [1,2,3,4,5,6,7],
				barThickness : 20,
				backgroundColor : "red"
			}]
		} ,
		options : {
			plugins : {
				legend : {
					display : false
				}
			},
			y : {
				min : 0,
				max : 20,
			}
		}
	})
	
	
	// 관심도서 랭킹 
	$.ajax({
		url : "${path}/admin/book/countLikBook.do",
		success:function(data){
			const likCan = document.getElementById("likeBook").getContext("2d");
			const likChart = new Chart(likCan,{
				type:"bar",
				data : {
					labels : Object.keys(data),
					datasets : [{
						data : Object.values(data),
						backgroundColor : ["#FFCB9C"],
						barThickness : 30
					}]
				},
				options : {
					responsive : false,
					scales : {
						y :{
							grid : {
								borderDash : [2,5]
							},
							//suggestedMin : 0,
							//suggestedMax : 10
							min : 0,
							max : 12
						}
					},
					plugins : {								// legend 설정 
						legend : {
							display : false 
						}
					},
				}
			})
		}
	})
	
	
	}); //Jquery END
	
	
	
	
	
	
</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />