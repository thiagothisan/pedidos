import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Pedidos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
