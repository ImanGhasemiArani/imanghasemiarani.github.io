import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../assets/assets.url.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<NavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      if (boxConstraints.maxWidth < 800) {
        return Row(
          textDirection: TextDirection.rtl,
          children: [
            ...List.generate(items.length * 2 - 1, (index) {
              if (index.isEven) {
                return NavBarItem(
                  iconSvgPath: items[index / 2 as int].iconSvgPath,
                  selectedIconSvgPath:
                      items[index / 2 as int].selectedIconSvgPath,
                  onPressed: items[index / 2 as int].onPressed,
                );
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
                child: CachedNetworkImage(
                  imageUrl: AssetsUrl.originalCircleTransparent,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ],
        );
      } else {
        return LargeScreenNavBar(items: items);
      }
    });
  }
}

class LargeScreenNavBar extends StatelessWidget {
  const LargeScreenNavBar({
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
            child: CachedNetworkImage(
              imageUrl: AssetsUrl.originalCircleTransparent,
              width: 40,
              height: 40,
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
    this.label,
    this.onPressed,
    required this.iconSvgPath,
    required this.selectedIconSvgPath,
  }) : super(key: key);

  final String? label;
  final String iconSvgPath;
  final String selectedIconSvgPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.network(
      iconSvgPath,
      key: const ValueKey<bool>(false),
      color: Theme.of(context).colorScheme.primary,
      placeholderBuilder: (context) => const SizedBox(width: 24, height: 24),
    );
    final selectedIcon = SvgPicture.network(
      selectedIconSvgPath,
      key: const ValueKey<bool>(true),
      color: Theme.of(context).colorScheme.primary,
      placeholderBuilder: (context) => const SizedBox(width: 24, height: 24),
    );

    final showAnimation = false.obs;
    if (label != null) {
      final maxWidth =
          _textSize(label!, Theme.of(context).textTheme.titleMedium).width;
      return GetPlatform.isDesktop
          ? Column(
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
                    onPressed: () {
                      onPressed?.call();
                    },
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
                          label!,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
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
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showAnimation.value = true;
                    onPressed?.call();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => AnimatedRotation(
                          onEnd: () {
                            showAnimation.value = false;
                          },
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
                        label!,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
                Obx(
                  () {
                    return AnimatedContainer(
                      onEnd: () {
                        showAnimation.value = false;
                      },
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
    } else {
      return GetPlatform.isDesktop
          ? MouseRegion(
              onHover: (event) {
                showAnimation.value = true;
              },
              onExit: (event) {
                showAnimation.value = false;
              },
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  onPressed?.call();
                },
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
                  ],
                ),
              ),
            )
          : CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {
                showAnimation.value = true;

                onPressed?.call();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => AnimatedRotation(
                      onEnd: () {
                        showAnimation.value = false;
                      },
                      duration: const Duration(milliseconds: 400),
                      turns: showAnimation.value ? 1 : 0,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: showAnimation.value ? selectedIcon : icon,
                      ),
                    ),
                  ),
                ],
              ),
            );
    }
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
