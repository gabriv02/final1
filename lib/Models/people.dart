final String domain = 'https://pomodoroapi20211206160443.azurewebsites.net';

class People {
  final int id;
  final String nombre;
  final String tarea;

  People({required this.id, required this.nombre, required this.tarea});

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      id: json['id'],
      nombre: json['nombre'],
      tarea: json['tarea'],
    );
  }
}
