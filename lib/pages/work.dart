import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Text('Work Experience'),
        ),
      ),
    );
  }
}
