import 'package:flutter/material.dart';

import '../assets/strs.dart';
import 'screen_holder.dart';

class EducationContent extends StatelessWidget {
  const EducationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text(Strs.educationStr),
      ),
    );
  }
}
