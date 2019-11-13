import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const _request="https://api.hgbrasil.com/finance?format=json-cors&key=7d3ab3c8";

void main() async {
  runApp(MaterialApp(
    home: Home()
  ));
}

Future<Map> getData() async{
  http.Response _response = await http.get(_request);
  return json.decode(_response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      //body: ,
    );
  }
}
