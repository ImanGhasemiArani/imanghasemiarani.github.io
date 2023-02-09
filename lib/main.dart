import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'routes.dart';
import 'website_theme_data.dart';

void main() {
//   GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MySite());
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
      );
    });
  }
}
