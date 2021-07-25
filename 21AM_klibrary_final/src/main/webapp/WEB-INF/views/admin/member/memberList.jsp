<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="회원관리"/>
</jsp:include>

	<div id="ad_right">
            <div id="contHeader">회원관리>회원목록</div>
            <div id="contBody">
                <div id="contentTitle">회원목록</div>
                <div id="searchWrap">
                    <div class="container-fluid" style="padding-right:0px;">
                        <form class="d-flex" action="${path }/admin/member/SearchMember.do" method="post">
                            <select id="searchOption" name="searchOption" class="form-select" aria-label="Default select example">
                                <option selected>검색옵션</option>
                                <option value="user_id" ${param.searchOption =="user_id"? "selected":""}>아이디</option>
                                <option value="user_name" ${param.searchOption =="user_name"? "selected":""}>이름</option>
                                <option value="email" ${param.searchOption =="email"? "selected":""}>이메일</option>
                                <option value="birth_date" ${param.searchOption =="birth_date"? "selected":""}>생년월일</option>
                                <option value="address" ${param.searchOption =="address"? "selected":""}>주소</option>
                                <option value="phone" ${param.searchOption =="phone"? "selected":""}>휴대전화</option>
                            </select>
                            <input id="searchWord" class="form-control me-2" type="search" name="searchWord" 
                            placeholder="Search" aria-label="Search" value='${param.searchWord!=null?param.searchWord:"" }' required>
                            <button id="searchBtn" class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
                <div id="contentTabWrap">
                    <table id="memListTab" class="table table-hover">
                        <tr>
                            <th style="width:50px;line-height:18px;"><input type="checkbox"/></th>
                            
                            <th style="width:110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
                            <th style="width:90px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
                            <th style="width:150px;">이메일</th>
                            <th style="width:100px;">생년월일 <i class="fas fa-arrows-alt-v"></i></th>
                            <th>주소</th>
                            <th style="width:130px;">휴대전화</th>
                            <th style="width:100px;">가입일</th>
                            <th style="width:100px;">수정</th>
                            <th style="width:100px;">삭제</th>
                        </tr>
                        <c:choose>
                    	<c:when test="${not empty list }">
                    	<c:forEach var="n" items="${list }">
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td><c:out value="${n.userId }"/></td>
                            <td><c:out value="${n.userName }"/></td>
                            <td><c:out value="${n.email }"/></td>
                            <td><c:out value="${n.birthDate }"/></td>
                            <td><c:out value="${n.address }"/></td>
                            <td><c:out value="${n.phone }"/></td>
                            <td><c:out value="${n.signupDate }"/></td>
                            <td><button type="button" class="btn btn-outline-secondary">수정</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">삭제</button></td>
                        </tr>
                        </c:forEach>
                    	</c:when>
                    	<c:otherwise>
		                   <tr>
		                   	<td clospan="11">조회된 공지사항이 없습니다</td>
		                   </tr>
		                </c:otherwise>
                    </c:choose>
                    </table>
                    <div id="memListBtn">
                        <button type="button" class="btn btn-outline-secondary">선택삭제</button>
                    </div>
                    <div id="pagebar-container">
	               	${pageBar }
	               </div>
                </div>
            </div>
        </div>
    </section>

	<script>
		
	 $(function(){
         // ul show()
         $(".navOptions").eq(0).show();
         // ul li 배경화면 
         $(".navOptions").eq(0).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
     })	
	
	</script>
	
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>