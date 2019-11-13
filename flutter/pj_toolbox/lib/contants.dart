import 'package:flutter/material.dart';

const kGreetings = Text('Alex, vamos Começar?',
    style: TextStyle(
      color: Color(0xFFCFD8DC),
      fontSize: 45.0,
    ));

const kClock = Text(
  '00:00:00',
  style: TextStyle(
    color: Color(0xFFCFD8DC),
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
  ),
);

const kSuccess = Text('Horas armazenadas, até amanhã!',
    style: TextStyle(
      color: Color(0xFFCFD8DC),
      fontSize: 45.0,
    ));

//Animação inicial box superior
final DecorationTween kDecorationTween = DecorationTween(
  begin: BoxDecoration(
    color: Colors.blueGrey[700],
  ),
  end: BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black,
        offset: Offset(1.0, 1.0),
        blurRadius: 3.0,
      ),
    ],
    color: Colors.blueGrey[700],
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25.0),
      bottomRight: Radius.circular(25.0),
    ),
  ),
);
