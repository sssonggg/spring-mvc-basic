<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


 .form-container {
            width: 500px;
            height: 600px;
            margin: auto;
            padding: 20px;
            /* background: url("https://pbs.twimg.com/media/EbSKBtIUMAA47Eq?format=jpg&name=small") no-repeat 100% 100% / 100% 100%; */
            background: linear-gradient(rgb(255, 192, 252), skyBlue, deepSkyBlue);
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
        .content #content {
            font-size: 18px;
            width: 100%;
            /* height: 300px; */
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
          <h1>🍬 ${b.boardNo} 번 게시물 🍬</h1>
          <h2> # 작성일자 : ${b.date} </h2>
          <div>
              <label for="title">제목 </label>
              <input type="text" id="title" name="title" value="${b.title}" readonly>
          </div>
      </section>

      <section class="content">
          <div>
              <label for="content">내용 </label>
              <div id="content" name="content">${b.content}</div>
          </div>
          <div class="buttons">
              <button class="list-btn" type="button" onclick="window.location.href='/board/list'">목록으로</button>
          </div>
      </section>

</body>
</html>