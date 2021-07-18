<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서요청"/>
</jsp:include>

<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="wishbooktitle1">희망도서신청</h2>
    <br>
  </div>

<div class="menucontainer" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item">통합검색</li>
    <li class="list-group-item">상세검색</li>
    <li class="list-group-item">주제별검색</li>
    <li class="list-group-item">희망도서신청</li>
  </ul>
</div>
<br><br><br>
<table id="wishbooktable">
        <tr>
            <td>
               도서명
            </td>
            <td colspan="3">

                <input type="text" name="bookName" placeholder="내용을 입력해주세요" class="bookinfoinput" onkeypress="if(event.keyCode == 13){fn_searchPopup(); return false;}" id="bookinfoinput">
                <button id="button22" type="submit" onclick="fn_searchPopup();">검색</button>
                
            </td>
            

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="3">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
            <td>
                출판사
            </td>
            <td colspan="3">
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
            <td>
              ISBN
            </td>
            <td colspan="3">
                <input type="text" name="ISBN" placeholder="내용을 입력해주세요" id="bookinfoinput">
                
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
          <td>
            가격
          </td>
          <td colspan="3">
              <input type="text" name="ISBN" placeholder="내용을 입력해주세요" id="bookinfoinput">
              
          </td>
          <td>

          </td>
          <td>

          </td>

      </tr>
        <tr>
            <td>
               발행연도
            </td>
            <td colspan="3">
            
                <input id="publishYear1" type="text" name="publishYear" placeholder="발행년(시작)">
                
            </td>
            
            

        </tr>


</table>
<br><br><br>
<div id="buttonContainer">
<button id="button22" type="submit">신청확인</button>
<button id="button22" type="submit">취소</button>
</div>
<br><br><br>



</body>
	
	
</html>
<script>
function fn_searchPopup(){
	if($(".bookinfoinput").val()==""){
		alert("검색어를 입력해주세요")		
	}
	console.log($(".bookinfoinput").val());
	if($(".bookinfoinput").val()!=""){
		let keyword2=$(".bookinfoinput").val();
		
		 const url=${path }+"/searchpage/wishbookPopup";
		
		 
		 window.open("${path}/klibrary/searchpage/wishbookPopup?keyword2="+keyword2,"regPopup","width=800,height=600,scrollbars=yes");
	    	
	    	
	}
	
}

$('#bookinfoinput').not($(".bookinfoinput")).focus(function(){
	if($(".bookinfoinput").val()==""){
		
		alert("도서명을 먼저 검색해주세요.")
	}
})

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>