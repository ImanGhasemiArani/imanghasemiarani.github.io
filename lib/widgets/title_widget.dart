import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../constant.dart';
import '../layouts/adaptive.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - (toolbarHeight ?? 0),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                        fontSize: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .fontSize! *
                            (isDisplayDesktop(context) ? 2.5 : 1),
                      ),
                ),
                SizedBox(height: toolbarHeight ?? 0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _ScrollGuide(text),
          ),
        ],
      ),
    );
  }
}

class _ScrollGuide extends StatelessWidget {
  const _ScrollGuide(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final Widget arrowChild = ValueListenableBuilder<bool>(
      valueListenable: isVisibleDancingArrow,
      builder: (__, isVisible, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isVisible ? const _DancingArrow() : null,
        );
      },
    );

    if (isDisplayDesktop(context)) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              arrowChild,
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(50),
        child: arrowChild,
      );
    }
  }
}

class _DancingArrow extends StatefulWidget {
  const _DancingArrow();

  @override
  State<_DancingArrow> createState() => _DancingArrowState();
}

class _DancingArrowState extends State<_DancingArrow> {
  bool isFlush = true;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(milliseconds: 600),
      (timer) {
        timer.cancel();
        setState(() => isFlush = !isFlush);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: isFlush ? const Offset(0, 0) : const Offset(0, -0.5),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
      onEnd: () => setState(() => isFlush = !isFlush),
      child: Icon(
        Ionicons.chevron_down,
        color: Theme.of(context).colorScheme.primary,
        size: 35,
      ),
    );
  }
}

class DancingArrowConfig extends StatelessWidget {
  const DancingArrowConfig({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            MediaQuery.of(context).size.height * 0.15) {
          if (isVisibleDancingArrow.value != false) {
            isVisibleDancingArrow.value = false;
          }
        } else {
          if (isVisibleDancingArrow.value != true) {
            isVisibleDancingArrow.value = true;
          }
        }
        return false;
      },
      child: child,
    );
  }
}
