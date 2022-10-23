import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
// import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import '../assets/assets.gen.dart';
import '../assets/strs.dart';
import '../widgets/my_app_bar/my_app_bar.dart';
import '../widgets/nav_bar/nav_bar.dart';
import 'education_content.dart';
import 'home_content.dart';
import 'project_content.dart';
import 'working_content.dart';

const maxWidth = 1200.0;
final navBarHight = GetPlatform.isMobile ? kToolbarHeight : kToolbarHeight + 50;

ScrollController? controller;

class ScreenHolder extends HookWidget {
  const ScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    controller = useScrollController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: GetPlatform.isMobile
              ? _buildScrollView(context)
              : _buildScrollView(context),
          //   : SmoothScrollWeb(
          //       controller: controller,
          //       scrollAnimationLength: 600,
          //       curve: Curves.decelerate,
          //       child: _buildScrollView(context),
          //     ),
        ),
      ),
    );
  }

  CustomScrollView _buildScrollView(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      //   physics:
      //       GetPlatform.isMobile ? null : const NeverScrollableScrollPhysics(),
      slivers: [
        _buildAppBar(context),
        SliverToBoxAdapter(child: SizedBox(key: KeyController().homeGK)),
        SliverToBoxAdapter(
            child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: Get.height - navBarHight),
          child: const Center(child: HomeContent()),
        )),
        SliverToBoxAdapter(
            child: SizedBox(key: KeyController().workExperienceGK)),
        SliverToBoxAdapter(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: Get.height - navBarHight),
                child: const Center(child: WorkingContent()))),
        SliverToBoxAdapter(
            child: SizedBox(key: KeyController().personalProjectsGK)),
        SliverToBoxAdapter(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: Get.height - navBarHight),
                child: const Center(child: ProjectContent()))),
        SliverToBoxAdapter(child: SizedBox(key: KeyController().educationGK)),
        SliverToBoxAdapter(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: Get.height - navBarHight),
                child: const Center(child: EducationContent()))),
      ],
    );
  }

  MySliverAppBar _buildAppBar(BuildContext context) {
    return MySliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: navBarHight,
      centerTitle: true,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.only(top: navBarHight - kToolbarHeight),
          child: SizedBox(
            height: kToolbarHeight,
            child: NavBar(
              items: _getNavBarItems(context),
            ),
          ),
        ),
      ),
    );
  }

  List<NavBarItem> _getNavBarItems(BuildContext context) {
    return [
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
        onPressed: () => navigateTo(KeyController().educationGK),
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
        onPressed: () => navigateTo(KeyController().personalProjectsGK),
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
        onPressed: () => navigateTo(KeyController().workExperienceGK),
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
        onPressed: () => navigateTo(KeyController().homeGK),
      ),
    ];
  }

  void navigateTo(GlobalKey key) {
    final cP = controller?.offset;
    final sP = (key.currentContext?.findRenderObject() as RenderBox?)
        ?.localToGlobal(Offset(0, cP! - navBarHight))
        .dy;
    if (sP != null && cP != null) {
      final animTime = (sP - cP).abs() * 0.8;
      controller?.animateTo(
        sP,
        duration: Duration(milliseconds: animTime.toInt()),
        curve: Curves.ease,
      );
    }
  }
}

class KeyController {
  final homeGK = GlobalKey();
  final workExperienceGK = GlobalKey();
  final personalProjectsGK = GlobalKey();
  final educationGK = GlobalKey();

  static final KeyController _instance = KeyController._internal();

  factory KeyController() {
    return _instance;
  }

  KeyController._internal();
}
