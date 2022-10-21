import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../assets/strs.dart';

class DescriptionContent extends StatelessWidget {
  const DescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -50,
          right: 150,
          child: AnimationConfiguration.staggeredList(
            position: 7,
            duration: const Duration(milliseconds: 1000),
            child: ScaleAnimation(
              scale: 0,
              child: FadeInAnimation(
                child: Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF353AB8),
                        Color(0xFF1B18B8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF18169F),
                        offset: Offset(0, 20),
                        blurRadius: 20,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Strs.descTitleStr,
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Theme.of(context).textTheme.bodyText1?.color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                Strs.descTitle2Str,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).textTheme.bodyText1?.color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                Strs.descBodyStr,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).textTheme.headline3?.color),
              ),
              const SizedBox(height: 30),
              ClipSmoothRect(
                radius: SmoothBorderRadius(
                  cornerRadius: 10,
                  cornerSmoothing: 1,
                ),
                child: CupertinoButton.filled(
                    child: Text(
                      Strs.contactMeStr,
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.button?.fontFamily,
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
