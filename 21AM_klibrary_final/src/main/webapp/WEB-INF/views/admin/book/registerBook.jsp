<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/admin/common/header.jsp">
	<jsp:param name="title" value="도서등록" />
</jsp:include>
	<div id="ad_right">
	<form action="${path }/admin/book/insertBook.do" method="post">
		<div id="contHeader">도서 등록</div>
		<div id="contBody">
		<table id="reg_book_table" class="pa">
				<tr>
					<td>도서명</td>
					<td class="reg_book_cate" style="vertical-align:bottom;">
						<input type="text" name="bookName" id="bookName" value="" placeholder="도서명" readonly required>
						<button type="button" class="btn btn-outline-secondary" style="height:30px;line-height:15px;margin-bottom:4px;" onclick="regPopup()">검색</button>
						<span id="isbnMsg"></span>
					</td>
				</tr>
				<tr>
					<td>한국십진분류</td>
					<td class="reg_book_cate"><input type="text" name="bookKdc" id="classNo" value="" placeholder="한국십진분류" required></td>
				</tr>
				<tr>
					<td>청구기호</td>
					<td class="reg_book_cate"><input type="text" name="bookLocation" id="callNo" value="" placeholder="청구기호" required></td>
				</tr>
				<tr>
					<td>저자</td>
					<td class="reg_book_cate"><input type="text" name="bookWriter" id="author" value="" placeholder="저자" required></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td class="reg_book_cate"><input type="text" name="bookCompany" id="publisher" value="" placeholder="출판사" required></td>
				</tr>
				<tr>
					<td>발행일</td>
					<td class="reg_book_cate"><input type="text" name="bookDate" id="regDate" value="" placeholder="발행일" required></td>

				</tr>
				<tr>
					<td>가격</td>
					<td class="reg_book_cate"><input type="text" name="bookPrice" id="price" value="" placeholder="가격" required></td>
				</tr>
				<tr>
					<td>ISBN</td>
					<td class="reg_book_cate"><input type="text" name="isbnNo" id="isbn" value="" placeholder="ISBN" required></td>
				</tr>
				<tr>
					<td>줄거리</td>
					<td>
						<textarea name = "bookContent" id="content" rows="5" cols="30" style="width:800px;height:250px;resize:none;">
							줄거리
						</textarea>
					</td>
				</tr>
				<input type="text" name="bookImg" id="img" value="" style="display:none;"/>
		</table>
		<div id="regBookBtn">
			<button type="submit" class="btn btn-outline-secondary" >등록</button>
		</div>
	</div>
</form>
</div>
</section>

<script>

/* /* $(function() {
            $('#book_Category').change(function() {
                var general = ["총류일반", "도서관,정보학", "일반백과사전","일반전집,총서","필사본,희귀본"];
                var philosophy = ["철학일반", "고대,중세,동양철학", "서양철학(현대)","형이상학","심리학","윤리학"];
                var religion = ["기독교", "자연신학", "불교 및 한국종교","이슬람교","조로아스터교"];
                var socialScience = ["사회과학일반", "정치학", "법학","사회복지","무역","일반통계학","경제학","행정학","교육학"];
                var naturalScience = ["수학일반", "천문학", "물리학","화학","지구과학","생물학","식물학","동물학"];
                var technologyScience = ["기술과학일반", "일반공학", "화학공학","의학","농업","제조","건축"];
                var art = ["예술일반", "그림,장식예술", "판화,판각","음악","도시,풍경예술","조각","회화","사진술"];
                var language = ["어학일반", "영어", "불어","스페인,포르투갈어","고대그리스어","한국어","독어","이태리어","기타언어"];
                var history = ["지리,역사일반", "유럽역사", "아프리카역사","남아메리카 역사","아시아 역사","북아메리카 역사"];
                var changeItem;
                if (this.value == "general") {
                    changeItem = general;
                } else if (this.value == "philosophy") {
                    changeItem = philosophy;
                }
                else if (this.value == "religion") {
                    changeItem = religion;
                }
                else if (this.value == "socialScience") {
                    changeItem = socialScience;
                }
                else if (this.value == "naturalScience") {
                    changeItem = naturalScience;
                }
                else if (this.value == "technologyScience") {
                changeItem = technologyScience;
                }
                else if (this.value == "art") {
                changeItem = art;
                }
                else if (this.value == "language") {
                changeItem = language;
              }
                else if (this.value == "history") {
                changeItem = history;
                }
                
                $('#book_Category2').empty();
                for (var count = 0; count < changeItem.length; count++) {
                    var option = $("<option>" + changeItem[count] + "</option>");
                    $('#book_Category2').append(option);

                }
            });
        }); */

        </script>
        
        <script>
		
        // navigation 클릭 이벤트 
	    $(function(){
	        // ul show()
	        $(".navOptions").eq(1).show();
	        // ul li 배경화면 
	        $(".navOptions").eq(1).children().eq(4).css({ "font-size": "20px", "fontWeight": "bold", "backgroundColor": "#7DA5E1" });
	    })
	    
        // 팝업창 
	    const regPopup = function(){
	    	window.open("${path}/admin/book/searchIsbn.do","regPopup","width=700,height=600,scrollbars=yes");
	    }
        
        // 책 등록 
        const fn_insertBook=()=>{
        	location.href="${path}/admin/book/insertBook.do";
        }
	        	
    
	</script>

<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />