class Note {
  final int? id;
  final String title;
  final String content;
  final String category;
  final String? audioPath;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.category,
    this.audioPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'audioPath': audioPath,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      category: map['category'],
      audioPath: map['audioPath'],
    );
  }

  Note copyWith({
    int? id,
    String? title,
    String? content,
    String? category,
    String? audioPath,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      audioPath: audioPath ?? this.audioPath,
    );
  }
}
