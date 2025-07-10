import 'package:flutter/material.dart';
import 'note_detail_screen.dart';

class NotesListScreen extends StatelessWidget {
  final List<String> categories = ["Ramadan List", "Voice Notes", "Work List"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes."),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            // Add dummy note cards
            noteCard(context, 'Ramadan List', ['Tarawih', 'Reading Quran', 'Charity', 'Jogging'], 'Sun, 12 Apr 2023'),
            noteCard(context, 'Finance History', ['Here is a breakdown of...'], 'Mon, 13 Apr 2023'),
            noteCard(context, 'Voice 1', ['🎤 Voice note'], 'Sun, 12 Apr 2023'),
            // Add more cards...
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget noteCard(BuildContext context, String title, List<String> items, String date) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NoteDetailScreen(title: title)),
        );
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...items.map((item) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text("• $item"),
              )),
              SizedBox(height: 8),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
