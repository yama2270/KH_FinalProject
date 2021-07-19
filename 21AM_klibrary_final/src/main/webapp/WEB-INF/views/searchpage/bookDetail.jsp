
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="도서상세페이지"/>
</jsp:include>
<%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="bookinfotitle1">도서정보</h2>
    <br>
  </div>

<div class="list-group-container" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/bookSearch.do')">통합검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/detailSearch.do')">상세검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/categorySearch.do')">주제별검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/klibrary/searchpage/wishbook.do')">희망도서신청</li>
  </ul>
</div>


<div id="searchResultDiv">
<table  id=searchResultTable>
 <tr>
     <td id="bookTitleTd" colspan="3">
        
            <span class="cate">도서</span>
            <span >푸른 사자 와니니 : 이현 장편동화. 2, 검은 땅의 주인</span>
           
     </td>
 </tr>

  
  <tr>
      
    <td id="imgContainerDiv">

          
            
            <img id="bookImg" src="http://image.yes24.com/momo/TopCate530/MidCate010/52990774.jpg" alt="푸른사자와니니">
            
    </td>
    <th id="bookInfoTd">
         
           
                    저자     <br>
                    발행자     <br>              
                    발행연도   <br>            
                    ISBN  <br>
                    등록번호 <br>     
                    청구기호   <br>                                             
                                                            
               
          
         

      </th>
      <td id="bookInfoTd2">
        이현 지음 ; 오윤화 그림<br>
        창비 <br>
        2019  <br>
        9788936443054<br>
        JC0000013401<br>
        아 808.3-창48ㅊ-v.305=c.2   <br>
      </td>
      
    </tr>
   
  </table>

  <div class="resultBookDesc">
							
    <div >
        <h3 >상세정보</h3>
        
            
                <a href="http://book.naver.com/bookdb/book_detail.php?bid=9220379" class="btn_marc ml05 mobileHide" target="_blank" title="새창열림">도서정보 상세보기</a>
            
            
        
    </div>
    <div class="desc">
        <p>서로 다른 모습 그대로, 초원을 달린다!《짜장면 불어요!》《장수 만세!》《로봇의 별》과 
            같은 새로운 이야기로 한국 아동문학의 외연을 넓혀 온 작가 이현의 신작 장편동화 
            『푸른 사자 와니니』. 쓸모없다는 이유로 무리에서 쫓겨난 사자 와니니가 
            초원을 떠돌며 겪는 일들을 그린 동화로, 아프리카의 광활한...</p>
    </div>
    <span class="provider">[NAVER 제공]</span>


</div>
<br><br>
<h3 class="bookCurrentStatusTitle">소장정보</h3>
<br>

<div class="tblWrap mobileHide2">
	<table class="tblhasLibrary">
		
	
		<thead class="bookStatusThead">
			<tr class="bookStatusTr">

            	<th >선택</th>				
				<th >대출상태</th>
				<th >청구기호</th>
				<th >등록번호</th>
				<th >반납예정일</th>
								
				
				<th >도서예약</th>
				
			</tr>
		</thead>
		<tbody>
			
				<tr>
					
					<td><input type="checkbox" name="check" id="check1" value="879929^1663848^BO"></td>
					
					<td>
						대출불가<br>[대출중]
						
					</td>
					<td>
						아 808.3-창48ㅊ-v.280
						
							<br><a href="#btn" onclick="javascript:fnCallNoPrintPop('mglib', 1663848, 'BO', 'WEB'); return false;" title="새창열림" class="button print mobileHide">청구기호출력</a>
						
					</td>
					<td>JC0000009939</td>
					<td>
						
							
							2021-07-12
						
					</td>
				
						<td>
							
									<a href="#btn" onclick="javascript:fnLoanReservationApply('JC','JC0000009939','MD','BO'); return false;" class="tblBtn tB01">예약하기</a>

						</td>
	
				</tr>
			
		</tbody>
	</table>

       <div class="btnGroup">
							
        <a href="" id="addBasketBatchBtn" class="btn down themeBtn">관심도서담기</a>
        <a href="" id="btnView" class="btn down themeBtn">관심도서보기</a>
    
    
        <a href="" id="listBtn" class="btn down themeBtn">목록으로</a>
    
        </div>
</div>
<br><br><br><br>

</div>


</body>
	
	
</html>
<script>
$(function(){
	console.log(window.location.href );
	  if(window.location.href=='http://localhost:9090/klibrary/searchpage/wishbook.do'||window.location.href=='http://localhost:9090/klibrary/searchpage/wishbookRequest.do'){
		  console.log(document.getElementsByClassName('list-group-item')[1]);
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "lightgrey";
		  
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/bookSearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/detailSearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[3].style.background = "";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  }else if(window.location.href=='http://localhost:9090/klibrary/searchpage/categorySearch.do'){
		  document.getElementsByClassName('list-group-item')[1].style.background = "";
		  document.getElementsByClassName('list-group-item')[2].style.background = "";
		  document.getElementsByClassName('list-group-item')[3].style.background = "lightgrey";
		  document.getElementsByClassName('list-group-item')[4].style.background = "";
	  }
	
	 
	   
	})


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	