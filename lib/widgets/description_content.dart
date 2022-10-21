import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../assets/strs.dart';

class DescriptionContent extends StatelessWidget {
  const DescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Theme.of(context).textTheme.headline3?.color),
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
                    fontFamily: Theme.of(context).textTheme.button?.fontFamily,
                  ),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
