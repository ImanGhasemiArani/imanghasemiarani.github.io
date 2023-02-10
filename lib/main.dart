import 'package:flutter/material.dart';

import 'routes.dart';
import 'website_theme_data.dart';

void main() {
  runApp(const MySite(initRoute: '/home'));
}

class MySite extends StatelessWidget {
  const MySite({super.key, this.initRoute});

  final String? initRoute;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Iman Ghasemi Arani',
        initialRoute: initRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        theme: WebSiteThemeData.darkThemeData,
        scrollBehavior: ScrollConfiguration.of(context)
            .copyWith(overscroll: false, scrollbars: false),
      );
    });
  }
}
