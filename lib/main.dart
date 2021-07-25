import 'package:cimilo_sheeg/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CimiloSheegApp());
}

class CimiloSheegApp extends StatelessWidget {
  final String appName = 'CimiloSheeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(title: appName),
    );
  }
}
