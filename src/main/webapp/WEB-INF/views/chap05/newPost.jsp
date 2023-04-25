<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 글쓰기</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Adamina&display=swap" rel="stylesheet">

<!-- reset -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<!-- fontawesome css: https://fontawesome.com -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<link rel="stylesheet" href="/assets/css/main.css">

<style>


 .form-container {
            width: 500px;
            height: 800px;
            margin: auto;
            padding: 20px;
            background: url("https://pbs.twimg.com/media/EbSKBtIUMAA47Eq?format=jpg&name=small") no-repeat 100% 100% / 100% 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            font-size: 18px;
        }
.form-container h1 {
            font-size: 40px;
            font-weight: 700;
            letter-spacing: 10px;
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-family: "Adamina";
            font-weight: bold;
            font-size: 25px;
        }
        input[type="text"],
        textarea {
            font-size: 18px;
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 2px solid #ffffff;
            border-radius: 8px;
            margin: 20px 0;
            background-color: rgba(255, 255, 255, 0.8);
        }
        textarea {
            resize: none;
            height: 400px;
        }
        .buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        button {
            font-family: "Adamina";
            font-size: 20px;
            padding: 10px 20px;
            border: 3px solid #ffffff;
            margin-right: 10px;
            background-color: #2e6aaf;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }
        button.list-btn {
            background: #d14394;
        }
        button:hover {
            background-color: #6697ff;
        }
        button.list-btn:hover {
            background: #ff8ed993;
        }

</style>
</head>
<body>
    
  <div id="wrap" class="form-container">
    <section class="title">
        <form action="/board/write" method="post"></form>
        <h1>✍🏻 MBTI 게시판 글쓰기</h1>
        <div>
            <label for="title">제목 </label>
            <input type="text" id="title" name="title" required>
        </div>
    </section>

    <section class="content">
        <div>
            <label for="content">내용 </label>
            <textarea id="content" name="content" maxlength="200" required></textarea>
        </div>
        <div class="buttons">
            <button class="list-btn" type="button" onclick="window.location.href='/board/list'">목록으로</button>
            <button type="submit">등록하기</button>
         </div>
    </section>
        </from>
    </div>
    </body>
  </div>

</body>
</html>