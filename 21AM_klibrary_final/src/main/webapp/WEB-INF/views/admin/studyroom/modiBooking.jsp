<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
    <title>열람실 예약 수정</title>
</head>
<body width="500px;">
    
    <div id="modiWrap">
        <div id="moTitle">열람실 예약수정</div>
        <table id="studyTab">
            <tr>
                <td>열람실</td>
                <td>
                <select id="selRoom">
                    <option value="열람실A">열람실A</option>
                    <option value="열람실B">열람실B</option>    
                    <option value="열람실C">열람실C</option>    
                    <option value="열람실D">열람실D</option>        
                </select>
            </td>
            </tr>
            <tr>
                <td>좌석</td>
                <td>
                    <select id="selSeat">
                        <option value="A1">A1</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>시작시간</td>
                <td>
                    <select id="selStart">
                        <option value="A1">A1</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>종료시간</td>
                <td>
                    <select id="selEnd">
                        <option value="A1">A1</option>
                    </select>
                </td>
            </tr>
        </table>
        <div id="moBtnWrap">
            <input type="submit" name="conModi" onclick="javascript:alert('수정');" value="수정">
            <input type="button" name="conExit" onclick="javascript:alert('닫기');" value="닫기"> 
        </div>
    </div>

</body>
</html>

<style>

    #moTitle {
        margin-top : 30px;
        margin-bottom : 20px;
        text-align : center;
        font-size : 35px;
    }

    #studyTab {
        margin : auto;
        border : 5px #dcdcdc solid;
        border-collapse: collapse;
        
        width : 480px;
        height : 300px;
    }

    #studyTab td {
        font-size : 15px;
    }

    #studyTab tr td:first-of-type {
        border-right : 2px white solid;
        text-align : center;
        width : 200px;
    }

    #studyTab tr td:last-of-type {
        text-align : left;
    }

    #studyTab tr td:last-of-type select {
        margin-left : 80px;
        font-size : 15px;
        height:22px;
    }

    #moBtnWrap {
        margin-top : 10px;
        text-align:center;
    }

    #moBtnWrap input{
        font-size : 15px;
        height : 25px;
    }

</style>

<script>

    // 예약된 좌석에 따라 열람실 좌석 생성
    

    // 열람실 선택 
    $("#selRoom").on("input",(e)=>{
        
    });

</script>