<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>   
<link rel="stylesheet" href="${path }/resources/css/dg.css" type="text/css"> 

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>login</title>
  </head>
    <body>
    <header>
        <div id="header">
            <div id="logo">
                <a href="" class="header_a">logo</a>
            </div>

            <div id="header_top">
                <ul id="header_ul">
                    <li>
                        <a href="" class="header_a">로그인</a>
                    </li>
                    <li>
                        <a href=""  class="header_a">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>

        <div id="nav">
            <ul id="main-menu">
                <li><a href="">자료검색</a></li>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                <li><a href="">열람실</a>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                </li>
                <li><a href="">이용안내</a>
                  <ul id="sub-menu">
                    <li><a href="#" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="#" aria-label="subemnu">뭐넣지</a></li>
                  </ul>
                </li>
                <li><a href="">마이페이지</a>
                  <ul id="sub-menu">
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>
                    <li><a href="" aria-label="subemnu">뭐넣지</a></li>                    
                  </ul>
              </ul>
        </div>
    </header> 

    <hr>
    <div id="login-nav">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">회원가입</span>
            </div>
        </nav>
    </div>
    
    <div id=login-content>
        <div id="login-group">
            <ul class="list-group">
                <li class="list-group-item active" aria-current="true">회원정보</li>
                <li class="list-group-item"><a href="">로그인</a></li>
                <li class="list-group-item"><a href="">아이디 찾기</a></li>
                <li class="list-group-item"><a href="">비밀번호 재발급</a></li>
                <li class="list-group-item"><a href="">회원가입</a></li>
            </ul>
        </div>
        <section>
            <div class="container-regiester">
                  <form action="${path }/member/memberEnrollEnd.do" method="post" id="memberForm" name="memberEnrollFrm" >
                  <div class="wrapper-regiester">
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>아이디</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" class="regiester-form" maxlength="20" id="userId" name="userId">
                      <input type="hidden" id="memberPwYn" name="memberPwYn">
                      <input type="button" class="regiester-btn-frame basic" value="중복확인" onclick="">
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="password" name="userPassword" id="userPassword" class="regiester-form" maxlength="20">
                        <p class="regiester-guide">(영문자/숫자 중 2가지 이상 조합, 8자~20자)</p>
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>비밀번호 확인</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="password" name="userPasswordCheck" id="userPasswordCheck" class="regiester-form" maxlength="20">
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이름</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" name="userName" id="userName" class="regiester-form" >
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>이메일</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <input type="email" name="email" id="email" class="regiester-email regiester-form">
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>생년월일</label>
                        <p class="mark-required">*</p>
                      </div>
                      <input type="text" name="birthDate" id="birthDate" class="regiester-form" >
                    </div>
                    <div class="regiester-container-no-margin">
                      <div class="container-label">
                        <label>주소</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>
                        <!-- <div class="regiester-container-address">
                          <input type="text" name="memberPostNo" id="memberPostNo" class="postal-code regiester-form" maxlength="6">
                          <button type="button" class="regiester-btn-frame basic" onclick="">우편번호</button>
                        </div> -->
                        <div class="regiester-container-address">
                          <input type="text" name="address" id="address" class="regiester-form address">
                          <p class="guide">기본 주소</p>
                        </div>
                        <!-- <div class="regiester-container-no-margin">
                          <input type="text" name="memberAddressEnd" id="memberAddressEnd" class="regiester-form address">
                          <p class="guide">나머지 주소</p>
                          <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
                        </div> -->
                      </div>
                    </div>
                    <div class="regiester-container">
                      <div class="container-label">
                        <label>휴대폰 번호</label>
                        <p class="mark-required">*</p>
                      </div>
                      <div>                      
                        <input type="text" class="regiester-phone" id="phone" name="phone">
                      </div>
                    </div>
                  </div>   
                  <div class="regiester-container-button">
                    <input type="submit" class="regiester-btn-frame primary" value="회원가입">
                    <input type="reset" class="regiester-btn-frame basic" value="취소">
                  </div>
                  </form>
                </div>
              </div>
          </section>
    
    <!-- As a heading -->
    
    



    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    </body>
    <style>
      
        #header_ul{
            list-style:none;
            float:right;
        }
        #header_ul>li{
            float:left;
            padding-right:20px;
        }
        .header_a{
            text-decoration:none;
            color:black;
        }
        #header_top{
            padding:10px;
            width:60%;
            float:left;
        }
        
        #logo{
            padding:50px;
            padding-left:100px;
            width:30%;
            float:left;
        }
        #nav{
        clear:left;
      }

      #main-menu{
        display:table;
        list-style:none;
        margin-left:auto;
        margin-right:auto;
      }
      #main-menu > li {
        float: left;
        position: relative;
        margin:100px;
      }

    #main-menu > li > a {
        font-size: 40px;
        color: black;
        text-align: left;
        text-decoration: none;
        display: block;
      }

    #sub-menu {
        position: absolute;
        opacity: 0;
        visibility: hidden;
        transition: all 0.15s ease-in;
        z-index:10000;
      }

    #sub-menu > li >  a {
        color: black;
        text-decoration: none;
        font-size:20px;
      }

    #main-menu > li:hover #sub-menu {
        opacity: 1;
        visibility: visible;
      }

    #sub-menu > li >  a:hover {
        text-decoration: underline;
      }
    #login-group{
        float:left;
        width:20%;
        
    }
    .list-group>li>a{
        text-decoration:none;
        color:black;
    }
    
    .active{
        text-align:center;
    }

    #login-group{
        margin:20px;
    }

    #login-nav{
        margin:20px;
    }

    #login-content{
        float:center;
    }

    .container-regiester {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 50px;
  margin-bottom: 50px;
}

.wrapper-regiester {
  border-bottom: 2px solid rgba(227, 242, 253);
  padding: 25px 40px;
  margin-bottom: 30px;
}

.container-label {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 200px;
}

.regiester-form.address {
  width: 300px;
  margin-right: 5px;
}

.regiester-phone {
  width: 150px;
  height: 30px;
}


.regiester-email {
  width: 250px;
}

.regiester-container-button {
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.title-regiester {
	width:1000px;
 	height: 200px;
}

.title-regiester>p {
	width:900px;
	margin: auto;
 	font-size: 35px;
 	line-height:200px;
 	text-align: center;
}

.subtitle-regiester {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 15px;
}

.subtitle-regiester p {
  font-size: 14px;
}

.mark-required {
  color: rgb(237, 48, 14);
}

.regiester-container {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.regiester-container-address {
  display: flex;
  align-items: center;
  margin-bottom: 5px;
}

.regiester-form {
  height: 30px;
  margin: 5px;
}

.regiester-container-no-margin {
  display: flex;
  align-items: center;
}

.regiester-guide {
  font-size: 11px;
  color: gray;
}

.regiester-btn-frame {
  height: 30px;
  padding: 4px 16px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.regiester-btn-frame.basic {
  color: gray;
  background-color: rgba(227, 242, 253);
}

.regiester-btn-frame.basic:hover {
  background-color: rgba(227, 242, 253);
}

.regiester-btn-frame.primary {
  color: gray;
  background-color: rgba(227, 242, 253);
}

.regiester-btn-frame.primary:hover {
  background-color: rgba(227, 242, 253);
}

.postal-code {
  width: 56px;
  margin-right: 5px;
}

   
    </style>

    </html>