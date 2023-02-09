import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Text('Education'),
        ),
      ),
    );
  }
}
