import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:token/Models/people.dart';
import 'package:token/Services/api_service.dart';
import 'login.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  var service = ApiService();
  late Future<List<People>> people;
  @override
  void initState() {
    super.initState();
    checkLogin();
    people = service.getData();
  }

  _onRefresh() async {
    checkLogin();
    setState(() {
      people = service.getData();
    });
  }

  checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
