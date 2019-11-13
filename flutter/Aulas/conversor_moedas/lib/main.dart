import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const _request =
    "https://api.hgbrasil.com/finance?format=json-cors&key=7d3ab3c8";

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber)))),
  ));
}

Future<Map> getData() async {
  http.Response _response = await http.get(_request);
  return json.decode(_response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final realControler = TextEditingController();
  final usdControler = TextEditingController();
  final euroControler = TextEditingController();

  double usd;
  double euro;

  void _clearAll(){
    realControler.text="";
    usdControler.text="";
    euroControler.text="";
  }

  void _realChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }

    double real = double.parse(text);
    usdControler.text =  (real/usd).toStringAsFixed(2);
    euroControler.text =  (real/euro).toStringAsFixed(2);
  }

  void _usdChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }

    double dolar = double.parse(text);
    realControler.text = (dolar * this.usd).toStringAsFixed(2);
    euroControler.text = ((dolar * this.usd)/euro).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }

    double euro = double.parse(text);
    usdControler.text = ((euro * this.euro)/usd).toStringAsFixed(2);
    realControler.text = (euro * this.euro).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text(
                "Carregando Dados...",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ));
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  "Erro ao carregar dados...",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ));
              } else {
                usd = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 150,
                        color: Colors.amber,
                      ),
                      buildTextField("Reais", "R\$", realControler, _realChanged),
                      Divider(),
                      buildTextField("Dólares", "US\$", usdControler, _usdChanged),
                      Divider(),
                      buildTextField("Euros", "€", euroControler, _euroChanged),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController controller, Function func) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(
        color: Colors.amber, fontSize: 25
    ),
    onChanged: func,
    //keyboardType: TextInputType.number,
    //Fiz essa alteração pois é a única forma de aparecer o (.) ponto no teclado numérico do IOS
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
