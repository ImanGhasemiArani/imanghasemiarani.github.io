import 'package:flutter/material.dart';

import '../widgets/title_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DancingArrowConfig(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleWidget('Contacts'),
            Container(
              height: 1000,
            ),
          ],
        ),
      ),
    );
  }
}
