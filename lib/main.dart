import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/ListaEjercicios.dart';
import 'package:flutter_application_1/app/pages/sesiones2/Sesiones2.dart';
import "app/pages/sesiones/Sesiones.dart";
import 'app/pages/pantallaInicio/PantallaInicio.dart';
import 'app/pages/perfilUsuario/PerfilUsuario.dart';
import 'app/pages/Login//Login.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "flutter app", initialRoute: '/',
      routes: {
        '/':(context) => PantallaInicio(),
        '/sesiones':(context) => Sesiones2(),
        '/categorias':(context) => Sesiones(),
        '/lista':(context) => ListaEjercicios(),
        '/perfil':(context) => PerfilUsuario(),
        '/login':(context) => Login(),
      },
    );
  }
}
