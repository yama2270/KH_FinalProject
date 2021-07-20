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
            <span class="navbar-brand mb-0 h1">로그인</span>
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

        <div id="login-container">
            <div id="login-input">
            <form action="${path }/member/memberLoginCheck.do" method="post">
                <input type="text" name="userId" class="login-input" placeholder="아이디 입력"><br>
                <input type="password" name="userPassword" class="login-input" placeholder="비밀번호 입력">
                <input type="submit" value="로그인" class="login-btn">
            </form>
                <div class="login-member"> 
                    <a class="memberBtn" href="">아이디 찾기</a>
                    <a class="memberBtn" href="">비밀번호 찾기</a>
                    <a class="memberBtn" href="">회원가입</a>
                </div>
            
            </div>
        </div>
    
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

    #login-container{
        display:flex;
        align-items:center;
        flex-direction:row;
        justify-content:center;
    }
    
    #login-input{
        margin-top:70px;
    }

    .login-input{
        margin:5px;
        padding-right:70px;
    }

    .login-btn{
        background-color:rgba(227, 242, 253);
        border: 1px solid rgba(227, 242, 253);
    }
    .login-member{
        padding-right:80px;
    }
    .memberBtn{
        display: inline-block !important;
        width: 150px;
        text-align: center;
        text-decoration: none;
        color:black;
        margin-top:20px;
        padding-right:40px;
    }
    </style>

    </html>