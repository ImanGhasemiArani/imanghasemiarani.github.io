import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/assets.gen.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        ...List.generate(items.length * 2 - 1, (index) {
          if (index.isEven) {
            return items[index / 2 as int];
          } else {
            return const SizedBox(width: 30);
          }
        }),
        const Spacer(),
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xff95CEC8),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 10,
                cornerSmoothing: 1,
              ),
            ),
          ),
          child: Hero(
            tag: 'logo',
            child: Assets.images.originalCircleTransparent.image(
              height: 40,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key? key,
    required this.label,
    this.onPressed,
    required this.icon,
    required this.selectedIcon,
  }) : super(key: key);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final showAnimation = false.obs;
    final maxWidth =
        _textSize(label, Theme.of(context).textTheme.titleMedium).width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MouseRegion(
          onHover: (event) {
            showAnimation.value = true;
          },
          onExit: (event) {
            showAnimation.value = false;
          },
          child: CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => AnimatedRotation(
                    duration: const Duration(milliseconds: 400),
                    turns: showAnimation.value ? 1 : 0,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: showAnimation.value ? selectedIcon : icon,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Obx(
          () {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              alignment: Alignment.centerRight,
              height: 2,
              width: showAnimation.value ? double.infinity : 0,
              constraints: BoxConstraints(maxWidth: maxWidth),
            );
          },
        ),
      ],
    );
  }

  Size _textSize(
    String text,
    TextStyle? style, {
    double maxWidth = double.infinity,
    int maxLines = 1,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }
}
