import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../assets/assets.url.dart';
import 'screen_holder.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final isShowAnimation = false.obs;

    const imageSize = 512 / 4;

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
                child: FutureBuilder(
                    future: precacheImage(
                      const NetworkImage(AssetsUrl.originalCircleTransparent),
                      context,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        startFutureService(isShowAnimation);
                        return Hero(
                          tag: 'logo',
                          child: CachedNetworkImage(
                            imageUrl: AssetsUrl.originalCircleTransparent,
                            width: imageSize,
                            height: imageSize,
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: imageSize,
                          height: imageSize,
                        );
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startFutureService(RxBool isShowAnimation) {
    Future.delayed(const Duration(milliseconds: 500), () {
      isShowAnimation.value = true;
    });
    Future.delayed(const Duration(milliseconds: 1100), () {
      Get.off(
        () => const ScreenHolder(),
        duration: const Duration(milliseconds: 1500),
        transition: Transition.fadeIn,
      );
    });
  }
}
