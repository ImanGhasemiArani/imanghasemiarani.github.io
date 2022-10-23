import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/description_content.dart';
import '../widgets/skills_content.dart';
import 'screen_holder.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: 50,
        children: const [
          AnimationConfiguration.staggeredList(
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
          AnimationConfiguration.staggeredList(
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
        ],
      ),
    );
  }
}
