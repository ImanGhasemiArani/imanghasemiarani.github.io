import 'package:flutter/material.dart';

import '../widgets/title_widget.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DancingArrowConfig(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget('Work Experience'),
            Container(
              height: 1000,
            ),
          ],
        ),
      ),
    );
  }
}
