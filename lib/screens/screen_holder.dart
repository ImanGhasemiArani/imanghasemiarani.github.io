import 'package:flutter/material.dart';

import '../assets/assets.gen.dart';
import '../assets/strs.dart';
import '../widgets/description_content.dart';
import '../widgets/my_app_bar/my_app_bar.dart';
import '../widgets/nav_bar/nav_bar.dart';
import '../widgets/skills_content.dart';

class ScreenHolder extends StatelessWidget {
  const ScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Scaffold(
              appBar: _buildAppBar(context),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          children: const [
                            SizedBox(
                              width: 600,
                              child: DescriptionContent(),
                            ),
                            SizedBox(
                              width: 600,
                              child: SkillsContent(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  MyAppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
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
    );
  }
}