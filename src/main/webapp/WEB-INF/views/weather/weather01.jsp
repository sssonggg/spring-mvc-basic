<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
     <title>Weather App</title>
     <link rel="stylesheet" href="/assets/css/style.css">
     <script src="https://kit.fontawesome.com/f92514905c.js" crossorigin="anonymous"></script>
    <title>오늘의 날씨</title>

</head>

<body>
    <div class="weather-container">
        <div class="weather-info">
          <div class="icon-container">
            <div class="CurrIcon"></div>
          </div>
          <h1 class="City"></h1>
          <p class="TodayWeather"></p>
          <div class="temp-container">
            <p class="CurrTemp"></p>
            <p class="MinTemp"></p>
            <p class="MaxTemp"></p>
          </div>
          <p class="Wind"></p>
          <p class="Humidity"></p>
          <p class="Clouds"></p>
        </div>
      </div>

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

  <!-- https://fontawesome.com/start 가입후 CDN 넣으면 됨 -->
  <script src="https://kit.fontawesome.com/f92514905c.js" crossorigin="anonymous"></script>

   <script type="text/javascript">


        $(document).ready(function() {
          let weatherIcon = {
            '01' : 'fas fa-sun',
            '02' : 'fas fa-cloud-sun',
            '03' : 'fas fa-cloud',
            '04' : 'fas fa-cloud-meatball',
            '09' : 'fas fa-cloud-sun-rain',
            '10' : 'fas fa-cloud-showers-heavy',
            '11' : 'fas fa-poo-storm',
            '13' : 'far fa-snowflake',
            '50' : 'fas fa-smog'
          };

        $.ajax({
        url:'https://api.openweathermap.org/data/2.5/weather?q=seoul+&appid=92091da86d5cc4920d435f2230554b8c',

        dataType:'json',
        type:'GET',
        success:function(data){
          var $city = data.name;
          var $Icon = (data.weather[0].icon).substr(0,2);
          var $TodayWeather = data.weather[0].description;
          var $Temp ='현재온도 : '+( Math.floor(data.main.temp)- 273) + 'º';
          var $MinTemp ='최저온도 : '+( Math.floor(data.main.temp_min)- 273) + 'º';
          var $MaxTemp ='최대온도 : '+( Math.floor(data.main.temp_max)- 273) + 'º';
          var $WindSpeed = '바람 : '+Math.floor(data.wind.speed);
          var $Humidity = '현재습도 : '+Math.floor(data.main.humidity)+'%';
          var $Clouds = '구름 : '+data.clouds.all+'m/s WSW';

          $('.City').append($city);
          $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
          $('.TodayWeather').append($TodayWeather);
          $('.CurrTemp').prepend($Temp);
          //$('.MinTemp').prepend($MinTemp);
          //$('.MaxTemp').prepend($MaxTemp);
          $('.Wind').prepend($WindSpeed);
          $('.Humidity').prepend($Humidity);
          $('.Clouds').prepend($Clouds);
          }
        })
        });
      </script>



</body>
</html>