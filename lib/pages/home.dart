import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../layouts/adaptive.dart';
import '../layouts/image_placeholder.dart';
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
          child: _MyImage(),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: _HomePageText(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _DesktopHomePageContact(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileHomePage extends StatelessWidget {
  const _MobileHomePage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 5,
          child: _MyImage(),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: const [
              Expanded(
                child: _HomePageText(),
              ),
              _MobileHomeContact(),
            ],
          ),
        ),
      ],
    );
  }
}

class _DesktopHomePageContact extends StatelessWidget {
  const _DesktopHomePageContact();

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

class _HomePageText extends StatelessWidget {
  const _HomePageText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      maxLines: 10,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize! +
                  (isDisplayDesktop(context) ? 10 : 0),
            ),
        children: [
          TextSpan(
            text: 'Hey there,\n',
            style: TextStyle(
              fontSize:
                  (Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14) +
                      7 +
                      (isDisplayDesktop(context) ? 10 : 0),
            ),
          ),
          const TextSpan(
            text: 'I\'m ',
          ),
          TextSpan(
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            children: [
              TextSpan(
                text: 'Iman${isDisplayDesktop(context) ? ' ' : '\n'}',
              ),
              const TextSpan(
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
                text: 'Developer Based in Iran, Tehran.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MyImage extends StatelessWidget {
  const _MyImage();

  @override
  Widget build(BuildContext context) {
    return const FadeInImagePlaceholder(
      image: AssetImage('assets/p2.png'),
      height: double.infinity,
      fit: BoxFit.contain,
      placeholder: SizedBox.shrink(),
    );
  }
}
