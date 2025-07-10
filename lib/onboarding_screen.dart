import 'package:flutter/material.dart';
import 'package:note_app_fanntt_flutter/note_list_screen.dart';


class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/onboarding.png', height: 250),
            Text(
              'Capture your ideas, anytime,\nanywhere',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'You can quickly jot down your thoughts, ideas, and to-dos...',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => NotesListScreen()),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
