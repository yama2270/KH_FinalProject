<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:url var="NoticeListURL" value="/admin/notice/noticeList"></c:url>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항검색"/>
</jsp:include>
	        <div id="ad_right">
            <div id="contHeader">공지사항 검색</div>
            <div id="contbody">
            
        <div id="notice_box">
            <div id="notice_table_box">
                <div id="total_notice" style="margin-left:-3%;">
                    <ul class="pagination" style="margin-top:23px;">

						<form id="noticeSearch" action="${path }/admin/notice/noticeSearch.do" method="post">
                        <div class="dropdown">
                            <div id="dropdown_category">
                              <select class="odfselect" name="category" style="height:30px;margin-left:670px;margin-bottom:200px;">
                                  <option value="제목" selected>제목</option>
                                  <option value="내용">내용</option>
                              </select>
                      <span class="searchBar" style="margin-left:20px;">
                              <input type="text" name="keyWord">
                              <input type="submit" value="검색">
                      </span>
                          </div>
                      </div>
                        </form>
                  </ul>
              </div>
                <table id="notice_table" class="pa" border style="margin-left:-3%;">
                    <thead>
                        <tr style="background-color: #eaeaea;">
                            <th><input type="checkbox" id="allCheck" name="allCheck" /></th>
                            <th width=100>번호</th>
                            <th width=100>분류</th>
                            <th width=450>제목</th>
                            <th width=150>작성자</th>
                            <th width=150>작성일</th>
                            <th width=100>조회수</th>
                        </tr>
                        <c:choose> 
   					<c:when test="${not empty list }">
   					<c:forEach var="notice" items="${list }">
   						<tr>
   							<td class="cols"><input type="checkbox" name="RowCheck" value="${notice.noticeNo }"/>
   							<td class="cols"><c:out value="${notice.noticeNo }"/></td>
   							<td class="cols"><c:out value="${notice.noticeCate }"/></td>
   							<td class="cols">
   								<a href="${path }/admin/notice/noticeView.do?noticeNo=${notice.noticeNo}">
   									<c:out value="${notice.noticeTitle }"/>
   								</a>
   							</td>
   							<td class="cols"><c:out value="관리자"/></td>
   							<td class="cols"><c:out value="${notice.noticeDate }"/></td>					
   							<td class="cols"><c:out value="${notice.noticeCount }"/></td>
   						</tr>
   					</c:forEach>
   				</c:when>
   				<c:otherwise>
   					<tr>
   					<td colspan="6">조회된 자료가 없습니다</td>
   					</tr>
   				</c:otherwise>       		
          	</c:choose>
                      
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <a href='<c:url value='/admin/notice/noticeForm.do'/>' role="button" class="btn btn-outline-dark" style="margin-left:84%;margin-top:2%;">작성</a>
        	<input type="button" value="삭제" class="btn btn-outline-dark" style="margin-top:2%;" onclick="deleteValue();">

	        <div id="pagebar-container">
	        	${pageBar }
	        </div>
        </div>

    </section>
    <!--section에 적용될 style, script 내용 넣어주세요-->


    <script>
    
    
    $(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
    
	function deleteValue(){
		var url = "${path}/admin/notice/noticeDelete.do"    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
		var valueArr = new Array();
	    var list = $("input[name='RowCheck']");
	    for(var i = 0; i < list.length; i++){
	        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
	            valueArr.push(list[i].value);
	        }
	    }
	    if (valueArr.length == 0){
	    	alert("선택된 글이 없습니다.");
	    }
	    else{
			var chk = confirm("정말 삭제하시겠습니까?");				 
			$.ajax({
			    url : "${path}/admin/notice/noticeDelete.do", // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
                success: function(jdata){
                    if(jdata = 1) {
                        alert("삭제 성공");
                        location.replace("${path}/admin/notice/noticeList.do")
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
			});
		}
	}



    $(function(){
        // ul show()
        $(".navOptions").eq(2).show();
        // ul li 배경화면 
        $(".navOptions").eq(2).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
    })
    
   
    
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

$(function(){ //전체선택 체크박스 클릭 
  $("#allCheck").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
    if($("#allCheck").prop("checked")) { 
      //해당화면에 전체 checkbox들을 체크해준다 
      $("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
    } else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
      $("input[type=checkbox]").prop("checked",false); } 
    })
   })

    </script>
    
 <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>