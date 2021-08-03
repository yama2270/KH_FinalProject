<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="관리자 메인페이지"/>
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
						<div class="quaInpWrap" style="text-align: right;">
							<input type="date" id="visInpRow" class="inpRow" style="margin-right: 3px;" min="2021-07-19"><input
								type="date" id="visInpHig" class="inpHig" min="2021-07-20"><input type="button" style="height:20px;width:35px;margin-left:3px;" value="조회" onclick="visSession()">
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
							<input type="date" id="renInpRow" class="inpRow" name="renIntRow" style="margin-right: 3px;" min="2021-07-19"><input
							 type="date" id="renInpHig" class="inpHig" name="renIntHig" min="2021-07-20"><input type="button" style="height:20px;width:35px;margin-left:3px;" value="조회" onclick="renSession()">
						</div>
					<div id="renCanWr">
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
	
	// chart.js
	
	let renCha;
	let visCha;
 
	$(document).ready(function(){
	
	// 방문자수 
		
		let visRowInp;
		let visHighInp;
		
		if($("#visInpRow").val()==''){
				visRowInp = dateForm('2021-07-19');
		} else {
				visRowInp = dateForm($("#visInpRow").val());
		}
		
		if($("#visInpHig").val()==''){
				visHighInp = new Date().toISOString().substring(0,10).replace(/-/g,'/');
		} else {
				visHighInp = dateForm($("#visInpHig").val());
		}
		
		$.ajax({
			url:"${path}/admin/countVis.do?rowDate="+visRowInp+"&highDate="+visHighInp,
			success:function(data){
				
				const rowDate = new Date(visRowInp);
				const highDate = new Date(visHighInp);
				
				// 기간 
				const labArr = new Array();
				const timeGap = highDate.getTime()-rowDate.getTime();
				const gap = timeGap / (1000*60*60*24);
				rowDate.setDate(rowDate.getDate()+1);
				
				for(i=0;i<gap+1;i++){
					labArr.push(rowDate.toISOString().substring(0,10));
					rowDate.setDate(rowDate.getDate()+1);
				}
				
				// 검색 데이터 
				const resDate = Object.keys(data);
				const resCount = Object.values(data);
				
				
				// 결과 배열만들기
				const datArr = new Array();
				
				for(i=0;i<labArr.length;i++){
					datArr.push(0);
				}
				
				for(i=0;i<labArr.length;i++){
					for(j=0;j<resDate.length;j++){
						if(labArr[i]==resDate[j]){
							datArr[i]=resCount[j];
						} 
					}
				}
				
				// chart 삭제
				let newCan = document.getElementById("visChart");
				let newCon = newCan.getContext("2d");
				
				visCha = new Chart(newCon,{
					type : "line",
					data : {
						labels : labArr,
						datasets : [{
							data : datArr,
							tension : 0.1,
							fill : true,
							backgroundColor:"#d8edfb",	// fill styling
							borderColor : "#36a2eb", 	// line styling 
							pointBackgroundColor : "#36a2eb" // point styling
						}]
					} ,
					options : {
						plugins : {
							legend : {
								display : false
							}
						},
						y : {
							suggestedmin : 0,
							suggestedmax : 50
						}
					}
				})
			}
		})
	
	// 카테고리별 도서  
	
	$.ajax({
		url:"${path}/admin/book/countCatBook.do",
		success:function(data){
		
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
			
		let rowInp;
		let highInp;
		
		if($("#renInpRow").val()==''){
				rowInp = dateForm('2021-07-19');
		} else {
				rowInp = dateForm($("#renInpRow").val());
		}
		
		if($("#renInpHig").val()==''){
				highInp = new Date().toISOString().substring(0,10).replace(/-/g,'/');
		} else {
				highInp = dateForm($("#renInpHig").val());
		}
		
		$.ajax({
			url:"${path}/admin/book/countRenBook.do?rowDate="+rowInp+"&highDate="+highInp,
			success:function(data){
				
				const rowDate = new Date(rowInp);
				const highDate = new Date(highInp);
				
				// 기간 
				const labArr = new Array();
				const timeGap = highDate.getTime()-rowDate.getTime();
				const gap = timeGap / (1000*60*60*24);
				rowDate.setDate(rowDate.getDate()+1);
				
				for(i=0;i<gap+1;i++){
					labArr.push(rowDate.toISOString().substring(0,10));
					rowDate.setDate(rowDate.getDate()+1);
				}
				
				// 검색 데이터 
				const resDate = Object.keys(data);
				const resCount = Object.values(data);
				
				
				// 결과 배열만들기
				const datArr = new Array();
				
				for(i=0;i<labArr.length;i++){
					datArr.push(0);
				}
				
				for(i=0;i<labArr.length;i++){
					for(j=0;j<resDate.length;j++){
						if(labArr[i]==resDate[j]){
							datArr[i]=resCount[j];
						} 
					}
				}
				
				// chart 삭제
				let newCan = document.getElementById("renBook");
				let newCon = newCan.getContext("2d");
				
				renCha = new Chart(newCon,{
					type : "line",
					data : {
						labels : labArr,
						datasets : [{
							data : datArr,
							tension : 0.1,
							backgroundColor:"red"
						}]
					} ,
					options : {
						plugins : {
							legend : {
								display : false
							}
						},
						y : {
							suggestedmin : 0,
							max : 10
						}
					}
				})
			}
		})
	
	
	// 관심도서 랭킹 
	
	$.ajax({
		url : "${path}/admin/book/countLikBook.do",
		success:function(data){
			
			// 결과 정렬하기 
			const keyArr = Object.keys(data);
			const valArr = Object.values(data);
			
			// key 정렬 
			keyArr.sort(function(a,b){
				if(a[0]>b[0]){
					return 1;
				} else {
				return -1;
				}
			})
			
			// data 정렬
			valArr.sort(function(a,b){
				return b-a;
			})
			
			const likCan = document.getElementById("likeBook").getContext("2d");
			const likChart = new Chart(likCan,{
				type:"bar",
				data : {
					labels : keyArr,
					datasets : [{
						data : valArr,
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
	
	
	// 방문자수, 대출도서 input 설정
	$(".inpRow,.inpHig").click((e)=>{
		
		const inpRow = $(".inpRow");
		const inpHig = $(".inpHig");
		
		// date input max,min 설정 
		const date = new Date();
		inpHig.attr("max",date.toISOString().substring(0,10));
		date.setDate(date.getDate()-1);
		inpRow.attr("max",date.toISOString().substring(0,10));
		
		// date hig default 설정 
		if(inpRow.val()!=''){
			inpHig.val(new Date().toISOString().substring(0,10));
			const rowDate = new Date(inpRow.val());
			rowDate.setDate(rowDate.getDate()+1);
			inpHig.attr("min",rowDate.toISOString().substring(0,10));
		}
		
		// date row 설정 
		if(inpHig.val()!='' && inpRow.val()==''){
			const rowMin = new Date(inpHig.val());
			rowMin.setDate(rowMin.getDate()-1);
			inpRow.attr("max",rowMin.toISOString().substring(0,10));
		}
	 }) 
	
}); //Jquery END
	
	
	// 대출도서 기간 날짜별 조회 
	
	const renSession = function(){
		
		// ajax date 파마미터 생성 
		
		let rowInp;
		let highInp;
		
		if($("#renInpRow").val()==''){
				rowInp = dateForm('2021-07-19');
		} else {
				rowInp = dateForm($("#renInpRow").val());
		}
		
		if($("#renInpHig").val()==''){
				highInp = new Date().toISOString().substring(0,10).replace(/-/g,'/');
		} else {
				highInp = dateForm($("#renInpHig").val());
		}
		
		$.ajax({
			url:"${path}/admin/book/countRenBook.do?rowDate="+rowInp+"&highDate="+highInp,
			success:function(data){
				
				const rowDate = new Date(rowInp);
				const highDate = new Date(highInp);
				
				// 기간 
				const labArr = new Array();
				const timeGap = highDate.getTime()-rowDate.getTime();
				const gap = timeGap/(1000*60*60*24);
				rowDate.setDate(rowDate.getDate()+1);
				
				for(i=0;i<gap+1;i++){
					labArr.push(rowDate.toISOString().substring(0,10));
					rowDate.setDate(rowDate.getDate()+1);
				}
				
				// 검색 데이터 
				const resDate = Object.keys(data);
				const resCount = Object.values(data);
				
				
				// 결과 배열만들기
				const datArr = new Array();
				
				for(i=0;i<labArr.length;i++){
					datArr.push(0);
				}
				
				for(i=0;i<labArr.length;i++){
					for(j=0;j<resDate.length;j++){
						if(labArr[i]==resDate[j]){
							datArr[i]=resCount[j];
						} 
					}
				}
				
				/* const renCan = document.getElementById("renBook");
				const renCon = renCan.getContext("2d");
				renCon.clearRect(0,0,renCan.width,renCan.height);
				renCon.beginPath(); */
				
				// canvas 변경해주기 
				/* let canNo = 0;
				console.log($("#renCanWr").find("canvas"));
				$("#renCanWr").find("canvas").attr("id","renBook"+(++canNo));
				let newCan = document.getElementById("renBook"+canNo);
				let newCon = newCan.getContext("2d"); */
								
				// chart 삭제
				renCha.destroy();
				let newCan = document.getElementById("renBook");
				let newCon = newCan.getContext("2d");
				
				renCha = new Chart(newCon,{
					type : "line",
					data : {
						labels : labArr,
						datasets : [{
							data : datArr,
							tension : 0.1,
							backgroundColor:"red"
						}]
					} ,
					options : {
						plugins : {
							legend : {
								display : false
							}
						},
						y : {
							suggestedmin : 0,
							max : 10
						}
					}
				})
			}// ajax end
		})
	}
	
	const visSession = function(){
		
	// ajax date 파마미터 생성 
			
		let visRowInp;
		let visHighInp;
		
		if($("#visInpRow").val()==''){
				visRowInp = dateForm('2021-07-19');
		} else {
				visRowInp = dateForm($("#visInpRow").val());
		}
		
		if($("#visInpHig").val()==''){
				visHighInp = new Date().toISOString().substring(0,10).replace(/-/g,'/');
		} else {
				visHighInp = dateForm($("#visInpHig").val());
		}
		
		$.ajax({
			url:"${path}/admin/countVis.do?rowDate="+visRowInp+"&highDate="+visHighInp,
			success:function(data){
				
				const rowDate = new Date(visRowInp);
				const highDate = new Date(visHighInp);
				
				// 기간 
				const labArr = new Array();
				
				// 날짜의 차이를 구하자 
				const timeGap = highDate.getTime()-rowDate.getTime();
				const gap = timeGap/(1000*60*60*24);
				rowDate.setDate(rowDate.getDate()+1);
				
				for(i=0;i<gap+1;i++){
					labArr.push(rowDate.toISOString().substring(0,10));
					rowDate.setDate(rowDate.getDate()+1);
				}
				
				// 검색 데이터 
				const resDate = Object.keys(data);
				const resCount = Object.values(data);
				
				
				// 결과 배열만들기
				const datArr = new Array();
				
				for(i=0;i<labArr.length;i++){
					datArr.push(0);
				}
				
				for(i=0;i<labArr.length;i++){
					for(j=0;j<resDate.length;j++){
						if(labArr[i]==resDate[j]){
							datArr[i]=resCount[j];
						} 
					}
				}
				
				/* const renCan = document.getElementById("renBook");
				const renCon = renCan.getContext("2d");
				renCon.clearRect(0,0,renCan.width,renCan.height);
				renCon.beginPath(); */
				
				// canvas 변경해주기 
				/* let canNo = 0;
				console.log($("#renCanWr").find("canvas"));
				$("#renCanWr").find("canvas").attr("id","renBook"+(++canNo));
				let newCan = document.getElementById("renBook"+canNo);
				let newCon = newCan.getContext("2d"); */
				
				// chart 삭제
				visCha.destroy();
				let newCan = document.getElementById("visChart");
				let newCon = newCan.getContext("2d");
				
				visCha = new Chart(newCon,{
					type : "line",
					data : {
						labels : labArr,
						datasets : [{
							data : datArr,
							tension : 0.1,
							fill : true,
							backgroundColor:"#d8edfb",	// fill styling
							borderColor : "#36a2eb", 	// line styling 
							pointBackgroundColor : "#36a2eb" // point styling
						}]
					} ,
					options : {
						plugins : {
							legend : {
								display : false
							}
						},
						y : {
							suggestedmin : 0,
							suggestedmax : 50 
						}
					}
				})
			}// ajax end
		})
	}
	
	
	// Date 형식
	const dateForm = function(date){
		return new Date(date).toISOString().substring(0,10).replace(/-/g,'/');
	}
	
	
</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />