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
    
    <title>희망도서검색팝업창</title>

	
	
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <script src="../js/jquery-3.6.0.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
</head>
<body>
  
  <div class="popupTitleContainer">
    <br>
    <h3 id="popupTitle">희망도서검색</h1>
    <br>
  </div>


<div class="search-container">
  <div class="populor-words">
  
    <span>※아래 검색결과에서 원하시는 희망도서를 클릭하세요.</span>
    
    
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

    <input type="text" placeholder="  검색" name="search" id="inputText">
    <button type="submit"><i class="fa fa-search"></i>검색</button>
  </form>
</div>
<br><br><br><br>


<table id=searchResultTable3>
  <tr>
    <td colspan="3" id="searchCaptionTh">
  
        <div id="searchCaption">
            <p>책제목:  검색건수 : 0 건</p>
        </div>

   </td>
   </tr>

   <tr>
       <td colspan="3">
          <hr>
       </td>
   </tr>
   <tr>
      <td id="imgContainerDiv" rowspan="2">
        <img id="bookImg" src="http://image.yes24.com/momo/TopCate530/MidCate010/52990774.jpg" alt="푸른사자와니니">
      </td>
      <td colspan="2">
        <dt class="tit">
          <span class="cate">도서</span>
          <a href="#link" onclick="javascript:fnSearchResultDetail(59846269,59846271,'BO'); return false;">푸른 사자 와니니 : 이현 장편동화. 2, 검은 땅의 주인</a>
          <br><br>
        </dt>   
      </td>


   </tr>
  
  <tr >
      
    
    <td id="bookInfoDiv">
          <div >
            <dl>
                         
                <dd class="authorData">
                    <span>저자 </span><br>
                    <span>발행자</span><br>                    
                    <span>발행연도</span> <br>                  
               
                    
                        <span>ISBN</span><br>
                        
                        <span>가격</span><br>
                        
                        <span>
                            청구기호
                                                  
                        </span>                                      
                </dd>
                <dd>
                    <button id="button23" type="submit" onclick="location.href='joinUs.jsp' ">희망도서신청</button>
                </dd>
                
            </dl>
          </div>
          
 
      </td>
      <td id="bookInfoDiv2">
        <div >
          <dl>
                         
              <dd class="authorData2">
                  <span> 이현 지음 ; 오윤화 그림</span><br>
                  <span> 창비</span><br>                    
                  <span> 2019</span><br>                   
              
                  
                      <span> 9788936443054</span><br>
                      
                      <span>10000원</span><br>
                      
                      <span>
                           아 808.3-창48ㅊ-v.305=c.2
                                                
                      </span>                                      
              </dd>
              <dd>
                  <br>
              </dd>
              
          </dl>
        </div>

      </td>

    </tr>
    <tr>
      <td colspan="3">
         <hr>
      </td>
    </tr>
  </table>

  
          <div class="closeBtnDiv">
           
                <button id="closeBtn" type="submit" onclick="location.href='joinUs.jsp' ">닫기</button> 
                
          </div>
   
  
   <br><br>

</body>

</html>