<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/dg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hj.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sy.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/yh.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cg.css">
    <!-- fontawsome CDN 불러오기 -->
    
    <title>메인페이지</title>

	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 
</head>
<body>
  
  <div class="divcontainer1">
    <br>
    <h2 id="title11">상세검색</h2>
    <br>
  </div>

<div class="detailsearchcontainer" >
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
<table id="bookDetailSearchTbl">
        <tr>
          <td>
            종류
          </td>
          <td id="bookCategorySelectTd" colspan="3">
            <span>
             <select id="book_Category" name="book_Category" style="height:30px;">
              <option selected>도서 대분류</option>
              <option value="general">총류</option>
              <option value="philosophy">철학</option>
              <option value="religion">종교</option>
              <option value="socialScience">사회과학</option>
              <option value="naturalScience">자연과학</option>
              <option value="technologyScience">기술과학</option>
              <option value="art">예술</option>
              <option value="language">언어</option>
              <option value="literature">문학</option>
              <option value="history">역사</option>
            </select>
            </span>
            <span>
            <select id="book_Category2" name="book_Category2" style="height:30px;">
              <option value="" selected>도서 소분류</option>
            </select>
             </span>
          </td>
          

        </tr>

        <tr>
          <td>
            초성검색
          </td>
          <td id="alphabetCheckTd" colspan="3">
            <label><input type="checkbox" name="ㄱ" value="ㄱ">ㄱ</label>
            <label><input type="checkbox" name="ㄴ" value="ㄴ">ㄴ</label>
            <label><input type="checkbox" name="ㄷ" value="ㄷ">ㄷ</label>
            <label><input type="checkbox" name="ㄹ" value="ㄹ">ㄹ</label>
            <label><input type="checkbox" name="ㅁ" value="ㅁ">ㅁ</label>
            <label><input type="checkbox" name="ㅂ" value="ㅂ">ㅂ</label>
            <label><input type="checkbox" name="ㅅ" value="ㅅ">ㅅ</label>
            <label><input type="checkbox" name="ㅇ" value="ㅇ">ㅇ</label>
            <label><input type="checkbox" name="ㅈ" value="ㅈ">ㅈ</label>
            <label><input type="checkbox" name="ㅊ" value="ㅊ">ㅊ</label>
            <label><input type="checkbox" name="ㅋ" value="ㅋ">ㅋ</label>
            <label><input type="checkbox" name="ㅌ" value="ㅌ">ㅌ</label>
            <label><input type="checkbox" name="ㅍ" value="ㅍ">ㅍ</label>
            <label><input type="checkbox" name="ㅎ" value="ㅎ">ㅎ</label>

          </td>


        </tr>

        <tr>
            <td>
               도서명
            </td>
            <td colspan="3">

                <input type="text" name="bookName" placeholder="내용을 입력해주세요" id="inputtext2">
            </td>
            <td>

            </td>
            <td>

            </td>

        </tr>
        <tr>
            <td>
              저자명
            </td>
            <td colspan="3">
               <input type="text" name="author" placeholder="내용을 입력해주세요" id="inputtext2">
                
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
                <input type="text" name="publisher" placeholder="내용을 입력해주세요" id="inputtext2">
                
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
                <input type="text" name="ISBN" placeholder="내용을 입력해주세요" id="inputtext2">
                
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
              <input type="text" name="price" placeholder="내용을 입력해주세요" id="inputtext2">
              
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
            <td >
            
                <input id="publishYear1" type="text" name="publishYear" placeholder="발행년(시작)">-
                
            </td>
            
            <td>
              <input id="publishYear2" type="text" name="publishYear" placeholder="발행년(시작)">
            </td>
            <td>
              
              
            </td>

        </tr>

        <tr>
          <td colspan="4">

            <br><br><br>
            <div id="buttonContainer">
            <button id="button21" type="submit">입력초기화</button>
            <button id="button21" type="submit">검색</button>
            </div>
            <br><br><br>

          </td>


        </tr>


</table>



</body>
	<script>
  $(function() {
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
        });
</script>
</html>
	
