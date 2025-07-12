import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../db/note_database.dart';
import 'note_form_screen.dart';
import '../theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    final data = await NoteDatabase.instance.readAllNotes();
    setState(() => notes = data);
  }

  void addNote() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NoteFormScreen()),
    );
    if (newNote != null) {
      refreshNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          Switch(
            value: themeProvider.isDark,
            onChanged: (_) => themeProvider.toggleTheme(),
          )
        ],
      ),
      body: notes.isEmpty
          ? Center(child: Text('Tidak ada catatan. Tambahkan sekarang!'))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NoteFormScreen(note: note),
                ),
              );
              if (updatedNote != null) refreshNotes();
            },
            child: Card(
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(note.content),
                    SizedBox(height: 8),
                    Text('Kategori: ${note.category}',
                        style: TextStyle(fontStyle: FontStyle.italic)),
                    if (note.audioPath != null)
                      Icon(Icons.audiotrack, color: Colors.orange),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
