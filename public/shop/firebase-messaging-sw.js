importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyC35I9Pt46EtPLEwIQvfgh6FJajhO0H6_Y",
  authDomain: "otlobne-app.firebaseapp.com",
  databaseURL: "https://otlobne-app-default-rtdb.firebaseio.com",
  projectId: "otlobne-app",
  storageBucket: "otlobne-app.appspot.com",
  messagingSenderId: "88149710408",
  appId: "1:88149710408:web:8379e2b5a1ddd1adddea7d",
  measurementId: "G-S5S1C1X44T"
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});