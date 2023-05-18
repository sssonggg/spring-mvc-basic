<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="common.css">
  <link rel="stylesheet" href="../../../../resources/static/assets/css/offer-top50.css">
  <title>지도 마커 생성하기</title>

</head>

<body>
  <!-- <section class="offer-wrapper">
   
    offer header -->
        <div class="header-title-wrapper">
            <div class="title-wrapper">
                <div class="offer-main-title">추천 정보</div>
                <div class="offer-sub-title">보다 행복한 산행이 되시도록 산행길과 맛집을 추천해드려요.</div>
             </div>   
            <div class="offer-category-select">
                <ul class="category">
                    <li id="offern1"><a href="offer-menu.html">이달의 산행 추천</a></li>
                    <li id="offern2"><a href="offer-restaurant.html">코스별 맛집 추천</a></li>
                    <li id="offern3"><a href="/map/kakao-map">50대 명산 추천</a></li>
                </ul>
            </div>
        </div>   
        <main>
            <div class="container">
<!-- 한국의 10대 명산 추천 -->
<div class="offer-course-top50">
  <!-- 지도 html -->
  <div id="map" style="width:500px;height:800px;"></div>
  <p>
    <button onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button>
    <button onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보 보기</button>
    <button onclick="setOverlayMapTypeId('terrain')">지형정보 보기</button>
    <button onclick="setOverlayMapTypeId('use_district')">지적편집도 보기</button>
  </p>
</div>
</div>
</main>
</section>
  <!-- Kakao Map API Key -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1934691a196583ecb3ee1dbcc2acf9cc">
  </script>

  <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = {
        center: new kakao.maps.LatLng(36.076389, 127.526944), // 지도의 중심좌표(주왕산)
        level: 13 // 지도의 확대 레벨
      };

    // 한국 10대 명산 좌표
    var mountains = [{
        name: '한라산',
        latlng: new kakao.maps.LatLng(33.361666, 126.521944)
      },
      {
        name: '설악산',
        latlng: new kakao.maps.LatLng(38.119444, 128.465833)
      },
      {
        name: '지리산',
        latlng: new kakao.maps.LatLng(35.352778, 127.766944)
      },
      {
        name: '북한산',
        latlng: new kakao.maps.LatLng(37.698611, 127.0775)
      },
      {
        name: '도봉산',
        latlng: new kakao.maps.LatLng(37.698056, 127.018333)
      },
      {
        name: '내장산',
        latlng: new kakao.maps.LatLng(35.381111, 127.278056)
      },
      {
        name: '주왕산',
        latlng: new kakao.maps.LatLng(36.076389, 127.526944)
      },
      {
        name: '계룡산',
        latlng: new kakao.maps.LatLng(36.4375, 127.294722)
      },
      {
        name: '무등산',
        latlng: new kakao.maps.LatLng(35.056389, 127.614167)
      },
      {
        name: '속리산',
        latlng: new kakao.maps.LatLng(36.136667, 128.354722)
      }
    ];

    // 지도 생성 및 마커표시
    var map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = 'https://cdn-icons-png.flaticon.com/128/5695/5695633.png', // 마커이미지의 주소  
        imageSize = new kakao.maps.Size(50, 54), // 마커이미지의 크기
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션
      
    // 마커이미지를 생성
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); 

       
    for (var i = 0; i < mountains.length; i++) {
        var marker = new kakao.maps.Marker({
          position: mountains[i].latlng,
          map: map,
          title: mountains[i].name,
          image: markerImage // 마커이미지 설정 
        });
        marker.setMap(map);

        
    //     (function(marker, mountains) {
    //   // 마크 클릭 시
    //   kakao.maps.event.addListener(marker, 'click', function() {
    //     var overlay = new kakao.maps.CustomOverlay({
    //       // 오버레이에 띄울 내용
    //       content: '<div class="wrap">' +
    //             '    <div class="info">' +
    //             '        <div class="title">' +
    //             mountains.title +
    //             '        </div>' +
    //             '        <div class="body">' +
    //             '            <div class="desc">' +
    //             '                <div class="ellipsis">' + mountains.name + '</div>' +
    //             '		       <div class="jibun ellipsis">' + mountains.name + '</div>' +
    //             '            </div>' +
    //             '        </div>' +
    //             '    </div>' +
    //             '</div>',
    //       map: map,
    //       position: marker.getPosition()
    //     });
    //     // 아무데나 클릭하게되면 overlay를 끄기
    //     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    //       overlay.setMap(null)
    //     })
    //     console.log(overlay);
    //     overlay.setMap(map);
    //   })
    // })(marker, positions[i])



        // // 커스텀 오버레이에 표출될 내용
        // var content = '<div class="customoverlay">' +
        //     '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
        //   '    <span class="marker-title">한라산</span>' +
        //   '  </a>' +
        //   '</div>';

        // // 커스텀 오버레이가 표시
        // var position = new kakao.maps.LatLng(37.54699, 127.09598);  

        // // 커스텀 오버레이를 생성
        // var customOverlay = new kakao.maps.CustomOverlay({
        //     map: map,
        //     position: position,
        //     content: content,
        //     yAnchor: 1 
        // });

    // 여러 지도 타입 제공
    // 지도에 추가된 지도타입정보
    var currentTypeId;

    function setOverlayMapTypeId(maptype) {
      var changeMaptype;

      if (maptype === 'traffic') {

        // 교통정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.TRAFFIC;

      } else if (maptype === 'roadview') {

        // 로드뷰 도로정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.ROADVIEW;

      } else if (maptype === 'terrain') {

        // 지형정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.TERRAIN;

      } else if (maptype === 'use_district') {

        // 지적편집도 지도타입
        changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;
      }

      // 이미 등록된 지도 타입이 있으면 제거합니다
      if (currentTypeId) {
        map.removeOverlayMapTypeId(currentTypeId);
      }

      // maptype에 해당하는 지도타입을 지도에 추가합니다
      map.addOverlayMapTypeId(changeMaptype);

      // 지도에 추가된 타입정보를 갱신합니다
      currentTypeId = changeMaptype;
    }
    }


  </script>
</body>
</html>