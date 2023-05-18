<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .container{
            margin: 30px 30px 0 0;
        }
        .upload-box{
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
            border: 3px dashed rgb(146, 146, 146);
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: rgb(68, 68, 68);
            font-weight: 700;
            cursor: pointer;
        }
        button {
            width: 50px;
            display: block;
            margin-left: 50px;
            color: #fff;
            background: #da7a7a;
            border: none;
        }

        #img-input{
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
    <h1>파일 업로드 예제</h1>
    <div class="upload-box">💌 파일 첨부</div>
    <form action="/upload-file" method="post" enctype="multipart/form-data">
        <input id="img-input" type="file" name="thumbnail" accept="image/*" multiple>
        <button type="submit"> 전송</button>
    </form>
    </div>
    <script>
        const $box = document.querySelector('.upload-box');
        const $input = document.getElementById('img-input');
        $box.onclick = e => {
            $input.click();
        };
    </script>
</body>
</html>