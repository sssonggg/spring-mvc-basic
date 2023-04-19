<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <h1> 🔎 로그인 결과 🔎</h1>
    <h2 class="result-title"></h2>
    <a href="/hw/s-login-form">☕ 다시 로그인하기</a>
    <script>
        let result = '${result}';
        console.log(result);

        const $h2 = document.querySelector('.result-title');
        switch (result) {
            case 'f-id':
                $h2.textContent = '==== 🙄아이디가 존재하지 않습니다.';
                break;
            case 'f-pw':
                $h2.textContent = '==== 😥 비밀번호가 틀렸습니다.';
                break;
            case 'success':
                $h2.textContent = ' ==== 🎈 로그인 성공.';
                break;
        }
    </script>
</body>

</html>