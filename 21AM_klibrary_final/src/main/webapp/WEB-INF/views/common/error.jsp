<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="HelloSpring"/>
</jsp:include>

<section id="content">
	<h1 style="color:red"><%=exception.getMessage() %></h1>
	<p>3초 후 메인화면으로 이동합니다</p>
	<script>
		setTimeout(()=>{
			location.replace("${path}");
		},3000);
	</script>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>