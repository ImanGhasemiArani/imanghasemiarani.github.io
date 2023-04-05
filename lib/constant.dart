import 'package:flutter/material.dart';

double? toolbarHeight;

final ValueNotifier<bool> isVisibleDancingArrow = ValueNotifier<bool>(true);

const List<Map<String, dynamic>> projectsData = [
  {
    'iconUrl':
        'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    'title': 'Personal Website (Flutter Web)',
    'description':
        'This website is built using Flutter Web. It is a responsive website and is hosted on Firebase.',
    'imgUrls': null,
    'rLink': '',
    'dLink': null,
  },
  {
    'iconUrl':
        'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    'title': 'Brain:Code (Flutter Mobile)',
    'description':
        'This is a mobile application built using Flutter. It is a responsive website and is hosted on Firebase.',
    'imgUrls': [
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    ],
    'rLink': '',
    'dLink': '',
  },
  {
    'iconUrl':
        'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    'title': 'Dakke (Flutter Mobile)',
    'description': 'This is a mobile application built using Flutter.',
    'imgUrls': [
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    ],
    'rLink': '',
    'dLink': '',
  },
  {
    'iconUrl': null,
    'title': 'IG Music (Flutter Mobile)',
    'description': 'This is a mobile application built using Flutter.',
    'imgUrls': [
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
      'https://d.newsweek.com/en/full/2151074/stock-image-shocked-cat.webp?w=790&f=8d422d28be66a0132a90da7ac2d23e69',
    ],
    'rLink': '',
    'dLink': '',
  },
];
