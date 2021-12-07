import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:token/Views/details.dart';

import '../Models/people.dart';

// ignore: must_be_immutable
class BooksList extends StatefulWidget {
  Future<List<People>> books;
  BooksList({Key? key, required this.books}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<People>>(
        future: widget.books,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].nombre),
                  subtitle: Text(snapshot.data[index].tarea),
                  leading: const Icon(Icons.people),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    People people = People(
                      id: snapshot.data[index].id,
                      nombre: snapshot.data[index].nombre,
                      tarea: snapshot.data[index].tarea,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(people: people)));
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Ocurrio un error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
