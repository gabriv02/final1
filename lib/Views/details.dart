import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:token/Models/people.dart';
import 'package:token/Services/api_service.dart';

import 'Auth/home.dart';
import 'edit.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  People people;
  DetailsPage({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Icon(
              Icons.people,
              size: 200,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Id: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.people.id.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Title: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.people.nombre,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    'Author: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    widget.people.tarea,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditPage(people: widget.people)),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text('Edit')),
            ),
            ElevatedButton(
                onPressed: () {
                  service.deleteData(widget.people.id);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false);
                },
                child: const Text('Delete')),
          ],
        )),
      ),
    );
  }
}
