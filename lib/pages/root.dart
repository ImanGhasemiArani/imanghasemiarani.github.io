import 'package:flutter/material.dart';

import '../routes.dart';
import 'home.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return createPage(context, const HomePage());
  }
}
