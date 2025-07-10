import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

void main() {
  runApp(MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
      ),
      home: OnboardingScreen(),
    );
  }
}
