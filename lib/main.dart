import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'init_base_services.dart';
import 'assets/strs.dart';
import 'screens/screen_splash.dart';
import 'services/service_locator.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     // statusBarIconBrightness: Brightness.light,
//   ));
  await initBaseServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        title: Strs.appTitle.tr,
        home: const ScreenApp(),
      );
    });
  }
}

class ScreenApp extends StatelessWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder(
      future: setupServices(),
      builder: (context, snapshot) {
        return const ScreenSplash();
      },
    );
  }
}

class Themes {
  Themes._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: LocalizationService.fontFamily,
    // textTheme: const TextTheme().copyWith(
    //   button: const TextStyle().copyWith(
    //     // fontFamily: LocalizationService.fontFamily,
    //   ),
    // ),
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      color: const Color(0xffFFFFFF),
      surfaceTintColor: const Color(0xffFFFFFF),
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 20,
          cornerSmoothing: 1,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff00AFCE),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffF4FAFA),
    colorScheme: const ColorScheme.light().copyWith(
      background: const Color(0xffF4FAFA),
      onBackground: const Color(0xff353334),
      surface: const Color(0xffFFFFFF),
      onSurface: const Color(0xff353334),
      primary: const Color(0xffF38138),
      secondary: const Color(0xff00AFCE),
      tertiary: const Color(0xff008001),
      errorContainer: const Color(0xFFF44336).withOpacity(0.5),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: LocalizationService.fontFamily,
    // textTheme: const TextTheme().copyWith(
    //   button: const TextStyle().copyWith(
    //     fontFamily: LocalizationService.fontFamily,
    //   ),
    // ),
    appBarTheme: const AppBarTheme().copyWith(
      color: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      color: const Color(0xffFAFAFA),
      surfaceTintColor: const Color(0xffFAFAFA),
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 20,
          cornerSmoothing: 1,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff00AFCE),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff18169F),
    colorScheme: const ColorScheme.dark().copyWith(
      background: const Color(0xff18169F),
      onBackground: const Color(0xffFAFAFA),
      surface: const Color(0xffFAFAFA),
      onSurface: const Color(0xff16202A),
      primary: const Color(0xff95CEC8),
      secondary: const Color(0xff00AFCE),
      tertiary: const Color(0xff008001),
      errorContainer: const Color(0xFFF44336).withOpacity(0.5),
    ),
  );
}
