import 'package:flutter/material.dart';
import 'package:token/Models/people.dart';
import 'package:token/Services/api_service.dart';

import 'Auth/home.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  People people;
  EditPage({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  ApiService service = ApiService();

  @override
  void initState() {
    idController.text = widget.people.id.toString();
    titleController.text = widget.people.nombre;
    authorController.text = widget.people.tarea;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const Icon(Icons.people, size: 200),
          TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              labelText: 'Id',
            ),
          ),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          TextFormField(
            controller: authorController,
            decoration: const InputDecoration(
              labelText: 'Tarea',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                onPressed: () {
                  People people = People(
                      id: int.parse(idController.text),
                      nombre: titleController.text,
                      tarea: authorController.text);
                  service.updateData(people);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('Update')),
          ),
        ],
      )),
    );
  }
}
