import 'package:flutter/material.dart';
import '../models/note.dart';
import '../db/note_database.dart';

class NoteFormScreen extends StatefulWidget {
  @override

  final Note? note;

  NoteFormScreen({this.note});

  _NoteFormScreenState createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String selectedCategory = 'Pribadi';
  List<String> categories = ['Pribadi', 'Kerja', 'Jurnal', 'Ide'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Catatan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Isi Catatan'),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedCategory,
              decoration: InputDecoration(labelText: 'Kategori'),
              items: categories
                  .map((cat) => DropdownMenuItem(
                value: cat,
                child: Text(cat),
              ))
                  .toList(),
              onChanged: (value) => setState(() => selectedCategory = value!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newNote = Note(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: _titleController.text,
                  content: _contentController.text,
                  category: selectedCategory,
                );
                Navigator.pop(context, newNote);
              },
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
