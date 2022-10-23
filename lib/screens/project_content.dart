import 'package:flutter/material.dart';

import '../assets/strs.dart';
import 'screen_holder.dart';

class ProjectContent extends StatelessWidget {
  const ProjectContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Container(
        height: 700,
        width: double.infinity,
        color: Colors.purple,
        alignment: Alignment.center,
        child: const Text(Strs.personalProjectsStr),
      ),
    );
  }
}
