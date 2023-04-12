import 'package:flutter/material.dart';
import 'package:riveanimation/navigationPoint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rive Drawer and bottom tabs devhubspot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationPoint()
    );
  }
}
