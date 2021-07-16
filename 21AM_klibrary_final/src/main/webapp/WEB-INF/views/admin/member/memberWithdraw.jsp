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
                        <form class="d-flex">
                            <select id="searchOption" class="form-select" aria-label="Default select example">
                                <option selected>검색옵션</option>
                                <option value="1">아이디</option>
                                <option value="2">이름</option>
                                <option value="3">이메일</option>
                                <option value="4">생년월일</option>
                                <option value="5">주소</option>
                                <option value="6">휴대전화</option>
                            </select>
                            <input id="searchWord" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button id="searchBtn" class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
                <div id="contentTabWrap">
                    <table id="memDelTab" class="table table-hover">
                        <tr>
                            <th style="width:50px;line-height:18px;"><input type="checkbox"/></th>
                            <th style="width:70px;">&nbsp;번호 <i class="fas fa-arrows-alt-v"></i></th>
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
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>번호</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>이메일</td>
                            <td>생년월일</td>
                            <td>주소</td>
                            <td>휴대전화</td>
                            <td>가입일</td>
                            <td><button type="button" class="btn btn-outline-secondary">취소</button></td>
                            <td><button type="button" class="btn btn-outline-secondary">수락</button></td>
                        </tr>
                    </table>
                    <div id="memDelBtn">
                        <button type="button" class="btn btn-outline-secondary">요청취소</button>
                        <button type="button" class="btn btn-outline-secondary">탈퇴수락</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>