<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
<%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="희망도서요청"/>
</jsp:include>

<body>
  
	<div class="divcontainer1">
	  <br>
	  <h2 id="wishbooktitle1">희망도서신청</h2>
	  <br>
	</div>
 

<div class="list-group-container" >
  <!-- <h2 id="title">자료검색</h2> -->
  <ul class="list-group">
    <li class="list-group-item" id="menutitle">자료검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/bookSearch.do')">통합검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/detailSearch.do')">상세검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/categorySearch.do')">주제별검색</li>
    <li class="list-group-item" onclick="location.replace('${path}/searchpage/wishbook.do')">희망도서신청</li>
  </ul>
</div>
<br><br><br>
<form action="${path}/searchpage/wishBookCheckInsert.do" id="BookSearchInfoForm" method="post">
<table id="wishbooktable">
        <tr>
            <td>
               도서명
            </td>
            <td colspan="3">

                <input type="text" name="bookName" placeholder="내용을 입력해주세요" class="bookinfoinput" onkeypress="if(event.keyCode == 13){fn_searchPopup(); return false;}" id="bookinfoinput1">
                <button id="button22" type="button" style="margin-left:10px; font-size:20px; width:10%"onclick="fn_searchPopup();">검색</button>
                
            </td>
            

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="3">
               <input type="text" name="author" placeholder="내용을 입력해주세요" class="bookinfoinput" id="bookinfoinput2">
                
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
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" class="bookinfoinput" id="bookinfoinput3">
                
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
                <input type="text" name="isbn" placeholder="내용을 입력해주세요" class="bookinfoinput" id="bookinfoinput4">
                
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
              <input type="text" name="price" placeholder="내용을 입력해주세요" class="bookinfoinput" id="bookinfoinput5">
              
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
            
                <input id="publishYear1" type="text" name="publishYear" class="bookinfoinput" placeholder="발행년(시작)">
                
            </td>
            
            

        </tr>
  
</table>

	  <div id="buttonContainer2">
		<button id="button22" style="margin-right:10px;" type="button" onclick='fn_requestSubmit()'>신청하기</button>
		<button id="button22" type="button" onclick='fn_requestCancel()'>초기화</button>
	</div>
</form>
<br><br><br>




</body>
	
	
</html>
<script>
function fn_searchPopup(){
	if($("#bookinfoinput1").val()==""){
		alert("검색어를 입력해주세요")		
	}
	console.log($("#bookinfoinput1").val());
	if($("#bookinfoinput1").val()!=""){
		let keyword2=$("#bookinfoinput1").val();
		
		 const url="${path }/searchpage/wishbookPopup";
		
		 
		 window.open("${path}/searchpage/wishbookPopup?keyword2="+keyword2,"regPopup","width=800,height=600,scrollbars=yes");
	    	
	    	
	}
	
}



function bookRequestInfo(bookName,bookWriter,bookCompany,isbnNo,bookPrice,bookDate){
	console.log("들어왔나test"+bookName+bookWriter);
	
	let bookDate1=bookDate.substring(0,10);
	let isbnNo1=isbnNo.substring(0,10);
	
	 
	 document.getElementById('bookinfoinput1').value=bookName;
	 document.getElementById('bookinfoinput2').value=bookWriter;
	document.getElementById('bookinfoinput3').value=bookCompany;
	document.getElementById('bookinfoinput4').value=isbnNo1;
	document.getElementById('bookinfoinput5').value=bookPrice;
	
	document.getElementById( 'publishYear1' ).value=bookDate1;
     
	
	
}

function fn_requestSubmit(){
	console.log("테스트");
	let bookinfoinput=document.getElementsByClassName('bookinfoinput');
	console.log(bookinfoinput);
	var form=document.getElementById('BookSearchInfoForm')
	var check=0;
	for(var i=0; i< bookinfoinput.length; i++){
		
		console.log(bookinfoinput[i]);
		if(bookinfoinput[i].value==""){
			alert("내용을 전부 입력해주세요");
			break;
		}else{
			check+=1;
		}
		if(check==6){
			form.submit();
		}
	}
	
	
	
	
}

	function fn_requestCancel(){
	 
		 document.getElementById('bookinfoinput1').value="";
		 document.getElementById('bookinfoinput2').value="";
		document.getElementById('bookinfoinput3').value="";
		document.getElementById('bookinfoinput4').value="";
		document.getElementById('bookinfoinput5').value="";
		
		document.getElementById( 'publishYear1' ).value="";
}


	$(function(){
		console.log(window.location.href );
		
		  
		  $(".list-group").children().eq(4).css({"backgroundColor" : "lightgrey"})
		  
			 	   
		})
	

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>