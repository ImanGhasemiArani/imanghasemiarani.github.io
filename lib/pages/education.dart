import 'package:flutter/material.dart';

import '../widgets/title_widget.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DancingArrowConfig(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget('Education'),
            Container(
              height: 1000,
            ),
          ],
        ),
      ),
    );
  }
}
