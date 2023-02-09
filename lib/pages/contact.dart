import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple,
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: const Text('Contact'),
        ),
      ),
    );
  }
}
