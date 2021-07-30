<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="회원탈퇴목록"/>
</jsp:include>

<div id="ad_right">
            <div id="contHeader">회원관리>탈퇴요청</div>
            <div id="contBody">
                <div id="contentTitle">탈퇴요청</div>
                <div id="searchWrap">
                    <div class="container-fluid" style="padding-right:0px;">
                        <form class="d-flex" action="${path }/admin/member/memberWithdrawSearch.do" method="post">
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
                <form id="memberlist" method="post">
                    <table id="memDelTab" class="table table-hover">
                        <tr>
                            <th style="width:50px;line-height:18px;"><input type="checkbox" name="selectall" onclick="selectAll(this)"/></th>
                            
                            <th style="width:110px;">아이디 <i class="fas fa-arrows-alt-v"></i></th>
                            <th style="width:90px;">이름 <i class="fas fa-arrows-alt-v"></i></th>
                            <th style="width:150px;">이메일</th>
                            <th style="width:100px;">생년월일 <i class="fas fa-arrows-alt-v"></i></th>
                            <th>주소</th>
                            <th style="width:130px;">휴대전화</th>
                            <th style="width:100px;">가입일</th>
                            <th style="width:100px;">요청취소</th>
                            <th style="width:100px;">탈퇴</th>
                        </tr>
                        <c:choose>
                    	<c:when test="${not empty list }">
                    	<c:forEach var="n" items="${list }">
                        <tr>
                            <td><input type="checkbox" name="member" value="${n.userId }" onclick="checkSelectAll()"/></td>
                            <td><c:out value="${n.userId }"/></td>
                            <td><c:out value="${n.userName }"/></td>
                            <td><c:out value="${n.email }"/></td>
                            <td><c:out value="${n.birthDate }" /></td>
                            <td><c:out value="${n.address }"/></td>
                            <td><c:out value="${n.phone }"/></td>
                            <td><c:out value="${n.signupDate }"/></td>
                            <td><button type="button" class="btn btn-outline-secondary" onclick="if(confirm('${n.userId }님의 요청을 취소하시겠습니까?')){location.assign('${path}/admin/member/memberWirthdrawNo.do?userId=${n.userId}')}">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary" onclick="if(confirm('${n.userId }님을 삭제 하시겠습니까?')){location.assign('${path}/admin/member/memberWithdrawDelete.do?userId=${n.userId}')}">수락</button></td>
                        </tr>
                        </c:forEach>
                    	</c:when>
                    	<c:otherwise>
		                   <tr>
		                   	<td colspan="11">조회된 회원이 없습니다</td>
		                   </tr>
		                </c:otherwise>
		             	</c:choose>
                    </table>
                    </form>
                    <div id="memDelBtn">
                        <button type="button" class="btn btn-outline-secondary" onclick="memberWirthdrawNoList();">요청취소</button>
                        <button type="button" class="btn btn-outline-secondary" onclick="deletelist();">탈퇴수락</button>
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
        $(".navOptions").eq(0).children().eq(1).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })	
    
    function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes 
		    = document.querySelectorAll('input[name="member"]');
		  
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="member"]:checked');
		  
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="selectall"]'); 
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		    
		  }else {
		    selectAll.checked = false;
		  }

		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('member');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
		
		function deletelist(){
			if(confirm("선택한 유저를 삭제하시겠습니까?")){
			$("#memberlist").attr("action","${path}/admin/member/memberWithdrawDeleteList.do");
			$("#memberlist").submit();
			}else{
				alert("취소되었습니다.");
			}
		}
		
		function memberWirthdrawNoList(){
			if(confirm("선택한 유저의 요청을 취소하시겠습니까?")){
			$("#memberlist").attr("action","${path}/admin/member/memberWirthdrawNoList.do");
			$("#memberlist").submit();
			}else{
				alert("취소되었습니다.");
			}
		}
    </script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>