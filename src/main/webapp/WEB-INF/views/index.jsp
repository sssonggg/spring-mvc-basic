<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ include file="include/static-head.jsp" %>
    <style>
        #main-title {
            width: 40%;
            margin: 200px auto;
            text-align: center;
            font-family: 'Terminal';
            font-size: 40px;
            font-weight: 700;
            color: #566080;
        }
    </style>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <h1 id="main-title">
    <!-- 문법은 자바의 session.getAttribute("login")과 같고, sessionScope.login는 DTO임.  -->
    <c:if test="${sessionScope.login == null}">    
        Hello, Stranger!🤴🏻
    </c:if>
    <c:if test="${sessionScope.login != null}">    
        Hello, ${sessionScope.login.nickName}!👼🏻
    </c:if>
    </h1>


    <script>
        console.log('flag: ${flag}');
    </script>
</body>
</html>