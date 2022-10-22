import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/assets.gen.dart';
import 'screen_holder.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    const imageSize = 512 / 4;
    Future.delayed(const Duration(milliseconds: 1100), () {
      Get.off(
        () => const ScreenHolder(),
        duration: const Duration(milliseconds: 1500),
        transition: Transition.fadeIn,
      );
    });

    final isShowAnimation = false.obs;
    Future.delayed(const Duration(milliseconds: 500), () {
      isShowAnimation.value = true;
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            width: isShowAnimation.value ? Get.width + 200 : imageSize,
            height: isShowAnimation.value ? Get.height + 200 : imageSize,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  BorderRadius.circular(isShowAnimation.value ? 0 : 1000),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Hero(
                  tag: 'logo',
                  child: Assets.images.originalCircleTransparent.image(
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
