import 'package:fab_simple/screens/home_page.dart';
import 'package:fab_simple/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FABSimple());
}

class FABSimple extends StatelessWidget {
  const FABSimple({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Simple FAB',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
