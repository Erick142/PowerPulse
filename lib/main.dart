import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/home/Home.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/ListaEjercicios.dart';
import "app/pages/sesiones/Sesiones.dart";
import 'app/pages/pantallaInicio/PantallaInicio.dart';
void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "flutter app", initialRoute: '/',
      routes: {
        '/':(context) => PantallaInicio(),
        '/sesiones':(context) => Home(),
        '/categorias':(context) => Sesiones(),
        '/lista':(context) => ListaEjercicios(),
      },
    );
  }
}
