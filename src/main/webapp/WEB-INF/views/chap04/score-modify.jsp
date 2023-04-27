<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <style>
        * {
            text-align: center;
        }

        h1 {
            font-weight: bold;
            font-family: '휴먼편지체';
            color: hotpink;
            font-size: 30px;
        }

        span {
            font-size: 50px;
            color: rgb(0, 7, 70);
        }

        li {
            list-style: none;
            margin: 0;
            padding: 0;
            font-size: 20px;
        }

        section.score-main {
            margin: 0 auto;
            margin-top: 150px;
            padding: 20px;
            border-radius: 10px;
            width: 40%;
            height: 30%;
            border: 3px dashed #4271f0;
            box-shadow: 1px 1px 3px 5px rgb(92, 146, 207);
        }

        button {
            width: 50px;
            height: 30px;

            margin: 0 auto;
            border: 2px solid #a30036;
            background: hotpink;

            font-size: 20px;
            font-family: '휴먼편지체';
            color: #ffffff;
        }
    </style>

</head>

<body>

    <div class="wrap">
        <section class="score-main">
            <h1>🎶<span>${s.stuName}님</span> 성적 정보 수정하기</h1>
            <form action="/score/modify" method="post">
                <input type="hidden" name="stuNum" value="${s.stuNum}">
                <ul>
                    <li># 국어: <input type="text" name="kor" value="${s.kor}"></li>
                    <li># 영어: <input type="text" name="eng" value="${s.eng}"></li>
                    <li># 수학: <input type="text" name="math" value="${s.math}"></li>
                </ul>
                <div class="btn-group">
                    <button type="submit">수정완료</button>
                    <button type="button" onclick="history.back()">이전으로</button>
                </div>
           </div>
            </form>
        </section>

    </div>
</body>

</html>