import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../assets/assets.url.dart';
import '../assets/strs.dart';

class SkillsContent extends StatelessWidget {
  const SkillsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isShowAnimation = false.obs;
    Future.delayed(const Duration(milliseconds: 500), () {
      isShowAnimation.value = true;
    });
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Obx(
            () => AnimatedRotation(
              duration: const Duration(milliseconds: 2000),
              turns: isShowAnimation.value ? 1 / 50 : 0,
              curve: Curves.elasticInOut,
              alignment: Alignment.bottomCenter,
              child: Card(
                margin: EdgeInsets.zero,
                shape: SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 40,
                    cornerSmoothing: 1,
                  ),
                ),
                color: Colors.white.withOpacity(0.5),
                surfaceTintColor: Colors.white.withOpacity(0.5),
                child: const SizedBox(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 40,
                cornerSmoothing: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          Strs.keySkillsStr,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.network(
                          AssetsUrl.diamondsBulk,
                          color: Colors.amber,
                        )
                      ]),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(2, (ci) {
                          final subs = [
                            Strs.skills
                                .sublist(0, (Strs.skills.length / 2).ceil()),
                            Strs.skills.sublist((Strs.skills.length / 2).ceil(),
                                Strs.skills.length),
                          ];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              subs[ci].length * 2 - 1,
                              (ri) => ri.isEven
                                  ? Text(
                                      subs[ci][ri ~/ 2],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  : const SizedBox(height: 25),
                            ),
                          );
                        }),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
