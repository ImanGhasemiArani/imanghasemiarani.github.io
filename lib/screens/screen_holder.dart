import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

import '../assets/assets.url.dart';
import '../assets/strs.dart';
import '../widgets/my_app_bar/my_app_bar.dart';
import '../widgets/nav_bar/nav_bar.dart';
import 'education_content.dart';
import 'home_content.dart';
import 'project_content.dart';
import 'working_content.dart';

const maxWidth = 1200.0;
const horizontalPadding = 20.0;
final navBarHight = GetPlatform.isMobile ? kToolbarHeight : kToolbarHeight + 50;

ScrollController? controller;

class ScreenHolder extends HookWidget {
  const ScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    controller = useScrollController();
    return Scaffold(
      body: ScrollConfiguration(
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
    );
  }

  CustomScrollView _buildScrollView(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildAppBar(context),
        SliverToBoxAdapter(child: SizedBox(key: KeyController().homeGK)),
        const SliverToBoxAdapter(
            child: BuildLayout(child: Center(child: HomeContent()))),
        SliverToBoxAdapter(
            child: SizedBox(key: KeyController().workExperienceGK)),
        const SliverToBoxAdapter(
            child: BuildLayout(child: Center(child: WorkingContent()))),
        SliverToBoxAdapter(
            child: SizedBox(key: KeyController().personalProjectsGK)),
        const SliverToBoxAdapter(
            child: BuildLayout(child: Center(child: ProjectContent()))),
        SliverToBoxAdapter(child: SizedBox(key: KeyController().educationGK)),
        const SliverToBoxAdapter(
            child: BuildLayout(child: Center(child: EducationContent()))),
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
          padding: EdgeInsets.only(
            top: navBarHight - kToolbarHeight,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: SizedBox(
            height: kToolbarHeight,
            child: NavBar(
              items: _getNavBarItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<NavBarItem> _getNavBarItems() {
    return [
      NavBarItem(
        label: Strs.educationStr,
        iconSvgPath: AssetsUrl.teacherTwoTone,
        selectedIconSvgPath: AssetsUrl.teacherBulk,
        onPressed: () => navigateTo(KeyController().educationGK),
      ),
        NavBarItem(
          label: Strs.personalProjectsStr,
          iconSvgPath: AssetsUrl.code1TwoTone,
          selectedIconSvgPath: AssetsUrl.code1Bulk,
          onPressed: () => navigateTo(KeyController().personalProjectsGK),
        ),
        NavBarItem(
          label: Strs.workExperienceStr,
          iconSvgPath: AssetsUrl.brifecaseTimerTwoTone,
          selectedIconSvgPath: AssetsUrl.brifecaseTimerBulk,
          onPressed: () => navigateTo(KeyController().workExperienceGK),
        ),
        NavBarItem(
          label: Strs.homeStr,
          iconSvgPath: AssetsUrl.home1TwoTone,
          selectedIconSvgPath: AssetsUrl.home1Bulk,
          onPressed: () => navigateTo(KeyController().homeGK),
        ),
    ];
  }

  void navigateTo(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 1000),
    );
  }
}

class BuildLayout extends StatelessWidget {
  const BuildLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            minHeight: Get.height - navBarHight,
          ),
          child: child,
        );
      }),
    );
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
