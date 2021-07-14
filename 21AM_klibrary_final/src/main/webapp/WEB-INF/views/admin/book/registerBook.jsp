<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="도서등록"/>
</jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sh.css">
    <!-- fontawsome CDN 불러오기 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
    <title>도서 등록</title>
</head>
<body id="ad_body">
    <header id="ad_header">
            <div id="header_title">K-도서관</div>
            <div id="header_options">
                <div id="header_moveMain">메인페이지</div>
                <div id="header_logout">로그아웃</div>
        </div>
    </header>
    <section id="ad_container">
        <div id="ad_left">
            <div id="leftNav">
                <ul id="lefNavList">
                    <li>회원관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>회원정보</li>
                            <li>탈퇴요청</li>
                        </ul>
                    </li>                            
                    <li>도서관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>전체도서목록</li>
                            <li>도서등록</li>
                            <li>도서대출현황</li>
                            <li>도서예약현황</li>
                        </ul>
                    </li>
                    <li>게시글 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>공지사항 관리</li>
                            <li>문의사항 관리</li>
                            <li>자주하는 질문</li>
                        </ul>
                    </li>
                    <li>열람실 관리 <i class="fas fa-plus"></i>
                        <ul class="navOptions">
                            <li>전체조회</li>
                            <li>열람실A</li>
                            <li>열람실B</li>
                            <li>열람실C</li>
                            <li>열람실D</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        
        <div id="ad_right">
            <div id="contHeader">도서 등록</div>
            <div id="contbody">
        </div>
        
                <table id="reg_book_table" class="pa" border style="margin-left:10%;margin-top:3%;">
                    <thead>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">종류</td>
                            <td>
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
                              <select id="book_Category2" name="book_Category2" style="height:30px;">
                                <option value="" selected>도서 소분류</option>
                              </select>
                              
                        </td>
                        </tr>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">도서명</td>
                            <td><input type="text" name="" value="" placeholder="도서명" disabled style="margin-left:45px;">
                            <button id="search_book" name="검색" value="">검색</button>
                            </td>
                        </tr>
                        <tr>
                          <td class="reg_book_cate" style="background-color: #eaeaea;">표지</td>
                          <td><img class="book_image" src="C:\Users\WORK\Desktop\FINAL\img\book1.jpg"></td>
                      </tr>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">저자</td>
                            <td><input type="text" name="" value="" placeholder="저자"></td>
                        </tr>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">출판사</td>
                            <td><input type="text" name="" value="" placeholder="출판사"></td>
                        </tr>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">발행일</td>
                            <td><input type="text" name="" value="" placeholder="발행일"></td>
                            
                        </tr>
                        <tr>
                          
                            <td class="reg_book_cate" style="background-color: #eaeaea;">가격</td>
                            <td><input type="text" name="" value="" placeholder="가격"></td>
                            
                        </tr>
                        <tr>
                            <td class="reg_book_cate" style="background-color: #eaeaea;">ISBN</td>
                            <td><input type="text" name="" value="" placeholder="ISBN"></td>
                        </tr>
                        <tr>
                          <td class="reg_book_cate" style="background-color: #eaeaea;">줄거리</td>
                          <td><input type="text" name="" value="" placeholder="줄거리" style="width:800px;height:200px;"></td>
                      </tr>
                    </thead>
                    
                    <tbody>
          
                    </tbody>
                </table>
                <td>
                  <button style="margin-left: 45%; margin-top:2%;">취소</button>
                  <button style="margin-left: 1%;">등록</button>
                </td>
                
            </div>

        </div>

    </section>
    <!--section에 적용될 style, script 내용 넣어주세요-->
    <style>
    </style>

 

    <script>

      // navigation 이벤트
    
    $(function(){

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
    
$('#odfselect').change(function() {
    var value = $(this).val();
    $(this).css('color', value);
});

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
    
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>