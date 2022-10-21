import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/assets.gen.dart';
import 'screen_holder.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isShowAnimation = false.obs;
    Future.delayed(const Duration(milliseconds: 0), () {
      isShowAnimation.value = true;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      Get.off(() => const ScreenHolder(),
          transition: Transition.circularReveal,
          duration: Duration(milliseconds: 1500));
    });
    return Container(
      color: const Color(0xff95CEC8),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            decoration: BoxDecoration(
              color: const Color(0xFF18169F),
              borderRadius:
                  BorderRadius.circular(isShowAnimation.value ? 0 : 1000),
            ),
            width: isShowAnimation.value ? Get.width : 512 / 4,
            height: isShowAnimation.value ? Get.height : 512 / 4,
            child: AspectRatio(
              aspectRatio: 1,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Hero(
                  tag: 'logo',
                  child: Assets.images.originalCircleTransparent.image(
                    width: 512 / 4,
                    height: 512 / 4,
                    fit: BoxFit.contain,
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
