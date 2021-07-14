<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hj.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cg.css">
    <!-- fontawsome CDN 불러오기 -->
    
    
    <title>책검색결과페이지</title>

	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="../js/jquery-3.6.0.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  

  
</head>
<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="searchtitle1">통합검색</h2>
    <br>
  </div>

<div class="list-group-container" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item">통합검색</li>
    <li class="list-group-item">상세검색</li>
    <li class="list-group-item">주제별검색</li>
    <li class="list-group-item">희망도서신청</li>
  </ul>
</div>



<div class="book-search-container">
  <div class="populor-words">
  
    <span>인기검색어<i class="fa fa-search"></i></span>&nbsp;&nbsp;
    <span>책1</span>&nbsp;
    <span>책2</span>&nbsp;
    <span>책3</span>
    
  </div>
  <form action="/action_page.php">

    <div class="searchSelect">
      <label for="searchKey" class="blind"></label>
      <select id="searchKey" name="searchKey" title="검색 선택">
        <option value="ALL">전체</option>
        <option value="TITLE" selected="selected">서명</option>
        <option value="AUTHOR">저자</option>
        <option value="PUBLISHER">발행자</option>
        <option value="KEYWORD">키워드</option>

      </select>

    </div>

    <input type="text" placeholder="  검색" name="search" id="inputtext">
    <button type="submit"><i class="fa fa-search"></i>검색</button>
  </form>
</div>
<br><br><br><br>


<table id=searchResultTable2>
  <tr>
    <td colspan="5" id="searchCaptionTh">
  
        <div id="searchCaption">
            <p>서명:푸른사자와니니 에 대한 검색결과 5건  이 검색되었습니다.</p>
        </div>
  
        <div class="selectForm">
        <select id="searchType" title="검색선택">
            <option value="ALL">전체</option>
            <option value="TITLE" selected="selected">서명</option>
          <option value="AUTHOR">저자</option>
          <option value="PUBLISHER">발행자</option>
  
        </select>
        <select id="searchNumber" title="검색건수">
          <option value=10>10건</option>
          <option value=20>20건</option>
          <option value=30>30건</option>
          <option value=40>40건</option>
          <option value=50>50건</option>
  
        </select>
        <button id="button22" type="submit">확인</button>
      </div>

   </td>
   </tr>

  <tr>
    <td colspan="5">
      <hr>
      
      <input type="checkbox" name="bookSelect" id="allCheck" value="all"><button id="button22" type="submit">관심자료담기</button>
      <hr>
   </td>
  </tr>

 
  
  
  <tr>
      <td id="bookCheckTd" rowspan="2" >
          <input type="checkbox" name="bookCheck" id="bookCheck" value=""> 
    
      </td>
    <td id="imgContainerDiv" rowspan="2" >

          
            
            <img id="bookImg" src="http://image.yes24.com/momo/TopCate530/MidCate010/52990774.jpg" alt="푸른사자와니니">
            
    </td>
    <td colspan="2">
          <div id="bookInfoDiv">
            <dl class="authorData">
               <dd>
                    <span class="cate">도서</span>
                    <a href="#link" onclick="javascript:fnSearchResultDetail(59846269,59846271,'BO'); return false;">푸른 사자 와니니 : 이현 장편동화. 2, 검은 땅의 주인</a>
            
                    </dd>
            </dl>
          </div>
         

      </td>
      <td id="buttonWrapTd" rowspan="2">
        <div class="buttonWrap">
          <button id="button22" type="submit" onclick="location.href='joinUs.jsp' ">도서예약신청</button>
          <button id="button22" type="submit" onclick="location.href='joinUs.jsp' ">관심도서담기</button>
          </div>
      </td>
    </tr>
    <tr>
     <td>

     </td>
     <td>
      <div id="bookInfoDiv2">
        <dl class="authorData2">
           <dd>
                
                  
                <span>저자 </span><br>
                <span>발행자</span><br>                    
                <span>발행연도</span> <br>                  
                <span>ISBN</span><br>
                 <span>등록번호</span><br>
                  <span>
                        청구기호                       
                </span>                                      
            
                  </dd>
        </dl>
      </div>

     </td>
     <td>
      <div id="bookInfoDiv3">
        <dl class="authorData3">
           <dd>
                
                  
                <span>이현 지음 ; 오윤화 그림</span><br>
                <span>창비</span><br>                    
                <span>2019</span><br>                            
                <span>9788936443054</span><br>
                 <span>JC0000013401</span><br>
                  <span>
                        아 808.3-창48ㅊ-v.305=c.2                           
                  </span>                                                  
                  </dd>
        </dl>
      </div>


     </td>
     <td>

     </td>
    </tr>
    <tr>
      <td colspan="5">
         <hr>
      </td>
    </tr>
  </table>

</body>


<script>

$(function(){ //전체선택 체크박스 클릭 
  $("#allCheck").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
    if($("#allCheck").prop("checked")) { 
      //해당화면에 전체 checkbox들을 체크해준다 
      $("#bookCheck").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
    } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
      $("#bookCheck").prop("checked",false); } 
    })
   })

</script>
</html>
	
	