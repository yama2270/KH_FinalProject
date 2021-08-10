<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>    
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="공지사항상세"/>
</jsp:include>
<body id="ad_body">
    <section id="ad_container">
        <div id="he_right">
            <div id="noticeTitleHead" style="width:1260px;font-size:30px;border-bottom:2px gray solid;margin-top:20px;">공지사항</div>
            <div class="tableMap2" style="width:1260px;">
                <table class="table2">
                     <tr class="line">
                        <td class="line3">분류</td>
                        <td class="line2"><c:out value="${notice.noticeCate}"/></td>
                    </tr>
                    <tr class="line">
                        <td class="line3">제목</td>
                        <td class="line2"><c:out value="${notice.noticeTitle}"/></td>
                    </tr>
                    <tr class="line">
                        <td class="line3">등록일</td>
                        <td class="line2"><c:out value="${notice.noticeDate}"/></td>
                    </tr>
	                    <tr class="line">
	                        <td class="line3">첨부파일</td>
	                        <td class="line2">
					        	
	                
	                        </td>
	                    </tr>
                    <tr class="line">
                        <td class="line3">조회수</td>
                        <td class="line2"><c:out value="${notice.noticeCount}"/></td>
                    </tr>
                </table>
                
                <div class="contentbox" style="width:1260px;"><c:out value="${notice.noticeContent}"/></div>
             	    <div class="notice_update">
                      <a href="${path }/admin/notice/noticeUpdate.do?noticeNo=${notice.noticeNo}">	
                         <button class="notice_update_bt" style="margin-left:150px; margin-top:10px;" >수정하기</button>
						 </a>	
                <button class="backbutton" onclick="backbutton();">목록으로</button>
                    </div>
            </div>
        </div>
    </section>
        <!--section에 적용될 style, script 내용 넣어주세요-->
  
        <script>

            
        $(function(){
            // ul show()
            $(".navOptions").eq(2).show();
            // ul li 배경화면 
            $(".navOptions").eq(2).children().eq(0).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
        })
    
        
    
		$(function(){
			$("[name=upFile]").change(e=>{
				const fileName=$(e.target).prop('files')[0].name;
				$(e.target).next(".custom-file-label").html(fileName);
			});
		})
		
		   
    	const backbutton=()=>{
    		location.assign("${path}/admin/notice/noticeList.do")
    	}

	
        
/*             $(function(){

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

        })
             */


        </script>
        
        <jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>