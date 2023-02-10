import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../layouts/adaptive.dart';
import '../routes.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavBar(
      delegates: getDelegates(context),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.delegates,
  });

  final List<NavBarItemDelegate> delegates;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (final delegate in delegates) {
      items.addAll([
        _NavBarItem(delegate: delegate),
        isDisplayDesktop(context)
            ? const SizedBox(width: 30)
            : const SizedBox(width: 15)
      ]);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.rtl,
      children: items
        ..removeLast()
        ..addAll([
          const Spacer(),
          const _MyNameWidget(),
        ]),
    );
  }
}

class _MyNameWidget extends StatelessWidget {
  const _MyNameWidget();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/home');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Iman',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          const Text('Ghasemi Arani'),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  const _NavBarItem({
    required this.delegate,
  });
  final NavBarItemDelegate delegate;

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    return MouseRegion(
      onEnter: (_) => isEnter(true),
      onExit: (_) => isEnter(false),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: widget.delegate.onPressed,
        child: _HoverEffect(
          myKey: key,
          child: Row(
            key: key,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              if (isDisplayDesktop(context))
                Text(
                  widget.delegate.label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isHover || currentPage == widget.delegate.route
                          ? Theme.of(context).colorScheme.primary
                          : null),
                ),
              if (isDisplayDesktop(context)) const SizedBox(width: 5),
              Icon(
                widget.delegate.icon,
                color: isHover || currentPage == widget.delegate.route
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isEnter(bool isEnter) {
    setState(() {
      isHover = isEnter;
    });
  }
}

class _HoverEffect extends StatefulWidget {
  const _HoverEffect({required this.child, required this.myKey});
  final Widget child;
  final GlobalKey myKey;

  @override
  State<_HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<_HoverEffect> {
  bool isHover = false;
  double maxWidth = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isEntered(true),
      onExit: (_) => isEntered(false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.child,
          const SizedBox(height: 5),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.bottomLeft,
            height: 2,
            width: isHover ? double.infinity : 0,
            constraints: BoxConstraints(maxWidth: maxWidth),
          )
        ],
      ),
    );
  }

  void isEntered(bool isHover) {
    if (isHover && maxWidth == 0) {
      final RenderBox renderBox =
          widget.myKey.currentContext!.findRenderObject() as RenderBox;
      maxWidth = renderBox.size.width;
    }
    setState(() => this.isHover = isHover);
  }
}

class NavBarItemDelegate {
  const NavBarItemDelegate({
    required this.route,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  });

  final String route;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
}

// class MyAppBar extends StatefulWidget {
//   const MyAppBar({super.key});

//   @override
//   State<MyAppBar> createState() => _MyAppBarState();
// }

// class _MyAppBarState extends State<MyAppBar> with TickerProviderStateMixin {
//   late AnimationController _controller;

//   bool isClicked = false;

//   @override
//   void initState() {
//     _controller = AnimationController(
//       duration: const Duration(
//         milliseconds: 800,
//       ),
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       onPressed: () {
//         isClicked = !isClicked;
//         isClicked ? _controller.forward() : _controller.reverse();
//       },
//       child: AnimatedIcon(
//         icon: AnimatedIcons.menu_close,
//         progress: _controller,
//       ),
//     );
//   }
// }

List<NavBarItemDelegate> getDelegates(BuildContext context) => [
      NavBarItemDelegate(
        route: '/contacts',
        icon: Ionicons.people,
        label: 'Contacts',
        onPressed: () {
          Navigator.pushNamed(context, '/contacts');
        },
      ),
      NavBarItemDelegate(
        route: '/works',
        icon: Ionicons.briefcase,
        label: 'Works',
        onPressed: () {
          Navigator.pushNamed(context, '/works');
        },
      ),
      NavBarItemDelegate(
        route: '/education',
        icon: Ionicons.school,
        label: 'Education',
        onPressed: () {
          Navigator.pushNamed(context, '/education');
        },
      ),
      NavBarItemDelegate(
        route: '/home',
        icon: Ionicons.home,
        label: 'Home',
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
    ];
