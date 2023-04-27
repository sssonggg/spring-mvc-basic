<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    * {
        text-align: center;
    }

    div {
        margin: 0 auto;
        margin-top: 150px;
        padding: 20px;
        border-radius: 10px;
        width: 40%;
        height: 30%;
        border: 3px dashed #4271f0;
        box-shadow: 1px 1px 3px 5px rgb(92, 146, 207);
    }

    h1 {
        font-family: '휴먼편지체';
        color: hotpink;
    }

    span {
        font-size: 50px;
        color: rgb(0, 7, 70);
    }

    ul li {
        margin-left: 80px;
        padding: 10px;
        text-align: left;
        list-style: none;
        font-size: 20px;
        font-family: '나눔고딕';
        color: rgb(0, 0, 0);
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

<body>
    <div>
        <h1><span>🥇${s.stuName} </span>님의 성적정보</h1>
        <ul class="student-inform">
            <li> # 국어 : ${s.kor} 점</li>
            <li> # 영어 : ${s.eng} 점</li>
            <li> # 수학 : ${s.math} 점</li>
            <li> # 총점 : ${s.total} 점</li>
            <li> # 평균 : ${s.average} 점</li>
            <li> # 학점 :🔫 ${s.grade} 🔫</li>
        </ul>
        <button id="go-list">목록</button>
        <button id="go-modify">수정</button>
    </div>
</body>
<script>
    const $menuBtn = document.getElementById('go-list');
    $menuBtn.onclick = e => {
        window.location.href = '/score/list'; // GET요청
    };

    const $modifyBtn = document.getElementById('go-modify');
    $modifyBtn.onclick = e => {
        window.location.href = '/score/modify?stuNum=${s.stuNum}';
    };


    //     const $student = document.getElementById('.student-inform');
    // if (stuNum.kor === 100 || stuNum.eng === 100 ||stuNum.math === 100) {
    //   student.style.backgroundColor = 'yellow';
    // }
</script>

</html>