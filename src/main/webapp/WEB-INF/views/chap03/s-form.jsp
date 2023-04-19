<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>

    <div class="wrap">
        <h1> 🎵 로그인하기 🎵</h1>

        <div class="login">
            <form action="/hw/s-login-check" method="post">
                <label>
                    # 아이디 :
                    <input id="id" type="text" name="id">
                </label><br>
                <label>
                    # 비밀번호 :
                    <input id="pw" type="text" name="pw">
                </label><br>
                <button type="submit">로그인</button>
            </form>
        </div>
    </div>
</body>

</html>