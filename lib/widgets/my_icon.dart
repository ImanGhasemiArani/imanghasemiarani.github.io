import 'package:flutter/material.dart';

class MyIcon extends StatefulWidget {
  const MyIcon(this.icon, this.size, {super.key});

  final IconData icon;
  final double size;

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isEnter(true),
      onExit: (_) => isEnter(false),
      child: Icon(
        widget.icon,
        size: widget.size,
        color: isHover
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  void isEnter(bool isEnter) {
    setState(() {
      isHover = isEnter;
    });
  }
}
