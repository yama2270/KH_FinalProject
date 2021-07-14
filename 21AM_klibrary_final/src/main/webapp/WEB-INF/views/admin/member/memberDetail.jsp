<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="회원상세"/>
</jsp:include>
        <div id="ad_right">
            <div id="contHeader">회원상세</div>
            <div style="overflow:overlay;height:690px;">
                <div id="contBody">
                    <div id="memberDetail">
                        <div id="memDetLef">
                            <div id="memberImg">이미지</div>
                            <div id="memDefLefBtn">
                                <button type="button" class="btn btn-outline-secondary">수정</button>
                            </div>
                        </div>
                        <div id="memDetRig">
                            <form action="" method="post">
                                <table id="memberDetTab">
                                    <tr>
                                        <th>회원번호</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input type="email"></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>
                                           <input type="text" id="datePicker">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td id="detTabTel">
                                            <select class="detPhone">
                                                <option selected>선택</option>
                                                <option value="010">010</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                            - <input class="detPhone" type="text">
                                            - <input class="detPhone" type="text">
                                        </td>
                                    </tr>
                                    <tr style="height:150px">
                                        <th>주소</th>
                                        <td id="detTabAdd">
                                            <input class="addInp" style="margin-bottom : 10px;" type="text"
                                                id="sample4_postcode" placeholder="우편번호">
                                            <input style="width:90px;margin-left:8px;font-size:15px;text-align:center;" type="button"
                                                onclick="sample4_execDaumPostcode()" value="우편번호"><br>
                                            <input class="addInp" style="margin-bottom : 10px;width:285px;" type="text"
                                                id="sample4_roadAddress" placeholder="도로명주소"> <br>
                                            <input class="addInp" type="text" id="sample4_detailAddress" style="width:285px;"
                                                placeholder="상세주소">
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <div id="memberBooHis">
                        <div id="booHisLef">
                            <div id="booLenHis_header">
                                도서대출내역
                            </div>
                            <table id="booLenHis_tab" class="booHisTab">
                                <tr>
                                    <th>대출번호</th>
                                    <th>도서번호</th>
                                    <th>도서명</th>
                                    <th>대출일</th>
                                    <th>반납일</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                            </table>
                        </div>
                        <div id="booHisRig">
                            <div id="booBooHis_header">
                                도서예약내역
                            </div>
                            <table id="booBooHis_tab" class="booHisTab">
                                <tr>
                                    <th>예약번호</th>
                                    <th>도서번호</th>
                                    <th>도서명</th>
                                    <th>예약일</th>
                                    <th>대출예정일</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id="memberDetBtn">
                        <button type="button" class="btn btn-outline-secondary">수정하기</button>
                        <button type="button" class="btn btn-outline-secondary">뒤로가기</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
    



