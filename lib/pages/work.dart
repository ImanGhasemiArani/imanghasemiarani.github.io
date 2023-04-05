import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../constant.dart';
import '../layouts/adaptive.dart';
import '../widgets/title_widget.dart';
import 'animated_cursor_position.dart';

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
            SizedBox(height: 100),
            _Projects(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _Projects extends StatelessWidget {
  const _Projects();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Projects',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize! +
                              5))),
          const SizedBox(height: 40),
          ...projectsData.map((e) {
            if (isDisplayDesktop(context)) {
              return _DesktopProjectItem(
                e['iconUrl'],
                e['title'],
                e['description'],
                e['rLink'],
                e['dLink'],
                e['imgUrls'],
              );
            } else {
              return _MobileProjectItem(
                e['iconUrl'],
                e['title'],
                e['description'],
                e['rLink'],
                e['dLink'],
                e['imgUrls'],
              );
            }
          }),
        ],
      ),
    );
  }
}

class _MobileProjectItem extends StatelessWidget {
  const _MobileProjectItem(
    this.iconUrl,
    this.title,
    this.description,
    this.rLink,
    this.dLink,
    this.imgUrls,
  );

  final String? iconUrl;
  final String title;
  final String description;
  final String? rLink;
  final String? dLink;
  final List<String>? imgUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
            height: imgUrls == null ? 350 : 350 * 2,
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: iconUrl != null
                          ? Image.network(iconUrl!,
                              width: 75, height: 75, fit: BoxFit.cover)
                          : const SizedBox.square(
                              dimension: 75, child: Icon(Icons.circle_rounded)),
                    ),
                    const SizedBox(width: 20),
                    Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.blue)),
                  ]),
                  const SizedBox(height: 10),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    if (dLink != null)
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Download'),
                      ),
                    if (dLink != null && dLink != null)
                      const SizedBox(width: 10),
                    if (rLink != null)
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Go to Repo'),
                      ),
                  ]),
                  if (imgUrls != null) const SizedBox(height: 20),
                  if (imgUrls != null)
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      AnimatedCursorMouseRegion(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1)),
                          child: GalleryImageView(
                              listImage:
                                  imgUrls!.map((e) => NetworkImage(e)).toList(),
                              width: 350,
                              height: 350,
                              imageDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)))),
                    ]),
                ]))));
  }
}

class _DesktopProjectItem extends StatelessWidget {
  const _DesktopProjectItem(
    this.iconUrl,
    this.title,
    this.description,
    this.rLink,
    this.dLink,
    this.imgUrls,
  );

  final String? iconUrl;
  final String title;
  final String description;
  final String? rLink;
  final String? dLink;
  final List<String>? imgUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
            height: imgUrls == null ? 350 : 350,
            child: Center(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: iconUrl != null
                          ? Image.network(iconUrl!,
                              width: 75, height: 75, fit: BoxFit.cover)
                          : const SizedBox.square(
                              dimension: 75, child: Icon(Icons.circle_rounded)),
                    ),
                  ]),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.blue)),
                        const SizedBox(height: 10),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (dLink != null)
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Download'),
                                ),
                              if (dLink != null && dLink != null)
                                const SizedBox(width: 10),
                              if (rLink != null)
                                OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Go to Repo'),
                                ),
                            ]),
                      ])),
                  if (imgUrls != null) const SizedBox(width: 20),
                  if (imgUrls != null)
                    AnimatedCursorMouseRegion(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1)),
                        child: GalleryImageView(
                            listImage:
                                imgUrls!.map((e) => NetworkImage(e)).toList(),
                            width: 350,
                            height: 350,
                            imageDecoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)))),
                ]))));
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
                  AnimatedCursorMouseRegion(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    child: Container(
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize! +
                                      (isDisplayDesktop(context) ? 0 : 0),
                                ),
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
                  AnimatedCursorMouseRegion(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    child: Container(
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize! +
                                      (isDisplayDesktop(context) ? 0 : 0),
                                ),
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
                  AnimatedCursorMouseRegion(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    child: Container(
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize! +
                                      (isDisplayDesktop(context) ? 0 : 0),
                                ),
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
