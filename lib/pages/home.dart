import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:my_new_site/layouts/adaptive.dart';
import 'package:my_new_site/layouts/image_placeholder.dart';

import '../widgets/my_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isDisplayDesktop(context)) {
      return const _DesktopHomePage();
    } else {
      return const _MobileHomePage();
    }
  }
}

class _DesktopHomePage extends StatelessWidget {
  const _DesktopHomePage();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 5,
          child: Align(
            // alignment: Alignment.centerLeft,
            child: FadeInImagePlaceholder(
              image: AssetImage('assets/p2.png'),
              height: double.infinity,
              fit: BoxFit.contain,
              placeholder: SizedBox.shrink(),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: _DesktopHomeText(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _DesktopHomeContact(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DesktopHomeText extends StatelessWidget {
  const _DesktopHomeText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      maxLines: 10,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize! + 10,
            ),
        children: [
          TextSpan(
            text: 'Hey there,\n',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize:
                      Theme.of(context).textTheme.bodyLarge!.fontSize! + 17,
                ),
          ),
          const TextSpan(
            text: 'I\'m ',
          ),
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            children: const [
              TextSpan(
                text: 'Iman ',
              ),
              TextSpan(
                text: 'Ghasemi Arani',
              ),
            ],
          ),
          TextSpan(
            children: [
              const TextSpan(
                text: ',\n',
              ),
              TextSpan(
                text: 'Front-end',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.blue),
              ),
              const TextSpan(
                text: ', ',
              ),
              TextSpan(
                text: 'Flutter ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.blue),
              ),
              const TextSpan(
                text: 'Developer ',
              ),
              const TextSpan(
                text: 'Based in Iran, Tehran.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DesktopHomeContact extends StatelessWidget {
  const _DesktopHomeContact();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'iman.ghasemi.arani@gmail.com',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '+98 920 741 0787',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(10),
                child: const MyIcon(Ionicons.logo_github),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(10),
                child: const MyIcon(Ionicons.logo_linkedin),
              ),
              CupertinoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(10),
                child: const MyIcon(Ionicons.paper_plane),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MobileHomePage extends StatelessWidget {
  const _MobileHomePage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(
            flex: 5,
            child: FadeInImagePlaceholder(
              image: AssetImage('assets/p2.png'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
              placeholder: SizedBox.shrink(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: const [
                _MobileHomeText(),
                Spacer(),
                _MobileHomeContact(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileHomeContact extends StatelessWidget {
  const _MobileHomeContact();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoButton(
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          child: const MyIcon(Ionicons.logo_github),
        ),
        CupertinoButton(
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          child: const MyIcon(Ionicons.logo_linkedin),
        ),
        CupertinoButton(
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          child: const MyIcon(Ionicons.logo_google),
        ),
        CupertinoButton(
          onPressed: () {},
          padding: const EdgeInsets.all(10),
          child: const MyIcon(Ionicons.paper_plane),
        ),
      ],
    );
  }
}

class _MobileHomeText extends StatelessWidget {
  const _MobileHomeText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: 'Hey there,\n',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize:
                      (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14) +
                          7,
                ),
          ),
          const TextSpan(
            text: 'I\'m ',
          ),
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            children: const [
              TextSpan(
                text: 'Iman\n',
              ),
              TextSpan(
                text: 'Ghasemi Arani',
              ),
            ],
          ),
          TextSpan(
            children: [
              const TextSpan(
                text: ',\n',
              ),
              TextSpan(
                text: 'Front-end',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.blue),
              ),
              const TextSpan(
                text: ', ',
              ),
              TextSpan(
                text: 'Flutter ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.blue),
              ),
              const TextSpan(
                text: 'Developer',
              ),
              const TextSpan(
                text: '\nBased in Iran, Tehran.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
