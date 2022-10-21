import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import '../assets/assets.gen.dart';
import '../assets/strs.dart';
import '../widgets/description_content.dart';
import '../widgets/my_app_bar/my_app_bar.dart';
import '../widgets/nav_bar/nav_bar.dart';
import '../widgets/skills_content.dart';

class ScreenHolder extends HookWidget {
  const ScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetPlatform.isMobile ? null : useScrollController();
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: _buildAppBar(context),
                  body: Center(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: GetPlatform.isMobile
                          ? _buildScrollView(controller)
                          : SmoothScrollWeb(
                              controller: controller,
                              scrollAnimationLength: 600,
                              curve: Curves.decelerate,
                              child: _buildScrollView(controller),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 50,
            color: Theme.of(context).scaffoldBackgroundColor,
          )
        ],
      ),
    );
  }

  SingleChildScrollView _buildScrollView(ScrollController? controller) {
    return SingleChildScrollView(
      physics: GetPlatform.isMobile
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: controller,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.only(top: 200),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: HomeContent(),
          ),
          Container(
            height: 2000,
          ),
        ],
      ),
    );
  }

  MyAppBar _buildAppBar(BuildContext context) {
    return MyAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        SizedBox(
          width: 600,
          child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: Duration(milliseconds: 1000),
            delay: Duration(milliseconds: 1000),
            child: SlideAnimation(
              horizontalOffset: -100,
              verticalOffset: 50,
              child: FadeInAnimation(
                child: DescriptionContent(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 600,
          child: AnimationConfiguration.staggeredList(
            position: 1,
            duration: Duration(milliseconds: 1000),
            delay: Duration(milliseconds: 1000),
            child: SlideAnimation(
              horizontalOffset: 100,
              verticalOffset: 50,
              child: FadeInAnimation(
                child: SkillsContent(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
