final String domain = 'https://pomodoroapi20211206160443.azurewebsites.net';

class Book {
  final int id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['nombre'],
      author: json['tarea'],
    );
  }
}
