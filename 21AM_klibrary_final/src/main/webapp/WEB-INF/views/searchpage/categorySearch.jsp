<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%   request.setCharacterEncoding("UTF-8");
String pageId = request.getParameter("pageId");

%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> 
 
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="종류별검색"/>
</jsp:include>

<body>
  
  <div class="topContainer1">
    <br>
    <h2 id="topContainerTitle">주제별검색</h2>
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

<form id="searchForm" name="searchForm" method="post">
  

    <div class="kdcSearch">
        <table id="kdcDepth1List" class="kdcDepth1List clearfix">
            <tr>
                <td class="kdc0">
                    <a id="0" class="choiced"><img src="${path }/resources/images/general.png" id="0" class="ico"></a><br><br>
                    <span class="txt">총류</span>
                </td>
            
                <td class="kdc1">
                    <a id="1" class=""><img src="${path }/resources/images/philosophy.png" id="1" class="ico"></a><br><br>
                    <span class="txt">철학</span>
                </td>
            
                <td class="kdc2">
                    <a id="2" class=""><img src="${path }/resources/images/religion.png" id="2" class="ico"></a><br><br>
                    <span class="txt">종교</span>
                </td>
            
                <td class="kdc3">
                    <a id="3"><img src="${path }/resources/images/socialScience.png" id="3" class="ico"></a><br><br>
                    <span class="txt">사회과학</span>
                </td>
            
                <td class="kdc4">
                    <a id="4"><img src="${path }/resources/images/naturalScience.png" id="4" class="ico"></a><br><br>
                    <span class="txt">자연과학</span>
                </td>
            </tr>
            <tr>
                <td class="kdc5">
                    <a id="5"><img src="${path }/resources/images/technologyScience.png" id="5" class="ico"></a><br><br>
                    <span class="txt">기술과학</span>
                </td>
            
                <td class="kdc6">
                    <a id="6"><img src="${path }/resources/images/art.png" id="6" class="ico"></a><br><br>
                    <span class="txt">예술</span>
                </td>
            
                <td class="kdc7">
                    <a id="7"><img src="${path }/resources/images/language.png" id="7" class="ico"></a><br><br>
                    <span class="txt">언어</span>
                </td>
            
                <td class="kdc8">
                    <a id="8"><img src="${path }/resources/images/art.png" id="8" class="ico"></a><br><br>
                    <span class="txt">문학</span>
                </td>
            
                <td class="kdc9">
                    <a id="9"><img src="${path }/resources/images/history.png" id="9" class="ico"></a><br><br>
                    <span class="txt">역사</span>
                </td>
            </tr>
            </table>
            <br><br>
            <div style="text-align:center;"><span id="nonsearch" style="display:none;"><h4>검색된 내용이 없습니다</h3></span></div>
          
            <table id="kdcDepth2List_0" class="kdcDepth2List" style="display: block;">
                <tr>
                    
                    <td>
                        <dl>
                            <dt><a href="#btn" id="00" title="00 총류">00 총류</a></dt>
                            
                                <dd><a href="#btn" id="000" title="000 총류">000 총류</a></dd>
                            
                                <dd><a href="#btn" id="001" title="001 지식, 학문 일반">001 지식, 학문 일반</a></dd>
                            
                                <dd><a href="#btn" id="003" title="003 시스템">003 시스템</a></dd>
                            
                                <dd><a href="#btn" id="004" title="004 컴퓨터과학">004 컴퓨터과학</a></dd>
                            
                                <dd><a href="#btn" id="005" title="005 프로그래밍, 프로그램, 데이터">005 프로그래밍, 프로그램, 데이터</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="01" title="01 도서학, 서지학">01 도서학, 서지학</a></dt>
                            
                                <dd><a href="#btn" id="010" title="010 도서학, 서지학">010 도서학, 서지학</a></dd>
                            
                                <dd><a href="#btn" id="011" title="011 저작">011 저작</a></dd>
                            
                                <dd><a href="#btn" id="012" title="012 사본, 판본, 제본">012 사본, 판본, 제본</a></dd>
                            
                                <dd><a href="#btn" id="013" title="013 출판 및 판매">013 출판 및 판매</a></dd>
                            
                                <dd><a href="#btn" id="014" title="014 개인서지 및 목록">014 개인서지 및 목록</a></dd>
                            
                                <dd><a href="#btn" id="015" title="015 국가별 서지 및 목록">015 국가별 서지 및 목록</a></dd>
                            
                                <dd><a href="#btn" id="016" title="016 주제별 서지 및 목록">016 주제별 서지 및 목록</a></dd>
                            
                                <dd><a href="#btn" id="017" title="017 특수서지 및 목록">017 특수서지 및 목록</a></dd>
                            
                                <dd><a href="#btn" id="018" title="018 일반서지 및 목록">018 일반서지 및 목록</a></dd>
                            
                                <dd><a href="#btn" id="019" title="019 장서목록">019 장서목록</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="02" title="02 문헌정보학">02 문헌정보학</a></dt>
                            
                                <dd><a href="#btn" id="020" title="020 문헌정보학">020 문헌정보학</a></dd>
                            
                                <dd><a href="#btn" id="021" title="021 도서관행정 및 재정">021 도서관행정 및 재정</a></dd>
                            
                                <dd><a href="#btn" id="022" title="022 도서관건물 및 설비">022 도서관건물 및 설비</a></dd>
                            
                                <dd><a href="#btn" id="023" title="023 도서관 경영, 관리">023 도서관 경영, 관리</a></dd>
                            
                                <dd><a href="#btn" id="024" title="024 수서, 정리 및 보관">024 수서, 정리 및 보관</a></dd>
                            
                                <dd><a href="#btn" id="025" title="025 도서관봉사 및 활동">025 도서관봉사 및 활동</a></dd>
                            
                                <dd><a href="#btn" id="026" title="026 일반 도서관">026 일반 도서관</a></dd>
                            
                                <dd><a href="#btn" id="027" title="027 학교 및 대학도서관">027 학교 및 대학도서관</a></dd>
                            
                                <dd><a href="#btn" id="029" title="029 독서 및 정보매체의 이용">029 독서 및 정보매체의 이용</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="03" title="03 백과사전">03 백과사전</a></dt>
                            
                                <dd><a href="#btn" id="030" title="030 백과사전">030 백과사전</a></dd>
                            
                                <dd><a href="#btn" id="031" title="031 한국어">031 한국어</a></dd>
                            
                                <dd><a href="#btn" id="032" title="032 중국어">032 중국어</a></dd>
                            
                                <dd><a href="#btn" id="033" title="033 일본어">033 일본어</a></dd>
                            
                                <dd><a href="#btn" id="034" title="034 영어">034 영어</a></dd>
                            
                                <dd><a href="#btn" id="035" title="035 독일어">035 독일어</a></dd>
                            
                                <dd><a href="#btn" id="036" title="036 프랑스어">036 프랑스어</a></dd>
                            
                                <dd><a href="#btn" id="037" title="037 스페인어">037 스페인어</a></dd>
                            
                                <dd><a href="#btn" id="038" title="038 이탈리아어">038 이탈리아어</a></dd>
                            
                                <dd><a href="#btn" id="039" title="039 기타 제언어">039 기타 제언어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="04" title="04 강연집, 수필집, 연설문집">04 강연집, 수필집, 연설문집</a></dt>
                            
                                <dd><a href="#btn" id="040" title="040 강연집, 수필집, 연설문집">040 강연집, 수필집, 연설문집</a></dd>
                            
                                <dd><a href="#btn" id="041" title="041 한국어">041 한국어</a></dd>
                            
                                <dd><a href="#btn" id="042" title="042 중국어">042 중국어</a></dd>
                            
                                <dd><a href="#btn" id="043" title="043 일본어">043 일본어</a></dd>
                            
                                <dd><a href="#btn" id="044" title="044 영어">044 영어</a></dd>
                            
                                <dd><a href="#btn" id="045" title="045 독일어">045 독일어</a></dd>
                            
                                <dd><a href="#btn" id="046" title="046 프랑스어">046 프랑스어</a></dd>
                            
                                <dd><a href="#btn" id="047" title="047 스페인어">047 스페인어</a></dd>
                            
                                <dd><a href="#btn" id="048" title="048 이탈이아어">048 이탈이아어</a></dd>
                            
                                <dd><a href="#btn" id="049" title="049 기타 제언어">049 기타 제언어</a></dd>
                            
                        </dl>
                    </td>
                   
                </tr>
                <tr>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="05" title="05 일반 연속간행물">05 일반 연속간행물</a></dt>
                            
                                <dd><a href="#btn" id="050" title="050 일반 연속간행물">050 일반 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="051" title="051 한국어">051 한국어</a></dd>
                            
                                <dd><a href="#btn" id="052" title="052 중국어">052 중국어</a></dd>
                            
                                <dd><a href="#btn" id="053" title="053 일본어">053 일본어</a></dd>
                            
                                <dd><a href="#btn" id="054" title="054 영어">054 영어</a></dd>
                            
                                <dd><a href="#btn" id="055" title="055 독일어">055 독일어</a></dd>
                            
                                <dd><a href="#btn" id="056" title="056 프랑스어">056 프랑스어</a></dd>
                            
                                <dd><a href="#btn" id="057" title="057 스페인어">057 스페인어</a></dd>
                            
                                <dd><a href="#btn" id="058" title="058 기타 제언어">058 기타 제언어</a></dd>
                            
                                <dd><a href="#btn" id="059" title="059 연감">059 연감</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="06" title="06 일반 학회, 단체, 협회, 기관">06 일반 학회, 단체, 협회, 기관</a></dt>
                            
                                <dd><a href="#btn" id="060" title="060 일반 학회, 단체, 협회, 기관">060 일반 학회, 단체, 협회, 기관</a></dd>
                            
                                <dd><a href="#btn" id="061" title="061 아시아 일반 학회, 단체 등">061 아시아 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="062" title="062 유럽 일반 학회, 단체 등">062 유럽 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="063" title="063 아프리카 일반 학회, 단체 등">063 아프리카 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="064" title="064 북아메리카 일반 학회, 단체 등">064 북아메리카 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="065" title="065 남아메리카 일반 학회, 단체 등">065 남아메리카 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="066" title="066 오세아니아 일반 학회, 단체 등">066 오세아니아 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="067" title="067 양극지방 일반 학회, 단체 등">067 양극지방 일반 학회, 단체 등</a></dd>
                            
                                <dd><a href="#btn" id="069" title="069 박물관학">069 박물관학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="07" title="07 신문, 저널리즘">07 신문, 저널리즘</a></dt>
                            
                                <dd><a href="#btn" id="070" title="070 신문, 저널리즘">070 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="071" title="071 아시아 신문, 저널리즘">071 아시아 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="072" title="072 유럽 신문, 저널리즘">072 유럽 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="073" title="073 아프리카 신문, 저널리즘">073 아프리카 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="074" title="074 북아메리카 신문, 저널리즘">074 북아메리카 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="075" title="075 남아메리카 신문, 저널리즘">075 남아메리카 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="076" title="076 오세아니아 신문, 저널리즘">076 오세아니아 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="077" title="077 양극지방 신문, 저널리즘">077 양극지방 신문, 저널리즘</a></dd>
                            
                                <dd><a href="#btn" id="078" title="078 특정주제의 신문">078 특정주제의 신문</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="08" title="08 일반 전집, 총서">08 일반 전집, 총서</a></dt>
                            
                                <dd><a href="#btn" id="080" title="080 일반 전집, 총서">080 일반 전집, 총서</a></dd>
                            
                                <dd><a href="#btn" id="081" title="081 개인의 일반 전집">081 개인의 일반 전집</a></dd>
                            
                                <dd><a href="#btn" id="082" title="082 2인 이상의 일반 전집, 총서">082 2인 이상의 일반 전집, 총서</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="09" title="09 향토자료">09 향토자료</a></dt>
                            
                                <dd><a href="#btn" id="090" title="090 향토자료">090 향토자료</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                
            </table>
           
            <table id="kdcDepth2List_1" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                        <td>
                           <dl>
                            <dt><a href="#btn" id="10" title="10 철학">10 철학</a></dt>
                            
                                <dd><a href="#btn" id="100" title="100 철학">100 철학</a></dd>
                            
                                <dd><a href="#btn" id="101" title="101 이론 및 철학의 효용">101 이론 및 철학의 효용</a></dd>
                            
                                <dd><a href="#btn" id="102" title="102 잡저">102 잡저</a></dd>
                            
                                <dd><a href="#btn" id="103" title="103 사전, 사전, 용어사전">103 사전, 사전, 용어사전</a></dd>
                            
                                <dd><a href="#btn" id="104" title="104 강연집, 수필집">104 강연집, 수필집</a></dd>
                            
                                <dd><a href="#btn" id="105" title="105 연속간행물">105 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="106" title="106 학회, 단체, 협회, 기관, 회의">106 학회, 단체, 협회, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="107" title="107 지도법, 연구법 및 교육, 교육자료">107 지도법, 연구법 및 교육, 교육자료</a></dd>
                            
                                <dd><a href="#btn" id="108" title="108 총서, 전집, 선집">108 총서, 전집, 선집</a></dd>
                            
                                <dd><a href="#btn" id="109" title="109 철학사">109 철학사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="11" title="11 형이상학">11 형이상학</a></dt>
                            
                                <dd><a href="#btn" id="110" title="110 형이상학">110 형이상학</a></dd>
                            
                                <dd><a href="#btn" id="111" title="111 방법론">111 방법론</a></dd>
                            
                                <dd><a href="#btn" id="112" title="112 존재론">112 존재론</a></dd>
                            
                                <dd><a href="#btn" id="113" title="113 우주론 및 자연철학">113 우주론 및 자연철학</a></dd>
                            
                                <dd><a href="#btn" id="114" title="114 공간">114 공간</a></dd>
                            
                                <dd><a href="#btn" id="115" title="115 시간">115 시간</a></dd>
                            
                                <dd><a href="#btn" id="116" title="116 운동과 변화">116 운동과 변화</a></dd>
                            
                                <dd><a href="#btn" id="117" title="117 구조">117 구조</a></dd>
                            
                                <dd><a href="#btn" id="118" title="118 힘과 에너지">118 힘과 에너지</a></dd>
                            
                                <dd><a href="#btn" id="119" title="119 물량과 질량">119 물량과 질량</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="12" title="12 인식론, 인과론, 인간학">12 인식론, 인과론, 인간학</a></dt>
                            
                                <dd><a href="#btn" id="120" title="120 인식론, 인과론, 인간학">120 인식론, 인과론, 인간학</a></dd>
                            
                                <dd><a href="#btn" id="121" title="121 인실론">121 인실론</a></dd>
                            
                                <dd><a href="#btn" id="122" title="122 인과론">122 인과론</a></dd>
                            
                                <dd><a href="#btn" id="123" title="123 자유 및 필연">123 자유 및 필연</a></dd>
                            
                                <dd><a href="#btn" id="124" title="124 목적론">124 목적론</a></dd>
                            
                                <dd><a href="#btn" id="125" title="125 가치론">125 가치론</a></dd>
                            
                                <dd><a href="#btn" id="126" title="126 철학적 인간학">126 철학적 인간학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="13" title="13 철학의 체계">13 철학의 체계</a></dt>
                            
                                <dd><a href="#btn" id="130" title="130 철학의 체계">130 철학의 체계</a></dd>
                            
                                <dd><a href="#btn" id="131" title="131 관념론 및 관련철학">131 관념론 및 관련철학</a></dd>
                            
                                <dd><a href="#btn" id="132" title="132 비판철학">132 비판철학</a></dd>
                            
                                <dd><a href="#btn" id="133" title="133 합리론">133 합리론</a></dd>
                            
                                <dd><a href="#btn" id="134" title="134 인문주의">134 인문주의</a></dd>
                            
                                <dd><a href="#btn" id="135" title="135 경험론">135 경험론</a></dd>
                            
                                <dd><a href="#btn" id="136" title="136 자연주의">136 자연주의</a></dd>
                            
                                <dd><a href="#btn" id="137" title="137 유물론">137 유물론</a></dd>
                            
                                <dd><a href="#btn" id="138" title="138 과학주의철학">138 과학주의철학</a></dd>
                            
                                <dd><a href="#btn" id="139" title="139 기타">139 기타</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="14" title="14 경학">14 경학</a></dt>
                            
                                <dd><a href="#btn" id="140" title="140 경학">140 경학</a></dd>
                            
                                <dd><a href="#btn" id="141" title="141 역류">141 역류</a></dd>
                            
                                <dd><a href="#btn" id="142" title="142 서류">142 서류</a></dd>
                            
                                <dd><a href="#btn" id="143" title="143 시류">143 시류</a></dd>
                            
                                <dd><a href="#btn" id="144" title="144 예류">144 예류</a></dd>
                            
                                <dd><a href="#btn" id="145" title="145 악류">145 악류</a></dd>
                            
                                <dd><a href="#btn" id="146" title="146 춘추류">146 춘추류</a></dd>
                            
                                <dd><a href="#btn" id="147" title="147 효경">147 효경</a></dd>
                            
                                <dd><a href="#btn" id="148" title="148 사서">148 사서</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="15" title="15 동양철학 , 사상">15 동양철학 , 사상</a></dt>
                            
                                <dd><a href="#btn" id="150" title="150 동양철학, 사상">150 동양철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="151" title="151 한국철학, 사상">151 한국철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="152" title="152 중국철학, 사상">152 중국철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="153" title="153 일본철학, 사상">153 일본철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="154" title="154 동남아시아 제국철학, 사상">154 동남아시아 제국철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="155" title="155 인도철학, 사상">155 인도철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="156" title="156 중앙아시아 제국철학, 사상">156 중앙아시아 제국철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="157" title="157 시베리아 철학, 사상">157 시베리아 철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="158" title="158 서남아시아 제국철학, 사상">158 서남아시아 제국철학, 사상</a></dd>
                            
                                <dd><a href="#btn" id="159" title="159 아랍제국 철학, 사상">159 아랍제국 철학, 사상</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="16" title="16 서양철학">16 서양철학</a></dt>
                            
                                <dd><a href="#btn" id="160" title="160 서양철학">160 서양철학</a></dd>
                            
                                <dd><a href="#btn" id="162" title="162 미국철학">162 미국철학</a></dd>
                            
                                <dd><a href="#btn" id="163" title="163 북구철학">163 북구철학</a></dd>
                            
                                <dd><a href="#btn" id="164" title="164 영국철학">164 영국철학</a></dd>
                            
                                <dd><a href="#btn" id="165" title="165 독일, 오스트리아철학">165 독일, 오스트리아철학</a></dd>
                            
                                <dd><a href="#btn" id="166" title="166 프랑스, 네덜란드철학">166 프랑스, 네덜란드철학</a></dd>
                            
                                <dd><a href="#btn" id="167" title="167 스페인철학">167 스페인철학</a></dd>
                            
                                <dd><a href="#btn" id="168" title="168 이탈리아 철학">168 이탈리아 철학</a></dd>
                            
                                <dd><a href="#btn" id="169" title="169 러시아 철학">169 러시아 철학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="17" title="17 논리학">17 논리학</a></dt>
                            
                                <dd><a href="#btn" id="170" title="170 논리학">170 논리학</a></dd>
                            
                                <dd><a href="#btn" id="171" title="171 연역법">171 연역법</a></dd>
                            
                                <dd><a href="#btn" id="172" title="172 귀납법">172 귀납법</a></dd>
                            
                                <dd><a href="#btn" id="173" title="173 변증법적 논리학">173 변증법적 논리학</a></dd>
                            
                                <dd><a href="#btn" id="174" title="174 기호, 수리논리학">174 기호, 수리논리학</a></dd>
                            
                                <dd><a href="#btn" id="175" title="175 오류">175 오류</a></dd>
                            
                                <dd><a href="#btn" id="176" title="176 삼단논법">176 삼단논법</a></dd>
                            
                                <dd><a href="#btn" id="177" title="177 가설, 가정">177 가설, 가정</a></dd>
                            
                                <dd><a href="#btn" id="178" title="178 유추">178 유추</a></dd>
                            
                                <dd><a href="#btn" id="179" title="179 논증, 설득">179 논증, 설득</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="18" title="18 심리학">18 심리학</a></dt>
                            
                                <dd><a href="#btn" id="180" title="180 심리학">180 심리학</a></dd>
                            
                                <dd><a href="#btn" id="181" title="181 각론">181 각론</a></dd>
                            
                                <dd><a href="#btn" id="182" title="182 차이심리학">182 차이심리학</a></dd>
                            
                                <dd><a href="#btn" id="183" title="183 발달심리학">183 발달심리학</a></dd>
                            
                                <dd><a href="#btn" id="184" title="184 이상심리학">184 이상심리학</a></dd>
                            
                                <dd><a href="#btn" id="185" title="185 생리심리학">185 생리심리학</a></dd>
                            
                                <dd><a href="#btn" id="186" title="186 임상심리학">186 임상심리학</a></dd>
                            
                                <dd><a href="#btn" id="187" title="187 심령연구 및 비학, 초심리학">187 심령연구 및 비학, 초심리학</a></dd>
                            
                                <dd><a href="#btn" id="188" title="188 상법, 운명판단">188 상법, 운명판단</a></dd>
                            
                                <dd><a href="#btn" id="189" title="189 응용심리학 일반">189 응용심리학 일반</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="19" title="19 윤리학, 도덕철학">19 윤리학, 도덕철학</a></dt>
                            
                                <dd><a href="#btn" id="190" title="190 윤리학, 도덕철학">190 윤리학, 도덕철학</a></dd>
                            
                                <dd><a href="#btn" id="191" title="191 일반윤리학 각론">191 일반윤리학 각론</a></dd>
                            
                                <dd><a href="#btn" id="192" title="192 가정윤리">192 가정윤리</a></dd>
                            
                                <dd><a href="#btn" id="193" title="193 국가 및 정치윤리">193 국가 및 정치윤리</a></dd>
                            
                                <dd><a href="#btn" id="194" title="194 사회윤리">194 사회윤리</a></dd>
                            
                                <dd><a href="#btn" id="195" title="195 직업윤리 일반">195 직업윤리 일반</a></dd>
                            
                                <dd><a href="#btn" id="196" title="196 오락 및 경기윤리">196 오락 및 경기윤리</a></dd>
                            
                                <dd><a href="#btn" id="197" title="197 성윤리">197 성윤리</a></dd>
                            
                                <dd><a href="#btn" id="198" title="198 소비윤리">198 소비윤리</a></dd>
                            
                                <dd><a href="#btn" id="199" title="199 도덕훈, 교훈">199 도덕훈, 교훈</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_2" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                        <td>
                           <dl>
                            <dt><a href="#btn" id="20" title="20 종교">20 종교</a></dt>
                            
                                <dd><a href="#btn" id="200" title="200 종교">200 종교</a></dd>
                            
                                <dd><a href="#btn" id="201" title="201 종교철학 및 종교사상">201 종교철학 및 종교사상</a></dd>
                            
                                <dd><a href="#btn" id="202" title="202 잡저">202 잡저</a></dd>
                            
                                <dd><a href="#btn" id="203" title="203 사전, 사전">203 사전, 사전</a></dd>
                            
                                <dd><a href="#btn" id="204" title="204 자연종교, 자연신학">204 자연종교, 자연신학</a></dd>
                            
                                <dd><a href="#btn" id="205" title="205 연속간행물">205 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="206" title="206 학회, 단체, 협회, 기관, 회의">206 학회, 단체, 협회, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="207" title="207 지도법, 연구법 및 교육, 교육자료">207 지도법, 연구법 및 교육, 교육자료</a></dd>
                            
                                <dd><a href="#btn" id="208" title="208 총서, 전집, 선집">208 총서, 전집, 선집</a></dd>
                            
                                <dd><a href="#btn" id="209" title="209 종교사">209 종교사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="21" title="21 비교종교학">21 비교종교학</a></dt>
                            
                                <dd><a href="#btn" id="210" title="210 비교종교학">210 비교종교학</a></dd>
                            
                                <dd><a href="#btn" id="211" title="211 교리">211 교리</a></dd>
                            
                                <dd><a href="#btn" id="212" title="212 종조, 창교자">212 종조, 창교자</a></dd>
                            
                                <dd><a href="#btn" id="213" title="213 경전, 성전">213 경전, 성전</a></dd>
                            
                                <dd><a href="#btn" id="214" title="214 종교신앙, 신앙록, 신앙(수도)생활">214 종교신앙, 신앙록, 신앙(수도)생활</a></dd>
                            
                                <dd><a href="#btn" id="215" title="215 선교, 포교, 전도, 교육활동">215 선교, 포교, 전도, 교육활동</a></dd>
                            
                                <dd><a href="#btn" id="216" title="216 종단, 교단(교당론)">216 종단, 교단(교당론)</a></dd>
                            
                                <dd><a href="#btn" id="217" title="217 예배형식, 의식, 의례">217 예배형식, 의식, 의례</a></dd>
                            
                                <dd><a href="#btn" id="218" title="218 종파, 교파">218 종파, 교파</a></dd>
                            
                                <dd><a href="#btn" id="219" title="219 신화, 신화학">219 신화, 신화학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="22" title="22 불교">22 불교</a></dt>
                            
                                <dd><a href="#btn" id="220" title="220 불교">220 불교</a></dd>
                            
                                <dd><a href="#btn" id="221" title="221 불교교리">221 불교교리</a></dd>
                            
                                <dd><a href="#btn" id="222" title="222 제불, 보살, 불제자">222 제불, 보살, 불제자</a></dd>
                            
                                <dd><a href="#btn" id="223" title="223 경전(불전, 불경, 대장경)">223 경전(불전, 불경, 대장경)</a></dd>
                            
                                <dd><a href="#btn" id="224" title="224 종교신앙, 신앙록, 신앙생활">224 종교신앙, 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="225" title="225 포교, 교육, 교화활동">225 포교, 교육, 교화활동</a></dd>
                            
                                <dd><a href="#btn" id="226" title="226 사원론">226 사원론</a></dd>
                            
                                <dd><a href="#btn" id="227" title="227 법회, 의식, 행사(의궤)">227 법회, 의식, 행사(의궤)</a></dd>
                            
                                <dd><a href="#btn" id="228" title="228 종파">228 종파</a></dd>
                            
                                <dd><a href="#btn" id="229" title="229 라마교">229 라마교</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="23" title="23 기독교">23 기독교</a></dt>
                            
                                <dd><a href="#btn" id="230" title="230 기독교">230 기독교</a></dd>
                            
                                <dd><a href="#btn" id="231" title="231 기독교신학, 교의학(조직신학)">231 기독교신학, 교의학(조직신학)</a></dd>
                            
                                <dd><a href="#btn" id="232" title="232 예수그리스도, 사도">232 예수그리스도, 사도</a></dd>
                            
                                <dd><a href="#btn" id="233" title="233 성서">233 성서</a></dd>
                            
                                <dd><a href="#btn" id="234" title="234 종교신앙, 신앙록, 신앙생활">234 종교신앙, 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="235" title="235 전도, 교육, 교화활동, 목회학">235 전도, 교육, 교화활동, 목회학</a></dd>
                            
                                <dd><a href="#btn" id="236" title="236 교회론">236 교회론</a></dd>
                            
                                <dd><a href="#btn" id="237" title="237 예배, 의식, 성례">237 예배, 의식, 성례</a></dd>
                            
                                <dd><a href="#btn" id="238" title="238 교파">238 교파</a></dd>
                            
                                <dd><a href="#btn" id="239" title="239 유태교">239 유태교</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="24" title="24 도교">24 도교</a></dt>
                            
                                <dd><a href="#btn" id="240" title="240 도교">240 도교</a></dd>
                            
                                <dd><a href="#btn" id="241" title="241 교의, 신선사상">241 교의, 신선사상</a></dd>
                            
                                <dd><a href="#btn" id="242" title="242 교조, 개조(장도릉)">242 교조, 개조(장도릉)</a></dd>
                            
                                <dd><a href="#btn" id="243" title="243 도장">243 도장</a></dd>
                            
                                <dd><a href="#btn" id="244" title="244 신앙록, 신앙생활">244 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="245" title="245 포교, 전도, 교육, 교육활동">245 포교, 전도, 교육, 교육활동</a></dd>
                            
                                <dd><a href="#btn" id="246" title="246 사원론(도관)">246 사원론(도관)</a></dd>
                            
                                <dd><a href="#btn" id="247" title="247 행사, 법술">247 행사, 법술</a></dd>
                            
                                <dd><a href="#btn" id="248" title="248 교파">248 교파</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="25" title="25 천도교">25 천도교</a></dt>
                            
                                <dd><a href="#btn" id="250" title="250 천도교">250 천도교</a></dd>
                            
                                <dd><a href="#btn" id="251" title="251 교의">251 교의</a></dd>
                            
                                <dd><a href="#btn" id="252" title="252 교조, 교주">252 교조, 교주</a></dd>
                            
                                <dd><a href="#btn" id="253" title="253 교전">253 교전</a></dd>
                            
                                <dd><a href="#btn" id="254" title="254 신앙록, 신앙생활">254 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="255" title="255 포교, 전도, 교육, 교육활동">255 포교, 전도, 교육, 교육활동</a></dd>
                            
                                <dd><a href="#btn" id="256" title="256 교단">256 교단</a></dd>
                            
                                <dd><a href="#btn" id="257" title="257 의식, 행사">257 의식, 행사</a></dd>
                            
                                <dd><a href="#btn" id="258" title="258 동학교분파">258 동학교분파</a></dd>
                            
                                <dd><a href="#btn" id="259" title="259 단군교, 대종교">259 단군교, 대종교</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="27" title="27 힌두교, 브라만교">27 힌두교, 브라만교</a></dt>
                            
                                <dd><a href="#btn" id="270" title="270 힌두교, 브라만교">270 힌두교, 브라만교</a></dd>
                            
                                <dd><a href="#btn" id="271" title="271 교리, 범사상">271 교리, 범사상</a></dd>
                            
                                <dd><a href="#btn" id="272" title="272 교조">272 교조</a></dd>
                            
                                <dd><a href="#btn" id="273" title="273 베다, 우파니샤드">273 베다, 우파니샤드</a></dd>
                            
                                <dd><a href="#btn" id="274" title="274 신앙록, 신앙생활">274 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="275" title="275 포교, 전도, 교육, 교화활동">275 포교, 전도, 교육, 교화활동</a></dd>
                            
                                <dd><a href="#btn" id="277" title="277 의식, 행사">277 의식, 행사</a></dd>
                            
                                <dd><a href="#btn" id="278" title="278 교파">278 교파</a></dd>
                            
                                <dd><a href="#btn" id="279" title="279 자이나교">279 자이나교</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="28" title="28 이슬람교(회교)">28 이슬람교(회교)</a></dt>
                            
                                <dd><a href="#btn" id="280" title="280 이슬람교(회교)">280 이슬람교(회교)</a></dd>
                            
                                <dd><a href="#btn" id="281" title="281 교의">281 교의</a></dd>
                            
                                <dd><a href="#btn" id="282" title="282 교조">282 교조</a></dd>
                            
                                <dd><a href="#btn" id="283" title="283 교전">283 교전</a></dd>
                            
                                <dd><a href="#btn" id="284" title="284 신앙록, 신앙생활">284 신앙록, 신앙생활</a></dd>
                            
                                <dd><a href="#btn" id="285" title="285 전도, 교육, 교화활동">285 전도, 교육, 교화활동</a></dd>
                            
                                <dd><a href="#btn" id="286" title="286 사원">286 사원</a></dd>
                            
                                <dd><a href="#btn" id="287" title="287 근행, 계율">287 근행, 계율</a></dd>
                            
                                <dd><a href="#btn" id="288" title="288 교파">288 교파</a></dd>
                            
                                <dd><a href="#btn" id="289" title="289 조로아스터교 (요교, 배화교)">289 조로아스터교 (요교, 배화교)</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="29" title="29 기타 제종교">29 기타 제종교</a></dt>
                            
                                <dd><a href="#btn" id="290" title="290 기타 제종교">290 기타 제종교</a></dd>
                            
                                <dd><a href="#btn" id="291" title="291 아시아">291 아시아</a></dd>
                            
                                <dd><a href="#btn" id="292" title="292 유럽">292 유럽</a></dd>
                            
                                <dd><a href="#btn" id="293" title="293 아프리카">293 아프리카</a></dd>
                            
                                <dd><a href="#btn" id="294" title="294 북아메리카">294 북아메리카</a></dd>
                            
                                <dd><a href="#btn" id="295" title="295 남아메리카">295 남아메리카</a></dd>
                            
                                <dd><a href="#btn" id="296" title="296 오세아니아">296 오세아니아</a></dd>
                            
                                <dd><a href="#btn" id="297" title="297 양극지방">297 양극지방</a></dd>
                            
                                <dd><a href="#btn" id="299" title="299 기타 다른 기원의 종교">299 기타 다른 기원의 종교</a></dd>
                            
                        </dl>
                    </td>
                 </tr>
            </table>
        
            <table id="kdcDepth2List_3" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                        <td>
                          <dl>
                            <dt><a href="#btn" id="30" title="30 사회과학">30 사회과학</a></dt>
                            
                                <dd><a href="#btn" id="300" title="300 사회과학">300 사회과학</a></dd>
                            
                                <dd><a href="#btn" id="301" title="301 사회사상">301 사회사상</a></dd>
                            
                                <dd><a href="#btn" id="302" title="302 잡저">302 잡저</a></dd>
                            
                                <dd><a href="#btn" id="303" title="303 사전, 사전">303 사전, 사전</a></dd>
                            
                                <dd><a href="#btn" id="304" title="304 강연집, 수필집, 연설문집">304 강연집, 수필집, 연설문집</a></dd>
                            
                                <dd><a href="#btn" id="305" title="305 연속간행물">305 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="306" title="306 학회, 단체, 협회, 기관, 회의">306 학회, 단체, 협회, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="307" title="307 연구법, 연구방법 및 교육, 교육자료">307 연구법, 연구방법 및 교육, 교육자료</a></dd>
                            
                                <dd><a href="#btn" id="308" title="308 총서, 전집, 선집">308 총서, 전집, 선집</a></dd>
                            
                                <dd><a href="#btn" id="309" title="309 정치, 경제, 사회, 문화사정 및 역사">309 정치, 경제, 사회, 문화사정 및 역사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="31" title="31 통계학">31 통계학</a></dt>
                            
                                <dd><a href="#btn" id="310" title="310 통계학">310 통계학</a></dd>
                            
                                <dd><a href="#btn" id="311" title="311 아시아">311 아시아</a></dd>
                            
                                <dd><a href="#btn" id="312" title="312 유럽">312 유럽</a></dd>
                            
                                <dd><a href="#btn" id="313" title="313 아프리카">313 아프리카</a></dd>
                            
                                <dd><a href="#btn" id="314" title="314 북아메리카">314 북아메리카</a></dd>
                            
                                <dd><a href="#btn" id="315" title="315 남아메리카">315 남아메리카</a></dd>
                            
                                <dd><a href="#btn" id="316" title="316 오세아니아">316 오세아니아</a></dd>
                            
                                <dd><a href="#btn" id="317" title="317 양극지방">317 양극지방</a></dd>
                            
                                <dd><a href="#btn" id="319" title="319 인구통계">319 인구통계</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="32" title="32 경제학">32 경제학</a></dt>
                            
                                <dd><a href="#btn" id="320" title="320 경제학">320 경제학</a></dd>
                            
                                <dd><a href="#btn" id="321" title="321 경제각론">321 경제각론</a></dd>
                            
                                <dd><a href="#btn" id="322" title="322 경제정책">322 경제정책</a></dd>
                            
                                <dd><a href="#btn" id="323" title="323 산업경제 일반">323 산업경제 일반</a></dd>
                            
                                <dd><a href="#btn" id="324" title="324 기업경제">324 기업경제</a></dd>
                            
                                <dd><a href="#btn" id="325" title="325 경영">325 경영</a></dd>
                            
                                <dd><a href="#btn" id="326" title="326 상업, 교통, 통신">326 상업, 교통, 통신</a></dd>
                            
                                <dd><a href="#btn" id="327" title="327 금융">327 금융</a></dd>
                            
                                <dd><a href="#btn" id="328" title="328 보험">328 보험</a></dd>
                            
                                <dd><a href="#btn" id="329" title="329 재정">329 재정</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="33" title="33 사회학, 사회문제">33 사회학, 사회문제</a></dt>
                            
                                <dd><a href="#btn" id="330" title="330 사회학, 사회문제">330 사회학, 사회문제</a></dd>
                            
                                <dd><a href="#btn" id="331" title="331 사회학">331 사회학</a></dd>
                            
                                <dd><a href="#btn" id="332" title="332 사회조직 및 제도">332 사회조직 및 제도</a></dd>
                            
                                <dd><a href="#btn" id="334" title="334 사회문제">334 사회문제</a></dd>
                            
                                <dd><a href="#btn" id="335" title="335 생활문제">335 생활문제</a></dd>
                            
                                <dd><a href="#btn" id="337" title="337 여성문제">337 여성문제</a></dd>
                            
                                <dd><a href="#btn" id="338" title="338 사회복지">338 사회복지</a></dd>
                            
                                <dd><a href="#btn" id="339" title="339 사회단체">339 사회단체</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="34" title="34 정치학">34 정치학</a></dt>
                            
                                <dd><a href="#btn" id="340" title="340 정치학">340 정치학</a></dd>
                            
                                <dd><a href="#btn" id="341" title="341 국가형태">341 국가형태</a></dd>
                            
                                <dd><a href="#btn" id="342" title="342 국가와 개인 및 집단">342 국가와 개인 및 집단</a></dd>
                            
                                <dd><a href="#btn" id="344" title="344 선거">344 선거</a></dd>
                            
                                <dd><a href="#btn" id="345" title="345 입법">345 입법</a></dd>
                            
                                <dd><a href="#btn" id="346" title="346 정당">346 정당</a></dd>
                            
                                <dd><a href="#btn" id="349" title="349 외교, 국제관계">349 외교, 국제관계</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="35" title="35 행정학">35 행정학</a></dt>
                            
                                <dd><a href="#btn" id="350" title="350 행정학">350 행정학</a></dd>
                            
                                <dd><a href="#btn" id="351" title="351 아시아 중앙행정 및 행정부">351 아시아 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="352" title="352 유럽 중앙행정 및 행정부">352 유럽 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="353" title="353 아프리카 중앙행정 및 행정부">353 아프리카 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="354" title="354 북아메리카 중앙행정 및 행정부">354 북아메리카 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="355" title="355 남아메리카 중앙행정 및 행정부">355 남아메리카 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="356" title="356 오세아니아 중앙행정 및 행정부">356 오세아니아 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="357" title="357 양극지방 중앙행정 및 행정부">357 양극지방 중앙행정 및 행정부</a></dd>
                            
                                <dd><a href="#btn" id="359" title="359 지방자치 및 행정">359 지방자치 및 행정</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="36" title="36 법학">36 법학</a></dt>
                            
                                <dd><a href="#btn" id="360" title="360 법학">360 법학</a></dd>
                            
                                <dd><a href="#btn" id="361" title="361 국제법">361 국제법</a></dd>
                            
                                <dd><a href="#btn" id="362" title="362 헌법">362 헌법</a></dd>
                            
                                <dd><a href="#btn" id="363" title="363 행정법">363 행정법</a></dd>
                            
                                <dd><a href="#btn" id="364" title="364 형법">364 형법</a></dd>
                            
                                <dd><a href="#btn" id="365" title="365 민법">365 민법</a></dd>
                            
                                <dd><a href="#btn" id="366" title="366 상법">366 상법</a></dd>
                            
                                <dd><a href="#btn" id="367" title="367 사법제도 및 소송법">367 사법제도 및 소송법</a></dd>
                            
                                <dd><a href="#btn" id="368" title="368 기타 제법">368 기타 제법</a></dd>
                            
                                <dd><a href="#btn" id="369" title="369 각국 법 및 예규">369 각국 법 및 예규</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="37" title="37 교육학">37 교육학</a></dt>
                            
                                <dd><a href="#btn" id="370" title="370 교육학">370 교육학</a></dd>
                            
                                <dd><a href="#btn" id="371" title="371 교육정책 및 행정">371 교육정책 및 행정</a></dd>
                            
                                <dd><a href="#btn" id="372" title="372 학교행정 및 경영, 보건 및 교육지도">372 학교행정 및 경영, 보건 및 교육지도</a></dd>
                            
                                <dd><a href="#btn" id="373" title="373 학습지도, 교육방법">373 학습지도, 교육방법</a></dd>
                            
                                <dd><a href="#btn" id="374" title="374 교육과정">374 교육과정</a></dd>
                            
                                <dd><a href="#btn" id="375" title="375 유아 및 초등교육">375 유아 및 초등교육</a></dd>
                            
                                <dd><a href="#btn" id="376" title="376 중등교육">376 중등교육</a></dd>
                            
                                <dd><a href="#btn" id="377" title="377 대학, 전문, 고등교육">377 대학, 전문, 고등교육</a></dd>
                            
                                <dd><a href="#btn" id="378" title="378 사회교육">378 사회교육</a></dd>
                            
                                <dd><a href="#btn" id="379" title="379 특수교육">379 특수교육</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="38" title="38 풍속, 예절, 민속학">38 풍속, 예절, 민속학</a></dt>
                            
                                <dd><a href="#btn" id="380" title="380 풍속, 예절, 민속학">380 풍속, 예절, 민속학</a></dd>
                            
                                <dd><a href="#btn" id="381" title="381 의식주의 풍습">381 의식주의 풍습</a></dd>
                            
                                <dd><a href="#btn" id="382" title="382 가정생활의 풍습">382 가정생활의 풍습</a></dd>
                            
                                <dd><a href="#btn" id="383" title="383 사회생활의 풍습">383 사회생활의 풍습</a></dd>
                            
                                <dd><a href="#btn" id="384" title="384 관혼상제">384 관혼상제</a></dd>
                            
                                <dd><a href="#btn" id="385" title="385 예절">385 예절</a></dd>
                            
                                <dd><a href="#btn" id="386" title="386 축제, 세시풍속">386 축제, 세시풍속</a></dd>
                            
                                <dd><a href="#btn" id="387" title="387 전쟁풍습">387 전쟁풍습</a></dd>
                            
                                <dd><a href="#btn" id="388" title="388 민속학">388 민속학</a></dd>
                            
                                <dd><a href="#btn" id="389" title="389 문화인류학">389 문화인류학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="39" title="39 국방, 군사학">39 국방, 군사학</a></dt>
                            
                                <dd><a href="#btn" id="390" title="390 국방, 군사학">390 국방, 군사학</a></dd>
                            
                                <dd><a href="#btn" id="391" title="391 군사행정">391 군사행정</a></dd>
                            
                                <dd><a href="#btn" id="392" title="392 전략, 전술">392 전략, 전술</a></dd>
                            
                                <dd><a href="#btn" id="393" title="393 군사교육 및 훈련">393 군사교육 및 훈련</a></dd>
                            
                                <dd><a href="#btn" id="394" title="394 군사시설 및 장비">394 군사시설 및 장비</a></dd>
                            
                                <dd><a href="#btn" id="395" title="395 군특수기술근무">395 군특수기술근무</a></dd>
                            
                                <dd><a href="#btn" id="396" title="396 육군">396 육군</a></dd>
                            
                                <dd><a href="#btn" id="397" title="397 해군">397 해군</a></dd>
                            
                                <dd><a href="#btn" id="398" title="398 공군">398 공군</a></dd>
                            
                                <dd><a href="#btn" id="399" title="399 고대병법">399 고대병법</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_4" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                      <td>
                        <dl>
                            <dt><a href="#btn" id="40" title="40 자연과학">40 자연과학</a></dt>
                            
                                <dd><a href="#btn" id="400" title="400 자연과학">400 자연과학</a></dd>
                            
                                <dd><a href="#btn" id="401" title="401 과학철학, 과학이론">401 과학철학, 과학이론</a></dd>
                            
                                <dd><a href="#btn" id="402" title="402 잡저">402 잡저</a></dd>
                            
                                <dd><a href="#btn" id="403" title="403 사전, 사전">403 사전, 사전</a></dd>
                            
                                <dd><a href="#btn" id="404" title="404 강연집, 수필집, 연설문집">404 강연집, 수필집, 연설문집</a></dd>
                            
                                <dd><a href="#btn" id="405" title="405 연속간행물">405 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="406" title="406 학회, 단체, 기관, 회의">406 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="407" title="407 지도법, 연구법 및 교육, 교육자료">407 지도법, 연구법 및 교육, 교육자료</a></dd>
                            
                                <dd><a href="#btn" id="408" title="408 전집, 총서">408 전집, 총서</a></dd>
                            
                                <dd><a href="#btn" id="409" title="409 과학사 및 지역구분">409 과학사 및 지역구분</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="41" title="41 수학">41 수학</a></dt>
                            
                                <dd><a href="#btn" id="410" title="410 수학">410 수학</a></dd>
                            
                                <dd><a href="#btn" id="411" title="411 산수">411 산수</a></dd>
                            
                                <dd><a href="#btn" id="412" title="412 대수학">412 대수학</a></dd>
                            
                                <dd><a href="#btn" id="413" title="413 확률론, 통계수학">413 확률론, 통계수학</a></dd>
                            
                                <dd><a href="#btn" id="414" title="414 해석학">414 해석학</a></dd>
                            
                                <dd><a href="#btn" id="415" title="415 기하학">415 기하학</a></dd>
                            
                                <dd><a href="#btn" id="416" title="416 위상수학">416 위상수학</a></dd>
                            
                                <dd><a href="#btn" id="417" title="417 삼각법">417 삼각법</a></dd>
                            
                                <dd><a href="#btn" id="418" title="418 해석기하학">418 해석기하학</a></dd>
                            
                                <dd><a href="#btn" id="419" title="419 기타 산법">419 기타 산법</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="42" title="42 물리학">42 물리학</a></dt>
                            
                                <dd><a href="#btn" id="420" title="420 물리학">420 물리학</a></dd>
                            
                                <dd><a href="#btn" id="421" title="421 고체역학">421 고체역학</a></dd>
                            
                                <dd><a href="#btn" id="422" title="422 유체역학">422 유체역학</a></dd>
                            
                                <dd><a href="#btn" id="423" title="423 기체역학">423 기체역학</a></dd>
                            
                                <dd><a href="#btn" id="424" title="424 음향학, 진동학">424 음향학, 진동학</a></dd>
                            
                                <dd><a href="#btn" id="425" title="425 광학">425 광학</a></dd>
                            
                                <dd><a href="#btn" id="426" title="426 열학">426 열학</a></dd>
                            
                                <dd><a href="#btn" id="427" title="427 전기학 전자학">427 전기학 전자학</a></dd>
                            
                                <dd><a href="#btn" id="428" title="428 자기">428 자기</a></dd>
                            
                                <dd><a href="#btn" id="429" title="429 현대물리학">429 현대물리학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="43" title="43 화학">43 화학</a></dt>
                            
                                <dd><a href="#btn" id="430" title="430 화학">430 화학</a></dd>
                            
                                <dd><a href="#btn" id="431" title="431 이론화학과 물리화학">431 이론화학과 물리화학</a></dd>
                            
                                <dd><a href="#btn" id="432" title="432 화학실험실, 기기, 시설">432 화학실험실, 기기, 시설</a></dd>
                            
                                <dd><a href="#btn" id="433" title="433 분석화학">433 분석화학</a></dd>
                            
                                <dd><a href="#btn" id="434" title="434 합성화학일반">434 합성화학일반</a></dd>
                            
                                <dd><a href="#btn" id="435" title="435 무기화학">435 무기화학</a></dd>
                            
                                <dd><a href="#btn" id="436" title="436 금속원소와 그 화합물">436 금속원소와 그 화합물</a></dd>
                            
                                <dd><a href="#btn" id="437" title="437 유기화학">437 유기화학</a></dd>
                            
                                <dd><a href="#btn" id="438" title="438 환상화합물">438 환상화합물</a></dd>
                            
                                <dd><a href="#btn" id="439" title="439 고분자화합물과 기타 유기물">439 고분자화합물과 기타 유기물</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="44" title="44 천문학">44 천문학</a></dt>
                            
                                <dd><a href="#btn" id="440" title="440 천문학">440 천문학</a></dd>
                            
                                <dd><a href="#btn" id="441" title="441 이론천문학">441 이론천문학</a></dd>
                            
                                <dd><a href="#btn" id="442" title="442 실지 천문학">442 실지 천문학</a></dd>
                            
                                <dd><a href="#btn" id="443" title="443 기술천문학">443 기술천문학</a></dd>
                            
                                <dd><a href="#btn" id="445" title="445 지구">445 지구</a></dd>
                            
                                <dd><a href="#btn" id="446" title="446 측지학">446 측지학</a></dd>
                            
                                <dd><a href="#btn" id="447" title="447 항해천문학">447 항해천문학</a></dd>
                            
                                <dd><a href="#btn" id="448" title="448 역법, 측시법">448 역법, 측시법</a></dd>
                            
                                <dd><a href="#btn" id="449" title="449 각국력">449 각국력</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="45" title="45 지학">45 지학</a></dt>
                            
                                <dd><a href="#btn" id="450" title="450 지학">450 지학</a></dd>
                            
                                <dd><a href="#btn" id="451" title="451 지구물리학">451 지구물리학</a></dd>
                            
                                <dd><a href="#btn" id="452" title="452 지형학">452 지형학</a></dd>
                            
                                <dd><a href="#btn" id="453" title="453 기상학, 기후학">453 기상학, 기후학</a></dd>
                            
                                <dd><a href="#btn" id="454" title="454 해양학">454 해양학</a></dd>
                            
                                <dd><a href="#btn" id="455" title="455 구조지질학">455 구조지질학</a></dd>
                            
                                <dd><a href="#btn" id="456" title="456 지사학">456 지사학</a></dd>
                            
                                <dd><a href="#btn" id="457" title="457 고생물학(화석학)">457 고생물학(화석학)</a></dd>
                            
                                <dd><a href="#btn" id="458" title="458 응용지질학 일반 및 광상학">458 응용지질학 일반 및 광상학</a></dd>
                            
                                <dd><a href="#btn" id="459" title="459 암석학">459 암석학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="46" title="46 광물학">46 광물학</a></dt>
                            
                                <dd><a href="#btn" id="460" title="460 광물학">460 광물학</a></dd>
                            
                                <dd><a href="#btn" id="461" title="461 원소광물">461 원소광물</a></dd>
                            
                                <dd><a href="#btn" id="462" title="462 황화광물">462 황화광물</a></dd>
                            
                                <dd><a href="#btn" id="463" title="463 할로겐화광물">463 할로겐화광물</a></dd>
                            
                                <dd><a href="#btn" id="464" title="464 산화광물">464 산화광물</a></dd>
                            
                                <dd><a href="#btn" id="465" title="465 규산 및 규산염광물">465 규산 및 규산염광물</a></dd>
                            
                                <dd><a href="#btn" id="466" title="466 기타 산화물을 포함한 광물">466 기타 산화물을 포함한 광물</a></dd>
                            
                                <dd><a href="#btn" id="467" title="467 유기광물">467 유기광물</a></dd>
                            
                                <dd><a href="#btn" id="469" title="469 결정학">469 결정학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="47" title="47 생명과학">47 생명과학</a></dt>
                            
                                <dd><a href="#btn" id="470" title="470 생명과학">470 생명과학</a></dd>
                            
                                <dd><a href="#btn" id="471" title="471 인류학(자연인류학)">471 인류학(자연인류학)</a></dd>
                            
                                <dd><a href="#btn" id="472" title="472 생물학">472 생물학</a></dd>
                            
                                <dd><a href="#btn" id="473" title="473 생명론, 생물철학">473 생명론, 생물철학</a></dd>
                            
                                <dd><a href="#btn" id="474" title="474 세포학(세포생물학)">474 세포학(세포생물학)</a></dd>
                            
                                <dd><a href="#btn" id="475" title="475 미생물학">475 미생물학</a></dd>
                            
                                <dd><a href="#btn" id="476" title="476 생물진화">476 생물진화</a></dd>
                            
                                <dd><a href="#btn" id="477" title="477 생물지리학">477 생물지리학</a></dd>
                            
                                <dd><a href="#btn" id="478" title="478 현미경 및 현미경검사법 일반">478 현미경 및 현미경검사법 일반</a></dd>
                            
                                <dd><a href="#btn" id="479" title="479 생물채집 및 보존">479 생물채집 및 보존</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="48" title="48 식물학">48 식물학</a></dt>
                            
                                <dd><a href="#btn" id="480" title="480 식물학">480 식물학</a></dd>
                            
                                <dd><a href="#btn" id="481" title="481 일반 식물학">481 일반 식물학</a></dd>
                            
                                <dd><a href="#btn" id="482" title="482 은화식물">482 은화식물</a></dd>
                            
                                <dd><a href="#btn" id="483" title="483 엽상식물">483 엽상식물</a></dd>
                            
                                <dd><a href="#btn" id="484" title="484 조균류">484 조균류</a></dd>
                            
                                <dd><a href="#btn" id="485" title="485 현화식물, 종자식물">485 현화식물, 종자식물</a></dd>
                            
                                <dd><a href="#btn" id="486" title="486 나자식물">486 나자식물</a></dd>
                            
                                <dd><a href="#btn" id="487" title="487 피자식물">487 피자식물</a></dd>
                            
                                <dd><a href="#btn" id="488" title="488 단자엽식물">488 단자엽식물</a></dd>
                            
                                <dd><a href="#btn" id="489" title="489 쌍자엽식물">489 쌍자엽식물</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="49" title="49 동물학">49 동물학</a></dt>
                            
                                <dd><a href="#btn" id="490" title="490 동물학">490 동물학</a></dd>
                            
                                <dd><a href="#btn" id="491" title="491 일반 동물학">491 일반 동물학</a></dd>
                            
                                <dd><a href="#btn" id="492" title="492 무척추동물">492 무척추동물</a></dd>
                            
                                <dd><a href="#btn" id="493" title="493 원생동물, 해면동물, 자포동물">493 원생동물, 해면동물, 자포동물</a></dd>
                            
                                <dd><a href="#btn" id="494" title="494 연체동물, 의연체동물">494 연체동물, 의연체동물</a></dd>
                            
                                <dd><a href="#btn" id="495" title="495 절지동물, 곤충류">495 절지동물, 곤충류</a></dd>
                            
                                <dd><a href="#btn" id="496" title="496 척색동물">496 척색동물</a></dd>
                            
                                <dd><a href="#btn" id="497" title="497 어류, 양서류, 파충류">497 어류, 양서류, 파충류</a></dd>
                            
                                <dd><a href="#btn" id="498" title="498 조류">498 조류</a></dd>
                            
                                <dd><a href="#btn" id="499" title="499 포유류">499 포유류</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_5" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                       <td>
                        <dl>
                            <dt><a href="#btn" id="50" title="50 기술과학">50 기술과학</a></dt>
                            
                                <dd><a href="#btn" id="500" title="500 기술과학">500 기술과학</a></dd>
                            
                                <dd><a href="#btn" id="501" title="501 기술철학">501 기술철학</a></dd>
                            
                                <dd><a href="#btn" id="502" title="502 잡저">502 잡저</a></dd>
                            
                                <dd><a href="#btn" id="503" title="503 사전, 사전, 용어사전">503 사전, 사전, 용어사전</a></dd>
                            
                                <dd><a href="#btn" id="504" title="504 강연집, 수필집, 연설문집">504 강연집, 수필집, 연설문집</a></dd>
                            
                                <dd><a href="#btn" id="505" title="505 연속간행물">505 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="506" title="506 학회, 단체, 기관, 회의">506 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="507" title="507 연구법 및 교육지도법">507 연구법 및 교육지도법</a></dd>
                            
                                <dd><a href="#btn" id="508" title="508 전집, 총서">508 전집, 총서</a></dd>
                            
                                <dd><a href="#btn" id="509" title="509 기술사">509 기술사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="51" title="51 의학">51 의학</a></dt>
                            
                                <dd><a href="#btn" id="510" title="510 의학">510 의학</a></dd>
                            
                                <dd><a href="#btn" id="511" title="511 기초의학">511 기초의학</a></dd>
                            
                                <dd><a href="#btn" id="512" title="512 임상의학 일반">512 임상의학 일반</a></dd>
                            
                                <dd><a href="#btn" id="513" title="513 내과학">513 내과학</a></dd>
                            
                                <dd><a href="#btn" id="514" title="514 외과">514 외과</a></dd>
                            
                                <dd><a href="#btn" id="515" title="515 치과의학, 이비인후과학, 안과학">515 치과의학, 이비인후과학, 안과학</a></dd>
                            
                                <dd><a href="#btn" id="516" title="516 산부인과, 소아과학">516 산부인과, 소아과학</a></dd>
                            
                                <dd><a href="#btn" id="517" title="517 건강증진, 공중보건 및 예방의학">517 건강증진, 공중보건 및 예방의학</a></dd>
                            
                                <dd><a href="#btn" id="518" title="518 약학">518 약학</a></dd>
                            
                                <dd><a href="#btn" id="519" title="519 한의학">519 한의학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="52" title="52 농업, 농학">52 농업, 농학</a></dt>
                            
                                <dd><a href="#btn" id="520" title="520 농업, 농학">520 농업, 농학</a></dd>
                            
                                <dd><a href="#btn" id="521" title="521 농업기초학">521 농업기초학</a></dd>
                            
                                <dd><a href="#btn" id="522" title="522 농업경제">522 농업경제</a></dd>
                            
                                <dd><a href="#btn" id="523" title="523 재배 및 보호">523 재배 및 보호</a></dd>
                            
                                <dd><a href="#btn" id="524" title="524 작물학">524 작물학</a></dd>
                            
                                <dd><a href="#btn" id="525" title="525 원예">525 원예</a></dd>
                            
                                <dd><a href="#btn" id="526" title="526 임학, 임업">526 임학, 임업</a></dd>
                            
                                <dd><a href="#btn" id="527" title="527 축산학">527 축산학</a></dd>
                            
                                <dd><a href="#btn" id="528" title="528 수의학">528 수의학</a></dd>
                            
                                <dd><a href="#btn" id="529" title="529 수산업, 생물자원의 보호, 수렵업">529 수산업, 생물자원의 보호, 수렵업</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="53" title="53 공학, 공업일반, 토목공학, 환경공학">53 공학, 공업일반, 토목공학, 환경공학</a></dt>
                            
                                <dd><a href="#btn" id="530" title="530 공학, 공업일반, 토목공학, 환경공학">530 공학, 공업일반, 토목공학, 환경공학</a></dd>
                            
                                <dd><a href="#btn" id="531" title="531 토목공학">531 토목공학</a></dd>
                            
                                <dd><a href="#btn" id="532" title="532 토목역학, 토목재료">532 토목역학, 토목재료</a></dd>
                            
                                <dd><a href="#btn" id="533" title="533 측량">533 측량</a></dd>
                            
                                <dd><a href="#btn" id="534" title="534 도로공학">534 도로공학</a></dd>
                            
                                <dd><a href="#btn" id="535" title="535 철도공학">535 철도공학</a></dd>
                            
                                <dd><a href="#btn" id="536" title="536 교량공학">536 교량공학</a></dd>
                            
                                <dd><a href="#btn" id="537" title="537 수리공학">537 수리공학</a></dd>
                            
                                <dd><a href="#btn" id="538" title="538 항만공학">538 항만공학</a></dd>
                            
                                <dd><a href="#btn" id="539" title="539 위생, 도시, 환경공학">539 위생, 도시, 환경공학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="54" title="54 건축공학">54 건축공학</a></dt>
                            
                                <dd><a href="#btn" id="540" title="540 건축공학">540 건축공학</a></dd>
                            
                                <dd><a href="#btn" id="541" title="541 건축재료">541 건축재료</a></dd>
                            
                                <dd><a href="#btn" id="542" title="542 건축실무">542 건축실무</a></dd>
                            
                                <dd><a href="#btn" id="543" title="543 건물구조의 유형">543 건물구조의 유형</a></dd>
                            
                                <dd><a href="#btn" id="544" title="544 친환경건축">544 친환경건축</a></dd>
                            
                                <dd><a href="#btn" id="545" title="545 건물 세부구조">545 건물 세부구조</a></dd>
                            
                                <dd><a href="#btn" id="546" title="546 건축설비, 연관 및 파이프의 부설">546 건축설비, 연관 및 파이프의 부설</a></dd>
                            
                                <dd><a href="#btn" id="547" title="547 난방, 환기 및 공기조화공학">547 난방, 환기 및 공기조화공학</a></dd>
                            
                                <dd><a href="#btn" id="548" title="548 건축마감">548 건축마감</a></dd>
                            
                                <dd><a href="#btn" id="549" title="549 각종 건물">549 각종 건물</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="55" title="55 기계공학">55 기계공학</a></dt>
                            
                                <dd><a href="#btn" id="550" title="550 기계공학">550 기계공학</a></dd>
                            
                                <dd><a href="#btn" id="551" title="551 기계역학, 요소 및 설계">551 기계역학, 요소 및 설계</a></dd>
                            
                                <dd><a href="#btn" id="552" title="552 공구와 가공장비">552 공구와 가공장비</a></dd>
                            
                                <dd><a href="#btn" id="553" title="553 열공학과 원동기">553 열공학과 원동기</a></dd>
                            
                                <dd><a href="#btn" id="554" title="554 유체역학, 공기역학, 진동학">554 유체역학, 공기역학, 진동학</a></dd>
                            
                                <dd><a href="#btn" id="555" title="555 정밀기계">555 정밀기계</a></dd>
                            
                                <dd><a href="#btn" id="556" title="556 자동차공학">556 자동차공학</a></dd>
                            
                                <dd><a href="#btn" id="557" title="557 철도차량, 기관차">557 철도차량, 기관차</a></dd>
                            
                                <dd><a href="#btn" id="558" title="558 항공우주공학, 우주항법학">558 항공우주공학, 우주항법학</a></dd>
                            
                                <dd><a href="#btn" id="559" title="559 기타 공학">559 기타 공학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="56" title="56 전기공학, 전자공학">56 전기공학, 전자공학</a></dt>
                            
                                <dd><a href="#btn" id="560" title="560 전기공학, 전자공학">560 전기공학, 전자공학</a></dd>
                            
                                <dd><a href="#btn" id="561" title="561 전기회로, 계측, 재료">561 전기회로, 계측, 재료</a></dd>
                            
                                <dd><a href="#btn" id="562" title="562 전기기계 및 기구">562 전기기계 및 기구</a></dd>
                            
                                <dd><a href="#btn" id="563" title="563 발전">563 발전</a></dd>
                            
                                <dd><a href="#btn" id="564" title="564 송전, 배전">564 송전, 배전</a></dd>
                            
                                <dd><a href="#btn" id="565" title="565 전등, 조명, 전열">565 전등, 조명, 전열</a></dd>
                            
                                <dd><a href="#btn" id="567" title="567 통신공학">567 통신공학</a></dd>
                            
                                <dd><a href="#btn" id="568" title="568 무선공학">568 무선공학</a></dd>
                            
                                <dd><a href="#btn" id="569" title="569 전자공학">569 전자공학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="57" title="57 화학공학">57 화학공학</a></dt>
                            
                                <dd><a href="#btn" id="570" title="570 화학공학">570 화학공학</a></dd>
                            
                                <dd><a href="#btn" id="571" title="571 공업화학약품">571 공업화학약품</a></dd>
                            
                                <dd><a href="#btn" id="572" title="572 폭발물, 연료공업">572 폭발물, 연료공업</a></dd>
                            
                                <dd><a href="#btn" id="573" title="573 음료기술">573 음료기술</a></dd>
                            
                                <dd><a href="#btn" id="574" title="574 식품공학">574 식품공학</a></dd>
                            
                                <dd><a href="#btn" id="575" title="575 납(초), 유지, 석유, 가스공업">575 납(초), 유지, 석유, 가스공업</a></dd>
                            
                                <dd><a href="#btn" id="576" title="576 요업 및 동계공업">576 요업 및 동계공업</a></dd>
                            
                                <dd><a href="#btn" id="577" title="577 세탁, 염색 및 동계공업">577 세탁, 염색 및 동계공업</a></dd>
                            
                                <dd><a href="#btn" id="578" title="578 고분자화학공업">578 고분자화학공업</a></dd>
                            
                                <dd><a href="#btn" id="579" title="579 기타 유기화학공업">579 기타 유기화학공업</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="58" title="58 제조업">58 제조업</a></dt>
                            
                                <dd><a href="#btn" id="580" title="580 제조업">580 제조업</a></dd>
                            
                                <dd><a href="#btn" id="581" title="581 금속제조 및 가공업">581 금속제조 및 가공업</a></dd>
                            
                                <dd><a href="#btn" id="582" title="582 철 및 강철제조">582 철 및 강철제조</a></dd>
                            
                                <dd><a href="#btn" id="583" title="583 철기류 및 소규모철공">583 철기류 및 소규모철공</a></dd>
                            
                                <dd><a href="#btn" id="584" title="584 제재업, 목공업, 목제품">584 제재업, 목공업, 목제품</a></dd>
                            
                                <dd><a href="#btn" id="585" title="585 피혁 및 모피공업">585 피혁 및 모피공업</a></dd>
                            
                                <dd><a href="#btn" id="586" title="586 펄프, 종이 및 동계공업">586 펄프, 종이 및 동계공업</a></dd>
                            
                                <dd><a href="#btn" id="587" title="587 직물 및 섬유공업">587 직물 및 섬유공업</a></dd>
                            
                                <dd><a href="#btn" id="588" title="588 의류제조">588 의류제조</a></dd>
                            
                                <dd><a href="#btn" id="589" title="589 소형상품제조">589 소형상품제조</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="59" title="59 생활과학">59 생활과학</a></dt>
                            
                                <dd><a href="#btn" id="590" title="590 생활과학">590 생활과학</a></dd>
                            
                                <dd><a href="#btn" id="591" title="591 가정관리 및 가정생활">591 가정관리 및 가정생활</a></dd>
                            
                                <dd><a href="#btn" id="592" title="592 의복">592 의복</a></dd>
                            
                                <dd><a href="#btn" id="593" title="593 몸치장(몸단장), 화장">593 몸치장(몸단장), 화장</a></dd>
                            
                                <dd><a href="#btn" id="594" title="594 식품과 식료">594 식품과 식료</a></dd>
                            
                                <dd><a href="#btn" id="595" title="595 주택관리 및 가정설비">595 주택관리 및 가정설비</a></dd>
                            
                                <dd><a href="#btn" id="596" title="596 공동주거용 주택 시설관리">596 공동주거용 주택 시설관리</a></dd>
                            
                                <dd><a href="#btn" id="597" title="597 가정위생">597 가정위생</a></dd>
                            
                                <dd><a href="#btn" id="598" title="598 육아">598 육아</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_6" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                      <td>
                        <dl>
                            <dt><a href="#btn" id="60" title="60 예술">60 예술</a></dt>
                            
                                <dd><a href="#btn" id="600" title="600 예술">600 예술</a></dd>
                            
                                <dd><a href="#btn" id="601" title="601 미술이론, 미학">601 미술이론, 미학</a></dd>
                            
                                <dd><a href="#btn" id="602" title="602 미술의 재료 및 기법">602 미술의 재료 및 기법</a></dd>
                            
                                <dd><a href="#btn" id="603" title="603 미술사전">603 미술사전</a></dd>
                            
                                <dd><a href="#btn" id="604" title="604 미술의 주제">604 미술의 주제</a></dd>
                            
                                <dd><a href="#btn" id="605" title="605 미술 연속간행물">605 미술 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="606" title="606 미술 분야의 학회, 단체, 기관, 회의">606 미술 분야의 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="607" title="607 미술의 지도법, 연구법 및 교육">607 미술의 지도법, 연구법 및 교육</a></dd>
                            
                                <dd><a href="#btn" id="608" title="608 미술전집, 총서">608 미술전집, 총서</a></dd>
                            
                                <dd><a href="#btn" id="609" title="609 미술사">609 미술사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="61" title="61 건축술">61 건축술</a></dt>
                            
                                <dd><a href="#btn" id="610" title="610 건축술">610 건축술</a></dd>
                            
                                <dd><a href="#btn" id="611" title="611 궁전, 성곽">611 궁전, 성곽</a></dd>
                            
                                <dd><a href="#btn" id="612" title="612 종교건물">612 종교건물</a></dd>
                            
                                <dd><a href="#btn" id="613" title="613 공공건물">613 공공건물</a></dd>
                            
                                <dd><a href="#btn" id="614" title="614 과학 및 연구용건물">614 과학 및 연구용건물</a></dd>
                            
                                <dd><a href="#btn" id="615" title="615 공업용건물">615 공업용건물</a></dd>
                            
                                <dd><a href="#btn" id="616" title="616 상업, 교통, 통신용건물">616 상업, 교통, 통신용건물</a></dd>
                            
                                <dd><a href="#btn" id="617" title="617 주거용 건물">617 주거용 건물</a></dd>
                            
                                <dd><a href="#btn" id="618" title="618 기타 건물">618 기타 건물</a></dd>
                            
                                <dd><a href="#btn" id="619" title="619 장식 및 의장">619 장식 및 의장</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="62" title="62 조각 및 조형미술">62 조각 및 조형미술</a></dt>
                            
                                <dd><a href="#btn" id="620" title="620 조각 및 조형미술">620 조각 및 조형미술</a></dd>
                            
                                <dd><a href="#btn" id="622" title="622 조소재료 및 기법">622 조소재료 및 기법</a></dd>
                            
                                <dd><a href="#btn" id="623" title="623 목조">623 목조</a></dd>
                            
                                <dd><a href="#btn" id="624" title="624 석조">624 석조</a></dd>
                            
                                <dd><a href="#btn" id="625" title="625 금동조">625 금동조</a></dd>
                            
                                <dd><a href="#btn" id="626" title="626 점토조소, 소조">626 점토조소, 소조</a></dd>
                            
                                <dd><a href="#btn" id="627" title="627 기타 재료">627 기타 재료</a></dd>
                            
                                <dd><a href="#btn" id="628" title="628 전각, 인장">628 전각, 인장</a></dd>
                            
                                <dd><a href="#btn" id="629" title="629 제상">629 제상</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="63" title="63 공예, 장식미술">63 공예, 장식미술</a></dt>
                            
                                <dd><a href="#btn" id="630" title="630 공예, 장식미술">630 공예, 장식미술</a></dd>
                            
                                <dd><a href="#btn" id="631" title="631 도자공예, 유리공예">631 도자공예, 유리공예</a></dd>
                            
                                <dd><a href="#btn" id="632" title="632 금속공예">632 금속공예</a></dd>
                            
                                <dd><a href="#btn" id="633" title="633 보석, 갑각, 패류공예">633 보석, 갑각, 패류공예</a></dd>
                            
                                <dd><a href="#btn" id="634" title="634 목, 죽, 화훼, 왕골공예">634 목, 죽, 화훼, 왕골공예</a></dd>
                            
                                <dd><a href="#btn" id="635" title="635 칠공예">635 칠공예</a></dd>
                            
                                <dd><a href="#btn" id="636" title="636 염직물공예">636 염직물공예</a></dd>
                            
                                <dd><a href="#btn" id="637" title="637 고무, 플라스틱공예">637 고무, 플라스틱공예</a></dd>
                            
                                <dd><a href="#btn" id="638" title="638 미술가구">638 미술가구</a></dd>
                            
                                <dd><a href="#btn" id="639" title="639 장식예술">639 장식예술</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="64" title="64 서예">64 서예</a></dt>
                            
                                <dd><a href="#btn" id="640" title="640 서예">640 서예</a></dd>
                            
                                <dd><a href="#btn" id="641" title="641 한자의 서체">641 한자의 서체</a></dd>
                            
                                <dd><a href="#btn" id="642" title="642 한자서법">642 한자서법</a></dd>
                            
                                <dd><a href="#btn" id="643" title="643 한글서법">643 한글서법</a></dd>
                            
                                <dd><a href="#btn" id="644" title="644 기타 서법">644 기타 서법</a></dd>
                            
                                <dd><a href="#btn" id="646" title="646 펜습자">646 펜습자</a></dd>
                            
                                <dd><a href="#btn" id="647" title="647 낙관, 수결(서명)">647 낙관, 수결(서명)</a></dd>
                            
                                <dd><a href="#btn" id="648" title="648 서보, 서첩, 법첩">648 서보, 서첩, 법첩</a></dd>
                            
                                <dd><a href="#btn" id="649" title="649 문방구">649 문방구</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="65" title="65 회화, 도화">65 회화, 도화</a></dt>
                            
                                <dd><a href="#btn" id="650" title="650 회화, 도화">650 회화, 도화</a></dd>
                            
                                <dd><a href="#btn" id="651" title="651 채색이론 및 실제">651 채색이론 및 실제</a></dd>
                            
                                <dd><a href="#btn" id="652" title="652 회화의 재료 및 방법">652 회화의 재료 및 방법</a></dd>
                            
                                <dd><a href="#btn" id="653" title="653 시대별 및 국별 회화">653 시대별 및 국별 회화</a></dd>
                            
                                <dd><a href="#btn" id="654" title="654 주제별 회화">654 주제별 회화</a></dd>
                            
                                <dd><a href="#btn" id="656" title="656 소묘, 도화">656 소묘, 도화</a></dd>
                            
                                <dd><a href="#btn" id="657" title="657 만화, 삽화">657 만화, 삽화</a></dd>
                            
                                <dd><a href="#btn" id="658" title="658 그래픽디자인, 도안, 포스터">658 그래픽디자인, 도안, 포스터</a></dd>
                            
                                <dd><a href="#btn" id="659" title="659 판화">659 판화</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="66" title="66 사진예술">66 사진예술</a></dt>
                            
                                <dd><a href="#btn" id="660" title="660 사진예술">660 사진예술</a></dd>
                            
                                <dd><a href="#btn" id="661" title="661 사진기계, 재료">661 사진기계, 재료</a></dd>
                            
                                <dd><a href="#btn" id="662" title="662 촬영기술">662 촬영기술</a></dd>
                            
                                <dd><a href="#btn" id="663" title="663 음화처리">663 음화처리</a></dd>
                            
                                <dd><a href="#btn" id="664" title="664 양화처리(인화)">664 양화처리(인화)</a></dd>
                            
                                <dd><a href="#btn" id="666" title="666 특수사진술">666 특수사진술</a></dd>
                            
                                <dd><a href="#btn" id="667" title="667 사진응용">667 사진응용</a></dd>
                            
                                <dd><a href="#btn" id="668" title="668 사진집">668 사진집</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="67" title="67 음악">67 음악</a></dt>
                            
                                <dd><a href="#btn" id="670" title="670 음악">670 음악</a></dd>
                            
                                <dd><a href="#btn" id="671" title="671 음악이론 및 기법">671 음악이론 및 기법</a></dd>
                            
                                <dd><a href="#btn" id="672" title="672 종교음악">672 종교음악</a></dd>
                            
                                <dd><a href="#btn" id="673" title="673 성악">673 성악</a></dd>
                            
                                <dd><a href="#btn" id="674" title="674 극음악, 오페라">674 극음악, 오페라</a></dd>
                            
                                <dd><a href="#btn" id="675" title="675 기악합주">675 기악합주</a></dd>
                            
                                <dd><a href="#btn" id="676" title="676 건반악기 및 타악기">676 건반악기 및 타악기</a></dd>
                            
                                <dd><a href="#btn" id="677" title="677 현악기">677 현악기</a></dd>
                            
                                <dd><a href="#btn" id="678" title="678 관악기(취주악기)">678 관악기(취주악기)</a></dd>
                            
                                <dd><a href="#btn" id="679" title="679 한국음악 및 동양전통음악">679 한국음악 및 동양전통음악</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="68" title="68 공연예술 및 매체예술">68 공연예술 및 매체예술</a></dt>
                            
                                <dd><a href="#btn" id="680" title="680 공연예술 및 매체예술">680 공연예술 및 매체예술</a></dd>
                            
                                <dd><a href="#btn" id="681" title="681 극장, 연출, 연기">681 극장, 연출, 연기</a></dd>
                            
                                <dd><a href="#btn" id="682" title="682 연희">682 연희</a></dd>
                            
                                <dd><a href="#btn" id="684" title="684 각종 연극">684 각종 연극</a></dd>
                            
                                <dd><a href="#btn" id="685" title="685 무용, 발레">685 무용, 발레</a></dd>
                            
                                <dd><a href="#btn" id="686" title="686 라디오극 및 음성매체 예술">686 라디오극 및 음성매체 예술</a></dd>
                            
                                <dd><a href="#btn" id="687" title="687 텔레비전극 및 시청각매체 방송예술">687 텔레비전극 및 시청각매체 방송예술</a></dd>
                            
                                <dd><a href="#btn" id="688" title="688 영화">688 영화</a></dd>
                            
                                <dd><a href="#btn" id="689" title="689 대중연예">689 대중연예</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="69" title="69 오락, 스포츠">69 오락, 스포츠</a></dt>
                            
                                <dd><a href="#btn" id="690" title="690 오락, 스포츠">690 오락, 스포츠</a></dd>
                            
                                <dd><a href="#btn" id="691" title="691 오락">691 오락</a></dd>
                            
                                <dd><a href="#btn" id="692" title="692 체육학, 스포츠">692 체육학, 스포츠</a></dd>
                            
                                <dd><a href="#btn" id="693" title="693 체조, 유희">693 체조, 유희</a></dd>
                            
                                <dd><a href="#btn" id="694" title="694 육상경기">694 육상경기</a></dd>
                            
                                <dd><a href="#btn" id="695" title="695 구기">695 구기</a></dd>
                            
                                <dd><a href="#btn" id="696" title="696 수상경기, 공중경기">696 수상경기, 공중경기</a></dd>
                            
                                <dd><a href="#btn" id="697" title="697 동계스포츠">697 동계스포츠</a></dd>
                            
                                <dd><a href="#btn" id="698" title="698 무예 및 기타경기">698 무예 및 기타경기</a></dd>
                            
                                <dd><a href="#btn" id="699" title="699 기타 오락 및 레저스포츠">699 기타 오락 및 레저스포츠</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_7" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                      <td>
                        <dl>
                            <dt><a href="#btn" id="70" title="70 언어">70 언어</a></dt>
                            
                                <dd><a href="#btn" id="700" title="700 언어">700 언어</a></dd>
                            
                                <dd><a href="#btn" id="701" title="701 언어학">701 언어학</a></dd>
                            
                                <dd><a href="#btn" id="702" title="702 잡저">702 잡저</a></dd>
                            
                                <dd><a href="#btn" id="703" title="703 사전">703 사전</a></dd>
                            
                                <dd><a href="#btn" id="704" title="704 강연집">704 강연집</a></dd>
                            
                                <dd><a href="#btn" id="705" title="705 연속간행물">705 연속간행물</a></dd>
                            
                                <dd><a href="#btn" id="706" title="706 학회, 단체, 기관, 회의">706 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a href="#btn" id="707" title="707 지도법, 연구법 및 교육, 교육재료">707 지도법, 연구법 및 교육, 교육재료</a></dd>
                            
                                <dd><a href="#btn" id="708" title="708 전집, 총서">708 전집, 총서</a></dd>
                            
                                <dd><a href="#btn" id="709" title="709 언어사">709 언어사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="71" title="71 한국어">71 한국어</a></dt>
                            
                                <dd><a href="#btn" id="710" title="710 한국어">710 한국어</a></dd>
                            
                                <dd><a href="#btn" id="711" title="711 음운, 음성, 문자">711 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="712" title="712 어원, 어의">712 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="713" title="713 사전">713 사전</a></dd>
                            
                                <dd><a href="#btn" id="714" title="714 어휘">714 어휘</a></dd>
                            
                                <dd><a href="#btn" id="715" title="715 문법">715 문법</a></dd>
                            
                                <dd><a href="#btn" id="716" title="716 작문">716 작문</a></dd>
                            
                                <dd><a href="#btn" id="717" title="717 독본, 해석, 회화">717 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="718" title="718 방언">718 방언</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="72" title="72 중국어">72 중국어</a></dt>
                            
                                <dd><a href="#btn" id="720" title="720 중국어">720 중국어</a></dd>
                            
                                <dd><a href="#btn" id="721" title="721 음운, 음성, 문자">721 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="722" title="722 어원, 어의">722 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="723" title="723 사전">723 사전</a></dd>
                            
                                <dd><a href="#btn" id="724" title="724 어휘">724 어휘</a></dd>
                            
                                <dd><a href="#btn" id="725" title="725 문법">725 문법</a></dd>
                            
                                <dd><a href="#btn" id="726" title="726 작문">726 작문</a></dd>
                            
                                <dd><a href="#btn" id="727" title="727 독본, 해석, 회화">727 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="728" title="728 방언">728 방언</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="73" title="73 일본어">73 일본어</a></dt>
                            
                                <dd><a href="#btn" id="730" title="730 일본어">730 일본어</a></dd>
                            
                                <dd><a href="#btn" id="731" title="731 음운, 음성, 문자">731 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="732" title="732 어원, 어의">732 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="733" title="733 사전">733 사전</a></dd>
                            
                                <dd><a href="#btn" id="734" title="734 어휘">734 어휘</a></dd>
                            
                                <dd><a href="#btn" id="735" title="735 문법, 어법">735 문법, 어법</a></dd>
                            
                                <dd><a href="#btn" id="736" title="736 작문">736 작문</a></dd>
                            
                                <dd><a href="#btn" id="737" title="737 독본, 해석, 회화">737 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="738" title="738 방언">738 방언</a></dd>
                            
                                <dd><a href="#btn" id="739" title="739 기타 아시아 제어">739 기타 아시아 제어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="74" title="74 영어">74 영어</a></dt>
                            
                                <dd><a href="#btn" id="740" title="740 영어">740 영어</a></dd>
                            
                                <dd><a href="#btn" id="741" title="741 음운, 음성, 문자">741 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="742" title="742 어원, 어의">742 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="743" title="743 사전">743 사전</a></dd>
                            
                                <dd><a href="#btn" id="744" title="744 어휘">744 어휘</a></dd>
                            
                                <dd><a href="#btn" id="745" title="745 문법">745 문법</a></dd>
                            
                                <dd><a href="#btn" id="746" title="746 작문">746 작문</a></dd>
                            
                                <dd><a href="#btn" id="747" title="747 독본, 해석, 회화">747 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="748" title="748 방언">748 방언</a></dd>
                            
                                <dd><a href="#btn" id="749" title="749 앵글로색슨어">749 앵글로색슨어</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a href="#btn" id="75" title="75 독일어">75 독일어</a></dt>
                            
                                <dd><a href="#btn" id="750" title="750 독일어">750 독일어</a></dd>
                            
                                <dd><a href="#btn" id="751" title="751 음운, 음성, 문자">751 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="752" title="752 어원, 어의">752 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="753" title="753 사전">753 사전</a></dd>
                            
                                <dd><a href="#btn" id="754" title="754 어휘">754 어휘</a></dd>
                            
                                <dd><a href="#btn" id="755" title="755 문법">755 문법</a></dd>
                            
                                <dd><a href="#btn" id="756" title="756 작문">756 작문</a></dd>
                            
                                <dd><a href="#btn" id="757" title="757 독본, 해석, 회화">757 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="758" title="758 방언">758 방언</a></dd>
                            
                                <dd><a href="#btn" id="759" title="759 기타 게르만어">759 기타 게르만어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a href="#btn" id="76" title="76 프랑스어">76 프랑스어</a></dt>
                            
                                <dd><a href="#btn" id="760" title="760 프랑스어">760 프랑스어</a></dd>
                            
                                <dd><a href="#btn" id="761" title="761 음운, 음성, 문자">761 음운, 음성, 문자</a></dd>
                            
                                <dd><a href="#btn" id="762" title="762 어원, 어의">762 어원, 어의</a></dd>
                            
                                <dd><a href="#btn" id="763" title="763 사전">763 사전</a></dd>
                            
                                <dd><a href="#btn" id="764" title="764 어휘">764 어휘</a></dd>
                            
                                <dd><a href="#btn" id="765" title="765 문법">765 문법</a></dd>
                            
                                <dd><a href="#btn" id="766" title="766 작문">766 작문</a></dd>
                            
                                <dd><a href="#btn" id="767" title="767 독본, 해석, 회화">767 독본, 해석, 회화</a></dd>
                            
                                <dd><a href="#btn" id="768" title="768 방언">768 방언</a></dd>
                            
                                <dd><a href="#btn" id="769" title="769 프로방스어">769 프로방스어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="77" title="77 스페인어">77 스페인어</a></dt>
                            
                                <dd><a class="#btn" id="770" title="770 스페인어">770 스페인어</a></dd>
                            
                                <dd><a class="#btn" id="771" title="771 음운, 음성, 문자">771 음운, 음성, 문자</a></dd>
                            
                                <dd><a class="#btn" id="772" title="772 어원, 어의">772 어원, 어의</a></dd>
                            
                                <dd><a class="#btn" id="773" title="773 사전">773 사전</a></dd>
                            
                                <dd><a class="#btn" id="774" title="774 어휘">774 어휘</a></dd>
                            
                                <dd><a class="#btn" id="775" title="775 문법">775 문법</a></dd>
                            
                                <dd><a class="#btn" id="776" title="776 작문">776 작문</a></dd>
                            
                                <dd><a class="#btn" id="777" title="777 독본, 해석, 회화">777 독본, 해석, 회화</a></dd>
                            
                                <dd><a class="#btn" id="778" title="778 방언">778 방언</a></dd>
                            
                                <dd><a class="#btn" id="779" title="779 포르투갈어">779 포르투갈어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="78" title="78 이탈리아어">78 이탈리아어</a></dt>
                            
                                <dd><a class="#btn" id="780" title="780 이탈리아어">780 이탈리아어</a></dd>
                            
                                <dd><a class="#btn" id="781" title="781 음운, 음성, 문자">781 음운, 음성, 문자</a></dd>
                            
                                <dd><a class="#btn" id="782" title="782 어원, 어의">782 어원, 어의</a></dd>
                            
                                <dd><a class="#btn" id="783" title="783 사전">783 사전</a></dd>
                            
                                <dd><a class="#btn" id="784" title="784 어휘">784 어휘</a></dd>
                            
                                <dd><a class="#btn" id="785" title="785 문법">785 문법</a></dd>
                            
                                <dd><a class="#btn" id="786" title="786 작문">786 작문</a></dd>
                            
                                <dd><a class="#btn" id="787" title="787 독본, 해석, 회화">787 독본, 해석, 회화</a></dd>
                            
                                <dd><a class="#btn" id="788" title="788 방언">788 방언</a></dd>
                            
                                <dd><a class="#btn" id="789" title="789 루마니아어">789 루마니아어</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="79" title="79 기타 제어">79 기타 제어</a></dt>
                            
                                <dd><a class="#btn" id="790" title="790 기타 제어">790 기타 제어</a></dd>
                            
                                <dd><a class="#btn" id="792" title="792 인도-유럽계어">792 인도-유럽계어</a></dd>
                            
                                <dd><a class="#btn" id="793" title="793 아프리카제어">793 아프리카제어</a></dd>
                            
                                <dd><a class="#btn" id="794" title="794 북아메리카인디언어">794 북아메리카인디언어</a></dd>
                            
                                <dd><a class="#btn" id="795" title="795 남아메리카인디언어">795 남아메리카인디언어</a></dd>
                            
                                <dd><a class="#btn" id="796" title="796 오스트로네시아어">796 오스트로네시아어</a></dd>
                            
                                <dd><a class="#btn" id="797" title="797 셈족어">797 셈족어</a></dd>
                            
                                <dd><a class="#btn" id="798" title="798 함족어">798 함족어</a></dd>
                            
                                <dd><a class="#btn" id="799" title="799 국제어(인공어) 및 기타 언어">799 국제어(인공어) 및 기타 언어</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_8" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                       <td>
                        <dl>
                            <dt><a class="#btn" id="80" title="80 문학">80 문학</a></dt>
                            
                                <dd><a class="#btn" id="800" title="800 문학">800 문학</a></dd>
                            
                                <dd><a class="#btn" id="801" title="801 문학이론">801 문학이론</a></dd>
                            
                                <dd><a class="#btn" id="802" title="802 문장작법, 수사학">802 문장작법, 수사학</a></dd>
                            
                                <dd><a class="#btn" id="803" title="803 사전, 사전">803 사전, 사전</a></dd>
                            
                                <dd><a class="#btn" id="804" title="804 강연집, 수필">804 강연집, 수필</a></dd>
                            
                                <dd><a class="#btn" id="805" title="805 연속간행물">805 연속간행물</a></dd>
                            
                                <dd><a class="#btn" id="806" title="806 학회, 단체, 기관, 회의">806 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a class="#btn" id="807" title="807 지도법 및 연구법, 교육, 교육자료">807 지도법 및 연구법, 교육, 교육자료</a></dd>
                            
                                <dd><a class="#btn" id="808" title="808 전집, 총서">808 전집, 총서</a></dd>
                            
                                <dd><a class="#btn" id="809" title="809 문학사, 평론">809 문학사, 평론</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="81" title="81 한국문학">81 한국문학</a></dt>
                            
                                <dd><a class="#btn" id="810" title="810 한국문학">810 한국문학</a></dd>
                            
                                <dd><a class="#btn" id="811" title="811 시">811 시</a></dd>
                            
                                <dd><a class="#btn" id="812" title="812 희곡">812 희곡</a></dd>
                            
                                <dd><a class="#btn" id="813" title="813 소설">813 소설</a></dd>
                            
                                <dd><a class="#btn" id="814" title="814 수필">814 수필</a></dd>
                            
                                <dd><a class="#btn" id="815" title="815 연설, 웅변">815 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="816" title="816 일기, 서간, 기행">816 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="817" title="817 풍자">817 풍자</a></dd>
                            
                                <dd><a class="#btn" id="818" title="818 르포르타주 및 기타">818 르포르타주 및 기타</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="82" title="82 중국문학">82 중국문학</a></dt>
                            
                                <dd><a class="#btn" id="820" title="820 중국문학">820 중국문학</a></dd>
                            
                                <dd><a class="#btn" id="821" title="821 시">821 시</a></dd>
                            
                                <dd><a class="#btn" id="822" title="822 희곡">822 희곡</a></dd>
                            
                                <dd><a class="#btn" id="823" title="823 소설">823 소설</a></dd>
                            
                                <dd><a class="#btn" id="824" title="824 수필">824 수필</a></dd>
                            
                                <dd><a class="#btn" id="825" title="825 연설, 웅변">825 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="826" title="826 일기, 서간, 기행">826 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="827" title="827 풍자">827 풍자</a></dd>
                            
                                <dd><a class="#btn" id="828" title="828 르포르타주 및 기타">828 르포르타주 및 기타</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="83" title="83 일본문학">83 일본문학</a></dt>
                            
                                <dd><a class="#btn" id="830" title="830 일본문학">830 일본문학</a></dd>
                            
                                <dd><a class="#btn" id="831" title="831 시">831 시</a></dd>
                            
                                <dd><a class="#btn" id="832" title="832 희곡">832 희곡</a></dd>
                            
                                <dd><a class="#btn" id="833" title="833 소설">833 소설</a></dd>
                            
                                <dd><a class="#btn" id="834" title="834 수필">834 수필</a></dd>
                            
                                <dd><a class="#btn" id="835" title="835 연설, 웅변">835 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="836" title="836 일기, 서간, 기행">836 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="837" title="837 풍자">837 풍자</a></dd>
                            
                                <dd><a class="#btn" id="838" title="838 르포르타주 및 기타">838 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="839" title="839 기타 아시아 제문학">839 기타 아시아 제문학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="84" title="84 영미문학">84 영미문학</a></dt>
                            
                                <dd><a class="#btn" id="840" title="840 영미문학">840 영미문학</a></dd>
                            
                                <dd><a class="#btn" id="841" title="841 시">841 시</a></dd>
                            
                                <dd><a class="#btn" id="842" title="842 희곡">842 희곡</a></dd>
                            
                                <dd><a class="#btn" id="843" title="843 소설">843 소설</a></dd>
                            
                                <dd><a class="#btn" id="844" title="844 수필">844 수필</a></dd>
                            
                                <dd><a class="#btn" id="845" title="845 연설, 웅변">845 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="846" title="846 일기, 서간, 기행">846 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="847" title="847 풍자">847 풍자</a></dd>
                            
                                <dd><a class="#btn" id="848" title="848 르포르타주 및 기타">848 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="849" title="849 미국문학">849 미국문학</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dl>
                            <dt><a class="#btn" id="85" title="85 독일문학">85 독일문학</a></dt>
                            
                                <dd><a class="#btn" id="850" title="850 독일문학">850 독일문학</a></dd>
                            
                                <dd><a class="#btn" id="851" title="851 시">851 시</a></dd>
                            
                                <dd><a class="#btn" id="852" title="852 희곡">852 희곡</a></dd>
                            
                                <dd><a class="#btn" id="853" title="853 소설">853 소설</a></dd>
                            
                                <dd><a class="#btn" id="854" title="854 수필">854 수필</a></dd>
                            
                                <dd><a class="#btn" id="855" title="855 연설, 웅변">855 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="856" title="856 일기, 서간, 기행">856 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="857" title="857 풍자">857 풍자</a></dd>
                            
                                <dd><a class="#btn" id="858" title="858 르포르타주 및 기타">858 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="859" title="859 기타 게르만 문학">859 기타 게르만 문학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="86" title="86 프랑스문학">86 프랑스문학</a></dt>
                            
                                <dd><a class="#btn" id="860" title="860 프랑스문학">860 프랑스문학</a></dd>
                            
                                <dd><a class="#btn" id="861" title="861 시">861 시</a></dd>
                            
                                <dd><a class="#btn" id="862" title="862 희곡">862 희곡</a></dd>
                            
                                <dd><a class="#btn" id="863" title="863 소설">863 소설</a></dd>
                            
                                <dd><a class="#btn" id="864" title="864 수필">864 수필</a></dd>
                            
                                <dd><a class="#btn" id="865" title="865 연설, 웅변">865 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="866" title="866 일기, 서간, 기행">866 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="867" title="867 풍자">867 풍자</a></dd>
                            
                                <dd><a class="#btn" id="868" title="868 르포르타주 및 기타">868 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="869" title="869 프로방스문학">869 프로방스문학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="87" title="87 스페인 및 포르투갈문학">87 스페인 및 포르투갈문학</a></dt>
                            
                                <dd><a class="#btn" id="870" title="870 스페인 및 포르투갈문학">870 스페인 및 포르투갈문학</a></dd>
                            
                                <dd><a class="#btn" id="871" title="871 시">871 시</a></dd>
                            
                                <dd><a class="#btn" id="872" title="872 희곡">872 희곡</a></dd>
                            
                                <dd><a class="#btn" id="873" title="873 소설">873 소설</a></dd>
                            
                                <dd><a class="#btn" id="874" title="874 수필">874 수필</a></dd>
                            
                                <dd><a class="#btn" id="875" title="875 연설, 웅변">875 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="876" title="876 일기, 서간, 기행">876 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="877" title="877 풍자">877 풍자</a></dd>
                            
                                <dd><a class="#btn" id="878" title="878 르포르타주 및 기타">878 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="879" title="879 포르투갈문학">879 포르투갈문학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="88" title="88 이탈리아문학">88 이탈리아문학</a></dt>
                            
                                <dd><a class="#btn" id="880" title="880 이탈리아문학">880 이탈리아문학</a></dd>
                            
                                <dd><a class="#btn" id="881" title="881 시">881 시</a></dd>
                            
                                <dd><a class="#btn" id="882" title="882 희곡">882 희곡</a></dd>
                            
                                <dd><a class="#btn" id="883" title="883 소설">883 소설</a></dd>
                            
                                <dd><a class="#btn" id="884" title="884 수필">884 수필</a></dd>
                            
                                <dd><a class="#btn" id="885" title="885 연설, 웅변">885 연설, 웅변</a></dd>
                            
                                <dd><a class="#btn" id="886" title="886 일기, 서간, 기행">886 일기, 서간, 기행</a></dd>
                            
                                <dd><a class="#btn" id="887" title="887 풍자">887 풍자</a></dd>
                            
                                <dd><a class="#btn" id="888" title="888 르포르타주 및 기타">888 르포르타주 및 기타</a></dd>
                            
                                <dd><a class="#btn" id="889" title="889 루마니아문학">889 루마니아문학</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="89" title="89 기타 제문학">89 기타 제문학</a></dt>
                            
                                <dd><a class="#btn" id="890" title="890 기타 제문학">890 기타 제문학</a></dd>
                            
                                <dd><a class="#btn" id="892" title="892 인도-유럽계문학">892 인도-유럽계문학</a></dd>
                            
                                <dd><a class="#btn" id="893" title="893 아프리카제문학">893 아프리카제문학</a></dd>
                            
                                <dd><a class="#btn" id="894" title="894 북아메리카 인디언문학">894 북아메리카 인디언문학</a></dd>
                            
                                <dd><a class="#btn" id="895" title="895 남아메리카 인디언문학">895 남아메리카 인디언문학</a></dd>
                            
                                <dd><a class="#btn" id="896" title="896 오스트로네시아문학">896 오스트로네시아문학</a></dd>
                            
                                <dd><a class="#btn" id="897" title="897 셈족문학">897 셈족문학</a></dd>
                            
                                <dd><a class="#btn" id="898" title="898 함족문학">898 함족문학</a></dd>
                            
                                <dd><a class="#btn" id="899" title="899 기타 문학">899 기타 문학</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table>
        
            <table id="kdcDepth2List_9" class="kdcDepth2List" style="display: none;">
                
                    <tr>
                     <td>
                        <dl>
                            <dt><a class="#btn" id="90" title="90 역사">90 역사</a></dt>
                            
                                <dd><a class="#btn" id="900" title="900 역사">900 역사</a></dd>
                            
                                <dd><a class="#btn" id="901" title="901 역사철학 및 이론">901 역사철학 및 이론</a></dd>
                            
                                <dd><a class="#btn" id="902" title="902 역사보조학">902 역사보조학</a></dd>
                            
                                <dd><a class="#btn" id="903" title="903 사전, 사전">903 사전, 사전</a></dd>
                            
                                <dd><a class="#btn" id="904" title="904 강연집, 사평">904 강연집, 사평</a></dd>
                            
                                <dd><a class="#btn" id="905" title="905 연속간행물">905 연속간행물</a></dd>
                            
                                <dd><a class="#btn" id="906" title="906 학회, 단체, 기관, 회의">906 학회, 단체, 기관, 회의</a></dd>
                            
                                <dd><a class="#btn" id="907" title="907 지도법, 연구법 및 교육, 교육자료">907 지도법, 연구법 및 교육, 교육자료</a></dd>
                            
                                <dd><a class="#btn" id="908" title="908 전집, 총서">908 전집, 총서</a></dd>
                            
                                <dd><a class="#btn" id="909" title="909 세계사, 세계문화사">909 세계사, 세계문화사</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="91" title="91 아시아">91 아시아</a></dt>
                            
                                <dd><a class="#btn" id="910" title="910 아시아">910 아시아</a></dd>
                            
                                <dd><a class="#btn" id="911" title="911 한국">911 한국</a></dd>
                            
                                <dd><a class="#btn" id="912" title="912 중국">912 중국</a></dd>
                            
                                <dd><a class="#btn" id="913" title="913 일본">913 일본</a></dd>
                            
                                <dd><a class="#btn" id="914" title="914 동남아시아">914 동남아시아</a></dd>
                            
                                <dd><a class="#btn" id="915" title="915 인디아와 남부아시아">915 인디아와 남부아시아</a></dd>
                            
                                <dd><a class="#btn" id="916" title="916 중앙아시아">916 중앙아시아</a></dd>
                            
                                <dd><a class="#btn" id="917" title="917 시베리아(서백리아)">917 시베리아(서백리아)</a></dd>
                            
                                <dd><a class="#btn" id="918" title="918 서남아시아, 중동">918 서남아시아, 중동</a></dd>
                            
                                <dd><a class="#btn" id="919" title="919 아라비아반도">919 아라비아반도</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="92" title="92 유럽">92 유럽</a></dt>
                            
                                <dd><a class="#btn" id="920" title="920 유럽">920 유럽</a></dd>
                            
                                <dd><a class="#btn" id="921" title="921 고대그리스(희랍고대사)">921 고대그리스(희랍고대사)</a></dd>
                            
                                <dd><a class="#btn" id="922" title="922 고대로마(로마고대사)">922 고대로마(로마고대사)</a></dd>
                            
                                <dd><a class="#btn" id="923" title="923 스칸디나비아">923 스칸디나비아</a></dd>
                            
                                <dd><a class="#btn" id="924" title="924 영국, 아일랜드">924 영국, 아일랜드</a></dd>
                            
                                <dd><a class="#btn" id="925" title="925 독일과 중앙유럽">925 독일과 중앙유럽</a></dd>
                            
                                <dd><a class="#btn" id="926" title="926 프랑스와 인접국가">926 프랑스와 인접국가</a></dd>
                            
                                <dd><a class="#btn" id="927" title="927 스페인 및 인접국가">927 스페인 및 인접국가</a></dd>
                            
                                <dd><a class="#btn" id="928" title="928 이탈리아 및 인접국가">928 이탈리아 및 인접국가</a></dd>
                            
                                <dd><a class="#btn" id="929" title="929 러시아와 동부유럽">929 러시아와 동부유럽</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="93" title="93 아프리카">93 아프리카</a></dt>
                            
                                <dd><a class="#btn" id="930" title="930 아프리카">930 아프리카</a></dd>
                            
                                <dd><a class="#btn" id="931" title="931 북아프리카">931 북아프리카</a></dd>
                            
                                <dd><a class="#btn" id="934" title="934 서아프리카">934 서아프리카</a></dd>
                            
                                <dd><a class="#btn" id="936" title="936 중아프리카">936 중아프리카</a></dd>
                            
                                <dd><a class="#btn" id="937" title="937 동아프리카">937 동아프리카</a></dd>
                            
                                <dd><a class="#btn" id="938" title="938 남아프리카">938 남아프리카</a></dd>
                            
                                <dd><a class="#btn" id="939" title="939 남인도양제도">939 남인도양제도</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="94" title="94 북아메리카(북미)">94 북아메리카(북미)</a></dt>
                            
                                <dd><a class="#btn" id="940" title="940 북아메리카(북미)">940 북아메리카(북미)</a></dd>
                            
                                <dd><a class="#btn" id="941" title="941 캐나다">941 캐나다</a></dd>
                            
                                <dd><a class="#btn" id="942" title="942 미국(미합중국)">942 미국(미합중국)</a></dd>
                            
                                <dd><a class="#btn" id="943" title="943 멕시코">943 멕시코</a></dd>
                            
                                <dd><a class="#btn" id="944" title="944 중앙아메리카(중미)">944 중앙아메리카(중미)</a></dd>
                            
                                <dd><a class="#btn" id="945" title="945 과테말라, 벨리즈, 엘살바도르">945 과테말라, 벨리즈, 엘살바도르</a></dd>
                            
                                <dd><a class="#btn" id="946" title="946 온두라스">946 온두라스</a></dd>
                            
                                <dd><a class="#btn" id="947" title="947 니카라과">947 니카라과</a></dd>
                            
                                <dd><a class="#btn" id="948" title="948 코스타리카, 파나마">948 코스타리카, 파나마</a></dd>
                            
                                <dd><a class="#btn" id="949" title="949 서인도제도">949 서인도제도</a></dd>
                            
                        </dl>
                    </td>
                </tr>
                <tr>
                  <td>                   
                        <dl>
                            <dt><a class="#btn" id="95" title="95 남아메리카(남미)">95 남아메리카(남미)</a></dt>
                            
                                <dd><a class="#btn" id="950" title="950 남아메리카(남미)">950 남아메리카(남미)</a></dd>
                            
                                <dd><a class="#btn" id="951" title="951 콜럼비아">951 콜럼비아</a></dd>
                            
                                <dd><a class="#btn" id="952" title="952 베네수엘라, 기아나">952 베네수엘라, 기아나</a></dd>
                            
                                <dd><a class="#btn" id="953" title="953 브라질">953 브라질</a></dd>
                            
                                <dd><a class="#btn" id="954" title="954 에콰도르">954 에콰도르</a></dd>
                            
                                <dd><a class="#btn" id="955" title="955 페루">955 페루</a></dd>
                            
                                <dd><a class="#btn" id="956" title="956 볼리비아">956 볼리비아</a></dd>
                            
                                <dd><a class="#btn" id="957" title="957 파라과이, 우루과이">957 파라과이, 우루과이</a></dd>
                            
                                <dd><a class="#btn" id="958" title="958 아르헨티나">958 아르헨티나</a></dd>
                            
                                <dd><a class="#btn" id="959" title="959 칠레">959 칠레</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="96" title="96 오세아니아">96 오세아니아</a></dt>
                            
                                <dd><a class="#btn" id="960" title="960 오세아니아">960 오세아니아</a></dd>
                            
                                <dd><a class="#btn" id="962" title="962 오스트레일리아(호주)">962 오스트레일리아(호주)</a></dd>
                            
                                <dd><a class="#btn" id="963" title="963 뉴질랜드">963 뉴질랜드</a></dd>
                            
                                <dd><a class="#btn" id="964" title="964 파푸아뉴기니">964 파푸아뉴기니</a></dd>
                            
                                <dd><a class="#btn" id="965" title="965 멜라네시아">965 멜라네시아</a></dd>
                            
                                <dd><a class="#btn" id="966" title="966 미크로네시아와 인접 국가">966 미크로네시아와 인접 국가</a></dd>
                            
                                <dd><a class="#btn" id="967" title="967 폴리네시아">967 폴리네시아</a></dd>
                            
                                <dd><a class="#btn" id="968" title="968 하와이">968 하와이</a></dd>
                            
                                <dd><a class="#btn" id="969" title="969 태평양제도">969 태평양제도</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="97" title="97 양극지방">97 양극지방</a></dt>
                            
                                <dd><a class="#btn" id="970" title="970 양극지방">970 양극지방</a></dd>
                            
                                <dd><a class="#btn" id="971" title="971 북극지방">971 북극지방</a></dd>
                            
                                <dd><a class="#btn" id="973" title="973 그린란드">973 그린란드</a></dd>
                            
                                <dd><a class="#btn" id="978" title="978 남극지방">978 남극지방</a></dd>
                            
                                <dd><a class="#btn" id="979" title="979 외계지역">979 외계지역</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="98" title="98 지리">98 지리</a></dt>
                            
                                <dd><a class="#btn" id="980" title="980 지리">980 지리</a></dd>
                            
                                <dd><a class="#btn" id="981" title="981 아시아지리">981 아시아지리</a></dd>
                            
                                <dd><a class="#btn" id="982" title="982 유럽지리">982 유럽지리</a></dd>
                            
                                <dd><a class="#btn" id="983" title="983 아프리카지리">983 아프리카지리</a></dd>
                            
                                <dd><a class="#btn" id="984" title="984 북아메리카지리">984 북아메리카지리</a></dd>
                            
                                <dd><a class="#btn" id="985" title="985 남아메리카지리">985 남아메리카지리</a></dd>
                            
                                <dd><a class="#btn" id="986" title="986 오세아니아지리">986 오세아니아지리</a></dd>
                            
                                <dd><a class="#btn" id="987" title="987 양극지리">987 양극지리</a></dd>
                            
                                <dd><a class="#btn" id="988" title="988 해양">988 해양</a></dd>
                            
                                <dd><a class="#btn" id="989" title="989 지도 및 지도책">989 지도 및 지도책</a></dd>
                            
                        </dl>
                    </td>
                
                    <td>
                        <dl>
                            <dt><a class="#btn" id="99" title="99 전기">99 전기</a></dt>
                            
                                <dd><a class="#btn" id="990" title="990 전기">990 전기</a></dd>
                            
                                <dd><a class="#btn" id="991" title="991 아시아">991 아시아</a></dd>
                            
                                <dd><a class="#btn" id="992" title="992 유럽">992 유럽</a></dd>
                            
                                <dd><a class="#btn" id="993" title="993 아프리카">993 아프리카</a></dd>
                            
                                <dd><a class="#btn" id="994" title="994 북아메리카">994 북아메리카</a></dd>
                            
                                <dd><a class="#btn" id="995" title="995 남아메리카">995 남아메리카</a></dd>
                            
                                <dd><a class="#btn" id="996" title="996 오세아니아">996 오세아니아</a></dd>
                            
                                <dd><a class="#btn" id="997" title="997 양극">997 양극</a></dd>
                            
                                <dd><a class="#btn" id="998" title="998 주제별전기">998 주제별전기</a></dd>
                            
                                <dd><a class="#btn" id="999" title="999 계보, 족보">999 계보, 족보</a></dd>
                            
                        </dl>
                    </td>
                </tr>
            </table> 
     
    </div>
</form>
<br><br>

<form id="searchResultForm" method="get" action="interestingbook">
<input type="hidden" name=category value=${category }/>
<input type="hidden" name=totaldata value=${totalData }/>
<table id=searchResultTable2 style="margin:auto;" >

 <c:choose> 
   	<c:when test="${not empty list }">
   	
  
		  <tr>
		    <th colspan="5" id="searchCaptionTh2">
		      <div style="text-align:center">
		        <div id="searchCaption22">
		            <p id="totalData">            
		             ${totalData }건  이 검색되었습니다.             
		             </p>
		        </div>
		  
		        <div class="selectForm3">
		       
		        <select id="searchNumber" title="검색건수" name="searchNumber">
		          <option value=10 ${searchNumber == 10? "selected":""}>10건</option>
		          <option value=20 ${searchNumber == 20? "selected":""}>20건</option>
		          <option value=30 ${searchNumber == 30? "selected":""}>30건</option>
		          <option value=40 ${searchNumber == 40? "selected":""}>40건</option>
		          <option value=50 ${searchNumber == 50? "selected":""}>50건</option>
		  
		        </select>
		        <button id="button44" type="button" onclick="fn_searchBook2(${kdcNo});" style="border:none;width:50px;height:40px;">확인</button>
		      </div>
		     </div>
		   </th>
		   </tr>
   
			    <tr>
			    <td colspan="5" >
			      <hr>
			    <td>
			   </tr> 
			   <tr>
				     <td colspan="1" id="searchTable2td">
				      <input type="checkbox" name="bookSelect" id="allCheck" onclick="selectAll(this)" value="all">
				      
				     </td>
				     <td colspan="4">
				       <button id="button22" type="submit"  >관심도서담기</button>
				     </td>
			   </tr>
			   <tr>
			     <td td colspan="5">
			      <hr>
			    </td>
			  </tr>
  </c:when>
 </c:choose>	     
   
    <c:choose> 
   	<c:when test="${not empty list }">
   		<c:forEach var="b" items="${list }">
  
		   <tr>
		      <td id="bookCheckTd" rowspan="2" >
		          <input type="checkbox" name="bookCheck" id="bookCheck" value="${b.isbnNo }"> 
		    
		      </td>
			    <td id="imgContainerDiv"  rowspan="2" >
			
			          
			            
			            <img id="totalSearchbookImg"  src="${b.bookImg }" alt="${b.bookName} " onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'"
			             style="cursor:pointer;">
			            
			    </td>
			    <td colspan="2">
			          <div id="bookInfoDiv3">
			            <dl class="authorData" id="bookTitleDl" >
			               <dd>
			                    
			                    <a href="#link"  onclick="location.href='${path}/searchpage/bookDetail.do?isbnNo=${b.isbnNo }'"
			                    style="cursor:pointer;"><c:out value="${b.bookName }"/></a>
			            
			                    </dd>
			            </dl>
			          </div>
			         
			
			      </td>
			      <td id="buttonWrapTd" rowspan="2">
			        <div class="buttonWrap">
			           <input type="button" id="button22" style="margin-right:10px;"  onclick="location.href='${path}/searchpage/bookReservation?isbnNo=${b.isbnNo}'" value="도서예약신청" >
			          <button id="button22" type="button" onclick="location.href='${path}/searchpage/interestingbook?isbnNo=${b.isbnNo}'"  >관심도서담기</button>
			          </div>
			      </td>
		    </tr>
		    <tr>
			     <td>
			
			     </td>
			     <td>
			      <div id="bookInfoDiv4">
			        <dl class="authorData2">
			           <dd>
			                
			                  
			                <span>저자 </span><br>
			                <span>발행자</span><br>                    
			                <span>발행연도</span> <br>                  
			                <span>ISBN</span><br>
			                 <span>분류번호</span><br>
			                 <span>위치번호</span>
			                                                       
			            
			                  </dd>
			        </dl>
			      </div>
			
			     </td>
			     <td>
			      <div id="bookInfoDiv3">
			        <dl class="authorData3">
			           <dd>
			                
			                  
			                <span><c:out value="${b.bookWriter }"/></span><br>
			                <span><c:out value="${b.bookCompany }"/></span><br>                    
			                <span><c:out value="${b.bookDate }"/></span><br>                            
			                <span><c:out value="${b.isbnNo }"/></span><br>
			                 <span><c:out value="${b.bookKdc }"/></span><br>
			                 <span><c:out value="${b.bookLocation }"/></span>
			                                                                    
			                  </dd>
			        </dl>
			      </div>
			     </td>
		     
			     <td>
			
			     </td>
		    </tr>
    
		    <tr>
		      <td colspan="5">
		         <hr>
		         
		      </td>
		    </tr>
      </c:forEach>
     </c:when>
   
  
   <c:otherwise>
   					<tr>
   					<td colspan="5"></td>
   					</tr>
   	</c:otherwise>  
   </c:choose>
    
   </table>
  </form>
  <c:choose> 
   	<c:when test="${not empty list }">
       <div id="pagebar-container" style="margin-left:25%;">
        	${pageBar }
        </div>
     </c:when>
   </c:choose>




</body>


</html>
<script>




 $(".ico").click(function(){
	 let images=document.getElementsByClassName("ico");
	 let id=$(this).attr("id");
	 
	 for(let i=0; i<images.length;i++){		 
		 if($(this).attr('id')== i ){			 
			 
			 $("#kdcDepth2List_"+i).show();			 
		 }else{
			 $("#kdcDepth2List_"+i).hide();
			 $("#nonsearch").hide();
		 }	 
	 }
 })	
 
 
  $(function(){
	     $("a[href='#btn']").attr("class","asearch");
	     $("a[class='#btn']").attr("class","asearch");
		 $("a[href='#btn']").removeAttr('href');
		 
		 $("a").attr("style","cursor:pointer");
		 $(".ico").attr("style","cursor:pointer");
		 		
	 
			 let images=document.getElementsByClassName("ico");
			 console.log($("input[name='totaldata']").attr('value')=='0/');
			 console.log("totaldata테스트"+$("input[name='totaldata']").attr('value') );
			 
			 
			  for(let i=0; i<images.length; i++){ 			
				   
				  /* $("#kdcDepth2List_"+i).hide();
					 $("#nonsearch").hide(); */
				  if($("input[name='totaldata']").attr('value')=='0/' && $("input[name='category']").attr('value').substring(0,1)==i){
		        	  console.log($("input[name='totaldata']").attr('value')=='0/');
		        	  $("#kdcDepth2List_"+i).show();
		        	 $("#nonsearch").show(); 
		        	 			 	        	 
				
			       } else if( $("#totaldata").text()!=null|| $("#totaldata").text()!='' && $("input[name='totaldata']").attr('value')!='0/'){					 
					  $("#kdcDepth2List_"+i).hide();
					
					 console.log("totaldata테스트"+$("input[name='totaldata']").attr('value') );					
					 
				   }
			          
			  } 	 
			 			 			
		 
        })
 
 $(function(){
   $(".asearch").click(function(){
	  let kdcNo=$(this).attr('id');	 
	   console.log("kdcNo테스트"+"kdcNo "+kdcNo+"kdcNo의 substring"+kdcNo.substring(0,1));
	  let category=kdcNo.substring(0,1);
	/*    let images=document.getElementsByClassName("ico");
	 for(let i=0; i<images.length;i++){		 		 
			 $("#kdcDepth2List_"+i).hide();		  
	 } */ 
	
	 
	  location.href="${path}/searchpage/kdcNoSearch?kdcNo="+kdcNo+"&category="+category;
   }) 
 
 })
 
 function fn_paging2(pageNo,totalData,numPerpage,kdcNo){
        	
        let totalData2=parseInt(totalData);
        let searchNumber=$("#searchNumber").val();
        	        	
        	      
        location.href="${path}/searchpage/kdcNoSearch?cPage="+pageNo+"&searchNumber="+numPerpage+"&kdcNo="+kdcNo;
        	
        	
       }
 
 function fn_searchBook2(kdcNo){
 	
     let searchNumber=$("#searchNumber").val();
 	
 	
 	      
 	location.href="${path}/searchpage/kdcNoSearch?kdcNo="+kdcNo+"&searchNumber="+searchNumber;
 	
 	
 } 
	
 function bookReservation(isbnNo){
		console.log(isbnNo);
		location.href="${path}/searchpage/bookReservation?isbnNo="+isbnNo;
		
	}

 function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('bookCheck');
		 
		  checkboxes.forEach((checkbox) => {
			  
			  checkbox.checked = selectAll.checked;
	    	    
		  })
	}


 $(function(){
		console.log(window.location.href );
		
		  
		  $(".list-group").children().eq(3).css({"backgroundColor" : "lightgrey"})
		  
			 	   
		})

</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
