import 'package:flutter/material.dart';

double? toolbarHeight;

final ValueNotifier<bool> isVisibleDancingArrow = ValueNotifier<bool>(true);

const List<Map<String, dynamic>> projectsData = [
  {
    'title': 'Personal Website (Flutter Web)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/MyWebSite/icon.png',
    'description':
        'This website is built using Flutter Web. It is a responsive website and is hosted on GitHub Pages. In development of this site, efforts have been made to provide the best web performance. The splash screen and background of site are develop by html,css,js.',
    'imgUrls': null,
    'rLink': 'https://github.com/ImanGhasemiArani/imanghasemiarani.github.io',
    'dLink': null,
  },
  {
    'title': 'Brain:Code (Flutter Mobile)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/icon.png',
    'description':
        'This application is a puzzle game developed with Flutter. And it is currently tested on Android. Camera, memory and accelerometer, gyroscope and vibration sensors are used in this program. Also, in this app, artificial intelligence of facial recognition has also been used. One of the important points of this application is the use of the concept of OOP and proper state managements. This app also has a small backend for checking updates, for which back4app is used. This app include Ads. This app is available on Myket Store.',
    'imgUrls': [
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/img%20(1).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/img%20(2).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/img%20(3).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/img%20(4).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/BrainCode/img%20(5).jpg',
    ],
    'rLink': 'https://github.com/ImanGhasemiArani/brain_code',
    'dLink': 'https://myket.ir/app/ghasemiarani.iman.braincode',
  },
  {
    'title': 'Dakke (Flutter)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/Dakke/icon.png',
    'description':
        'This application is a digital library and book market developed with Flutter. And it has the ability to output on Android, web and iOS. It has the ability to download the book and view and read it in the application reader. It can also be registered with mobile phone number (OTP). This app has a backend and a database. And it works perfectly with the server. The server of this app is currently down. Beautiful animations are also used in the design of this application.',
    'imgUrls': null,
    'rLink': 'https://github.com/orgs/Uni-Libro/repositories',
    'dLink': 'https://github.com/Uni-Libro/Client/releases/tag/v1.0.0-demo3',
  },
  {
    'title': 'IG Music (Flutter Mobile)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/IGMusic/icon.png',
    'description':
        'This is a mobile music player built using Flutter. This music player can play music from local storage, and work with playlists, show notification for control music, dark/light theme, supported 2 language(persian, english), feedback system(create github issue, send email,send to server). This music player have beautiful UI with more animations. This app is available on Myket Store.',
    'imgUrls': [
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/IGMusic/img%20(1).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/IGMusic/img%20(2).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/IGMusic/img%20(3).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/IGMusic/img%20(4).jpg',
    ],
    'rLink': 'https://github.com/ImanGhasemiArani/IGMusic',
    'dLink': 'https://myket.ir/app/arani.ghasemi.iman.ig_music',
  },
  {
    'title': 'InsShop (Flutter)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/icon.png',
    'description':
        'This application is an online shopping application with a similar design to Instagram, but with a kinder and friendlier  UI. Due to the use of OOP in the posts section, this software can display different types of posts, such as video, photo, and group posts that can be a combination of video and image. The explorer part has also been implemented. This app currently does not have a backend and is implemented using mock data. It has not yet reached the release stage, so repo is private.',
    'imgUrls': [
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/img%20(4).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/img%20(1).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/img%20(2).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/img%20(3).jpg',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/InsShop/img%20(5).jpg',
    ],
    'rLink': null,
    'dLink': null,
  },
  {
    'title': 'DigDug (Java Fx)',
    'iconUrl':
        'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/icon.png',
    'description': 'This is the DigDug game that developed with javaFx.',
    'imgUrls': [
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(1).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(2).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(3).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(4).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(5).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(6).png',
      'https://raw.githubusercontent.com/ImanGhasemiArani/websiteData/main/DigDug/img%20(7).png',
    ],
    'rLink': 'https://github.com/ImanGhasemiArani/DigDug-Game',
    'dLink': null,
  },
];
