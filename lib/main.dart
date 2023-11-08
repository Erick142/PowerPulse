import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/home/Home.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/ListaEjercicios.dart';
import 'package:flutter_application_1/app/pages/categorias/CategoriasManuales.dart';
import 'app/pages/categorias/CategoriasAutomaticas.dart';
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
        '/home':(context) => Home(),
        '/categorias_automaticas':(context) => SesionesAutomaticas(),
        '/lista':(context) => ListaEjercicios(),
        '/categorias_manuales':(context) => SesionesManuales(),
      },
    );
  }
}
