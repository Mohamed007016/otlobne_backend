<!DOCTYPE html>
<html>
<head>
  <base href="https://otlobne.com/public/shop/">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="Otlobne APP - تطبيق اطلبني اسرع و افضل تطبيق توصيل طلبات في الكويت">

  <!-- iOS meta tags & icons -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="otlobne APP">
  <link rel="apple-touch-icon" href="https://otlobne.com/public/shop/icons/Icon-192.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="https://otlobne.com/public/shop/favicon.png"/>

  <meta name="google-signin-client_id" content="1000163153346-48ckm2uf7h70hmgn74kg1gq02sval158.apps.googleusercontent.com">

  <script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>

  <title> اطلبني  </title>
  <link rel="manifest" href="https://otlobne.com/public/shop/manifest.json">
  <link rel="stylesheet" type="text/css" href="https://otlobne.com/public/shop/style.css">
</head>
<body>
  <!-- This script installs service_worker.js to provide PWA functionality to
       application. For more information, see:
       https://developers.google.com/web/fundamentals/primers/service-workers -->

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBzgIMl47KdBGguNcyfbo6KFEaWWu8twOU"></script>
<!--  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>-->

  <script>
    if ("serviceWorker" in navigator) {
      window.addEventListener("load", function () {
        navigator.serviceWorker.register("https://otlobne.com/public/shop/firebase-messaging-sw.js");
      });
      window.addEventListener('flutter-first-frame', function () {
        navigator.serviceWorker.register('https://otlobne.com/public/shop/flutter_service_worker.js?v=2574302691');
      });
    }
  </script>

  <script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js"></script>

  <div class="center">
    <img src="https://otlobne.com/public/shop/logo.png" alt = "logo" width="300px" />
    <br>
    <div class="loader" style="width:300px;text-align: center;"><div class="continuous-4"></div></div>
  </div>


  <script>
    var firebaseConfig = {
    apiKey: "AIzaSyC35I9Pt46EtPLEwIQvfgh6FJajhO0H6_Y",
    authDomain: "otlobne-app.firebaseapp.com",
    databaseURL: "https://otlobne-app-default-rtdb.firebaseio.com",
    projectId: "otlobne-app",
    storageBucket: "otlobne-app.appspot.com",
    messagingSenderId: "88149710408",
    appId: "1:88149710408:web:8379e2b5a1ddd1adddea7d",
    measurementId: "G-S5S1C1X44T"
    };
    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);
  </script>

  <script src="https://otlobne.com/public/shop/main.dart.js?version=2.1.0" type="application/javascript"></script>
</body>
</html>
