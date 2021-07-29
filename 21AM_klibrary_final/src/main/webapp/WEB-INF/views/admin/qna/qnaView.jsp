	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="문의사항 등록"/>
</jsp:include>   
        <div id="ad_right">
            <div id="contHeader">문의사항 답변</div>
            <div id="contbody">
        </div>
         	<form name="qnaForm" action="${path}/admin/qna/qnaAnswerUpdateEnd.do" method="post" enctype="multipart/form-data" >
         	<input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
         	<input type="hidden" name="userId" value="${qna.userId }"/>
        <div id="QnA_box">
                <table id="QnA_table" class="pa" border>
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th width=100>질문유형</th>
                            <th width=450>제목</th>
                            <th width=150>작성자</th>
                            <th width=150>작성일</th>
                            <th width=150>답변상태</th>
                        </tr>
                        <tr>        
                           <td class="line2"><c:out value="${qna.qnaCate}"/></td>
                           <td class="line2"><c:out value="${qna.qnaTitle}"/></td>
                           <td class="line2"><c:out value="${qna.userId}"/></td>
                           <td class="line2"><c:out value="${qna.qnaDate}"/></td>
                           <td>
                           <select class="form-control form-control-sm w-auto" id="qnaState" name="qnaState" required>
			                    <option value="미답변"
			                    	<c:if test="${qna.qnaState == '미답변'}">selected</c:if>>미답변</option>
			                    <option value="답변완료"
			                    	<c:if test="${qna.qnaState == '답변완료'}">selected</c:if>>답변완료</option>
	                       </select>
	                    	</td>
                         </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

                <div class="rv_write">
                    <div class="contentbox" style="width:1000px;height:250px;"><c:out value="${qna.qnaContent }" /></div>
                </div>

                <div class="rv_write">
                    <textarea id="wr_content" name="qnaAnswerContent"  maxlength="1000" style="width:1000px; height: 250px;margin-top:5px;
	                placeholder="내용을 입력해주세요" ><c:out value="${qna.qnaAnswerContent }"/></textarea>
                </div>
                <a href='<c:url value='/admin/qna/adminqnaList.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:87%;margin-top:1%;">이전</a>
                <input type="submit" class="btn btn-outline-dark" style="margin-left:1%;margin-top:1%;" value="완료">
            </div>
            </form>
  	</div>
  
    </section>

    
    <script>

    $(function(){
        // ul show()
        $(".navOptions").eq(2).show();
        // ul li 배경화면 
        $(".navOptions").eq(2).children().eq(1).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
   const backbutton=()=>{
   location.assign("${path}/admin/qna/adminqnaList.do")
    	}
    
/*     $(function(){

const naviList = $("#lefNavList").children();
const options = $(".navOptions")

$(naviList).click((e)=>{
    $(naviList).children().not('i').hide();
    $(naviList).children().filter('i').attr("class","fas fa-plus");
    $(options).children().css({"font-size":"15px","backgroundColor":"#9BC3FF","fontWeight":"normal"})
    $(e.target).find("ul").show();
    $(e.target).find("i").attr("class","fas fa-minus");
})

// navigation - option 이벤트 

$(options).mouseover((e)=>{
    $(e.target).css("textDecoration","underline");
})

$(options).mouseout((e)=>{
    $(e.target).css("textDecoration","");
})

$(options).click((e)=>{
    
    $(options).children().css({"font-size":"15px","backgroundColor":"#9BC3FF","fontWeight":"normal"})
    $(e.target).css({"font-size":"20px","fontWeight":"bold","backgroundColor":"#7DA5E1"})
    return false;
})

}) */
    

    </script>
    
    <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>