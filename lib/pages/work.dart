import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../layouts/adaptive.dart';
import '../widgets/title_widget.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DancingArrowConfig(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            TitleWidget('Works'),
            _WorkExp(),
          ],
        ),
      ),
    );
  }
}

class _WorkExp extends StatelessWidget {
  const _WorkExp();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Academic Experience',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize! +
                              5))),
          const SizedBox(height: 40),
          TimelineTile(
            isFirst: true,
            alignment: TimelineAlign.center,
            startChild: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Spring 2022',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize! +
                              (isDisplayDesktop(context) ? 0 : 0),
                        ),
                  ),
                ],
              ),
            ),
            endChild: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TA, AP with Java, KNTU',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .fontSize! +
                                (isDisplayDesktop(context) ? 0 : 0),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              color: Theme.of(context).colorScheme.primary,
              drawGap: true,
            ),
            beforeLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
            afterLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.center,
            endChild: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Fall 2021',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize! +
                              (isDisplayDesktop(context) ? 0 : 0),
                        ),
                  ),
                ],
              ),
            ),
            startChild: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TA, AP with Java, KNTU',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .fontSize! +
                                (isDisplayDesktop(context) ? 0 : 0),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              color: Theme.of(context).colorScheme.primary,
              drawGap: true,
            ),
            beforeLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
            afterLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
          ),
          TimelineTile(
            isLast: true,
            alignment: TimelineAlign.center,
            startChild: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Spring 2021',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize! +
                              (isDisplayDesktop(context) ? 0 : 0),
                        ),
                  ),
                ],
              ),
            ),
            endChild: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TA, AP with Java, KNTU',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .fontSize! +
                                (isDisplayDesktop(context) ? 0 : 0),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            indicatorStyle: IndicatorStyle(
              color: Theme.of(context).colorScheme.primary,
              drawGap: true,
            ),
            beforeLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
            afterLineStyle: LineStyle(
              color: Theme.of(context).colorScheme.primary,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
