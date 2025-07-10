import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  final String title;

  NoteDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sun, 12 Apr 2023", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration.collapsed(hintText: "Start writing"),
              maxLines: 10,
            ),
            Wrap(
              spacing: 8,
              children: ["To-Do List", "Project Plan", "Journal", "Meeting"]
                  .map((tag) => Chip(label: Text(tag)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
