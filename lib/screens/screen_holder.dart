import 'package:flutter/material.dart';

import '../assets/assets.gen.dart';
import '../assets/strs.dart';
import '../widgets/my_app_bar/my_app_bar.dart';
import '../widgets/nav_bar/nav_bar.dart';

class ScreenHolder extends StatelessWidget {
  const ScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //   decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topRight,
      //           end: Alignment.bottomLeft,
      //           colors: [
      //         Color(0xff18169F),
      //         Color(0xff03035A),
      //       ])),
      // color: Theme.of(context).scaffoldBackgroundColor,
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: MyAppBar(
                automaticallyImplyLeading: false,
                title: NavBar(items: [
                  NavBarItem(
                    label: Strs.educationStr,
                    icon: Assets.icons.teacherTwoTone.svg(
                      key: const ValueKey<bool>(false),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                    selectedIcon: Assets.icons.teacherBulk.svg(
                      key: const ValueKey<bool>(true),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                  ),
                  NavBarItem(
                    label: Strs.personalProjectsStr,
                    icon: Assets.icons.code1TwoTone.svg(
                      key: const ValueKey<bool>(false),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                    selectedIcon: Assets.icons.code1Bulk.svg(
                      key: const ValueKey<bool>(true),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                  ),
                  NavBarItem(
                    label: Strs.workExperienceStr,
                    icon: Assets.icons.brifecaseTimerTwoTone.svg(
                      key: const ValueKey<bool>(false),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                    selectedIcon: Assets.icons.brifecaseTimerBulk.svg(
                      key: const ValueKey<bool>(true),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                  ),
                  NavBarItem(
                    label: Strs.homeStr,
                    icon: Assets.icons.home1TwoTone.svg(
                      key: const ValueKey<bool>(false),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                    selectedIcon: Assets.icons.home1Bulk.svg(
                      key: const ValueKey<bool>(true),
                      color: Theme.of(context).colorScheme.primary,
                      placeholderBuilder: (context) =>
                          const SizedBox(width: 24, height: 24),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
