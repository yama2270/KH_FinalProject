<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="관리자 메인페이지"/>
</jsp:include>

<div id="ad_right">
            <div id="contHeader">관리자페이지</div>
            <div id="contbody">
                <div id="mainWrap">관리자 페이지에 오신것을 환영합니다</div>
            </div>
        </div>
</section>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>