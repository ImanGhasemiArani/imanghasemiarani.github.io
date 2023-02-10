import 'package:flutter/material.dart';

import 'constant.dart';
import 'layouts/adaptive.dart';
import 'pages/contact.dart' deferred as contact_page;
import 'pages/home.dart' deferred as home_page;
import 'pages/work.dart' deferred as work_page;
import 'pages/education.dart' deferred as education_page;
import 'pages/root.dart';
import 'widgets/deferred_widget.dart';
import 'widgets/nav_bar.dart';

String currentPage = '/';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

class Path {
  const Path(this.pattern, this.builder, {this.openInSecondScreen = false});

  final String pattern;
  final PathWidgetBuilder builder;
  final bool openInSecondScreen;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' '/work' r'$',
      (context, match) => createPage(
        context,
        DeferredWidget(
          work_page.loadLibrary,
          () => work_page.WorkPage(),
        ),
      ),
    ),
    Path(
      r'^' '/education' r'$',
      (context, match) => createPage(
        context,
        DeferredWidget(
          education_page.loadLibrary,
          () => education_page.EducationPage(),
        ),
      ),
    ),
    Path(
      r'^' '/contact' r'$',
      (context, match) => createPage(
        context,
        DeferredWidget(
          contact_page.loadLibrary,
          () => contact_page.ContactPage(),
        ),
      ),
    ),
    Path(
      r'^' '/home' r'$',
      (context, match) => createPage(
        context,
        DeferredWidget(
          home_page.loadLibrary,
          () => home_page.HomePage(),
        ),
      ),
    ),
    Path(
      r'^' '/' r'',
      (context, match) => const RootPage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        currentPage = settings.name!;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }

    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}

Widget createPage(BuildContext context, Widget child) {
  late final AppBar appbar;
  late final EdgeInsetsGeometry padding;
  isVisibleDancingArrow.value = true;
  if (isDisplayDesktop(context)) {
    // appbar = AppBar(
    //   automaticallyImplyLeading: false,
    //   elevation: 0,
    //   title: const MyNavigationBar(),
    // );
    padding = const EdgeInsets.fromLTRB(40, 80, 40, 0);
    toolbarHeight = 80 + kToolbarHeight;
  } else {
    // appbar = AppBar(
    //   actions: const [
    //     MyAppBar(),
    //   ],
    // );
    toolbarHeight = 20 + kToolbarHeight;
    padding = const EdgeInsets.fromLTRB(20, 20, 20, 0);
  }
  appbar = AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: const MyNavigationBar(),
    toolbarHeight: kToolbarHeight,
  );
  return Center(
    child: Padding(
      padding: padding,
      child: Scaffold(
        appBar: appbar,
        body: child,
      ),
    ),
  );
//   return Center(
//     child: ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: maxHomeItemWidth),
//       child: Padding(
//         padding: padding,
//         child: Scaffold(
//           appBar: appbar,
//           body: child,
//         ),
//       ),
//     ),
//   );
}
