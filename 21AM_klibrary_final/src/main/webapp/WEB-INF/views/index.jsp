<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인페이지"/>
</jsp:include>
 
 
 	<style>
 	.main-top-tr{
 		float:left;
 	}
 	</style>
    <div id="main-wraper">
      <container id="main-top">
        <h3> K-추천 도서</h3>
        <div id="reco-book">
			<table class="main-top-table">
	        	<tr>
	               <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td">
		              		<!-- <a href=""> -->
		              			<img src="${result.bookImg} " onclick="location.href='${pageContext.request.contextPath}/searchpage/bookDetail.do?isbnNo=8989708117;'"/>
		              		<!-- </a> -->
		              	</td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookName }"/></td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookWriter }"/></td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookCompany }"/></td>
	               </c:forEach>
	            </tr>
          	</table>
        </div>
      </container><!-- main-top -->

      <container id="main-mid">
        <div id="main-service">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <span class="navbar-brand mb-0 h1">서비스 바로가기</span>
            </div>
          </nav>
          <table class="main-service">
            <tr>
              <td>
              	<a href="${path}/searchpage/bookSearch.do">
                	<img src="${path }/resources/images/search.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="">
                	<img src="${path }/resources/images/infor.jpg" width=150 height=100>
                </a>
              </td>
            </tr>
            <tr>
              <td>
                <a href="${path }/member/memberBorrowing.do">
                	<img src="${path }/resources/images/borrow.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="${path}/searchpage/wishbook.do">
                	<img src="${path }/resources/images/hope.jpg" width=150 height=100>
                </a>
              </td>
            </tr>
             <tr>
              <td>
                <a href="">
                	<img src="${path }/resources/images/room.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="/member/memberInfo.do">
                	<img src="${path }/resources/images/mypage.jpg" width=150 height=100>
                </a>
              </td>
            </tr>

          </table>
        </div><!-- main-service -->

        <div id="main-notice">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">공지사항</a>
            </div>
          </nav>
          <table class="main-service">
               <c:forEach items="${notices }" var="result">
             	  <tr class="main-service-tr">
	              	<td class="main-service-td">
	              		<a href="" class="main-service-a">
	              			<c:out value="${result.noticeTitle }"/>
	              		</a>
	              	</td>
	              	<td class="main-service-td"><c:out value="${result.noticeDate }"/></td>
	              </tr>
               </c:forEach>
          </table>
        </div>

      </container><!-- main-mid -->

      
      <container id="main-bottom">
        <div id="main-room">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">열람실 현황</a>
            </div>
          </nav>
          <ul class="main-room">
            <li>열람실 A</li>
            <li>열람실 B</li>
            <li>열람실 C</li>
            <li>열람실 D</li>
            <li>열람실 E</li>
          </ul>
        </div><!-- main-room -->

        <div id="main-information">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">이용안내</a>
            </div>
          </nav>
          <ul id="infor-ul">
            이용시간
            <li>도서관 이용시간 : 09:00 ~ 18:00</li>
            <li>열람실 이용시간 : 09:00 ~ 22:00</li>
            <li>휴무일 : 매주 화요일 휴무</li>
          </ul>
          <ul>
            찾아오시는길
            <li>주소 및 위치</li>
          </ul>

        </div><!-- main-information -->
      </container><!-- main bottom -->
    </div><!-- main-wraper -->

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인페이지"/>
</jsp:include>
 
 
 	<style>
 	.main-top-tr{
 		float:left;
 	}
 	</style>
    <div id="main-wraper">
      <container id="main-top">
        <h3> K-추천 도서</h3>
        <div id="reco-book">
			<table class="main-top-table">
	        	<tr>
	               <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td">
		              		<a href="">
		              			<img src="${result.bookImg}">
		              		</a>
		              	</td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookName }"/></td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookWriter }"/></td>
		           </c:forEach>
		        </tr>
		        <tr>
		           <c:forEach items="${recomendBook }" var="result">
		              	<td class="main-top-table-td-text"><c:out value="${result.bookCompany }"/></td>
	               </c:forEach>
	            </tr>
          	</table>
        </div>
      </container><!-- main-top -->

      <container id="main-mid">
        <div id="main-service">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <span class="navbar-brand mb-0 h1">서비스 바로가기</span>
            </div>
          </nav>
          <table class="main-service">
            <tr>
              <td>
              	<a href="">
                	<img src="${path }/resources/images/search.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="">
                	<img src="${path }/resources/images/infor.jpg" width=150 height=100>
                </a>
              </td>
            </tr>
            <tr>
              <td>
                <a href="">
                	<img src="${path }/resources/images/borrow.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="">
                	<img src="${path }/resources/images/hope.jpg" width=150 height=100>
                </a>
              </td>
            </tr>
             <tr>
              <td>
                <a href="">
                	<img src="${path }/resources/images/room.jpg" width=150 height=100>
                </a>
              </td>
              <td>
                <a href="">
                	<img src="${path }/resources/images/mypage.jpg" width=150 height=100>
                </a>
              </td>
            </tr>

          </table>
        </div><!-- main-service -->

        <div id="main-notice">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">공지사항</a>
            </div>
          </nav>
          <table class="main-service">
               <c:forEach items="${notices }" var="result">
             	  <tr class="main-service-tr">
	              	<td class="main-service-td">
	              		<a href="" class="main-service-a">
	              			<c:out value="${result.noticeTitle }"/>
	              		</a>
	              	</td>
	              	<td class="main-service-td"><c:out value="${result.noticeDate }"/></td>
	              </tr>
               </c:forEach>
          </table>
        </div>

      </container><!-- main-mid -->

      
      <container id="main-bottom">
        <div id="main-room">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">열람실 현황</a>
            </div>
          </nav>
          <ul class="main-room">
            <li>열람실 A</li>
            <li>열람실 B</li>
            <li>열람실 C</li>
            <li>열람실 D</li>
            <li>열람실 E</li>
          </ul>
        </div><!-- main-room -->

        <div id="main-information">
          <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">이용안내</a>
            </div>
          </nav>
          <ul id="infor-ul">
            이용시간
            <li>도서관 이용시간 : 09:00 ~ 18:00</li>
            <li>열람실 이용시간 : 09:00 ~ 22:00</li>
            <li>휴무일 : 매주 화요일 휴무</li>
          </ul>
          <ul>
            찾아오시는길
            <li>주소 및 위치</li>
          </ul>

        </div><!-- main-information -->
      </container><!-- main bottom -->
    </div><!-- main-wraper -->

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>