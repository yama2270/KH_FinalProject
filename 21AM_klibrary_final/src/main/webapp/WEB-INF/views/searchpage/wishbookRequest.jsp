<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서요청"/>
</jsp:include>
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
    
    <title>희망도서신청</title>

	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <script src="../js/jquery-3.6.0.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  
</head>
<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="wishbooktitle1">희망도서신청</h2>
    <br>
  </div>

<div class="menucontainer" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item">통합검색</li>
    <li class="list-group-item">상세검색</li>
    <li class="list-group-item">주제별검색</li>
    <li class="list-group-item">희망도서신청</li>
  </ul>
</div>
<br><br><br>
<table id="wishbooktable">
        <tr>
            <td>
               도서명
            </td>
            <td colspan="3">

                <input type="text" name="bookName" placeholder="내용을 입력해주세요" id="bookinfoinput">
                <button id="button22" type="submit" onclick="location.href='joinUs.jsp'">검색</button>
                
            </td>
            

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="3">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
            <td>
                출판사
            </td>
            <td colspan="3">
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
            <td>
              ISBN
            </td>
            <td colspan="3">
                <input type="text" name="ISBN" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
          <td>
            가격
          </td>
          <td colspan="3">
              <input type="text" name="ISBN" placeholder="내용을 입력해주세요" id="bookinfoinput">
              
          </td>
          <td>

          </td>
          <td>

          </td>

      </tr>
        <tr>
            <td>
               발행연도
            </td>
            <td colspan="3">
            
                <input id="publishYear1" type="text" name="publishYear" placeholder="발행년(시작)">
                
            </td>
            
            

        </tr>


</table>
<br><br><br>
<div id="buttonContainer">
<button id="button22" type="submit">신청확인</button>
<button id="button22" type="submit">취소</button>
</div>
<br><br><br>



</body>
	
	
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>