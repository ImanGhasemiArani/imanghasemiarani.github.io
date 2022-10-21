import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../assets/assets.gen.dart';
import '../assets/strs.dart';

class SkillsContent extends StatelessWidget {
  const SkillsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Align(
        alignment: Alignment.centerRight,
        child: Stack(
          children: [
            AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: 1 / 50,
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 10),
                          Assets.icons.diamondsBulk.svg(color: Colors.amber),
                        ]),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(2, (ci) {
                            final subs = [
                              Strs.skills
                                  .sublist(0, (Strs.skills.length / 2).ceil()),
                              Strs.skills.sublist(
                                  (Strs.skills.length / 2).ceil(),
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
      ),
    );
  }
}
