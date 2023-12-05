import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/Login/Login.dart';
import 'package:flutter_application_1/app/pages/detallesAddEjercicio/DetallesAddEjercicio.dart';
import 'package:flutter_application_1/app/pages/editarUsuario/UpdateUser.dart';
import 'package:flutter_application_1/app/pages/home/Home.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/ListaEjercicios.dart';
import 'package:flutter_application_1/app/pages/categorias/CategoriasManuales.dart';
import 'package:flutter_application_1/app/pages/listadoEntrenamientos/ListadoEntrenamientos.dart';
import 'package:flutter_application_1/app/pages/perfilUsuario/PerfilUsuario.dart';
import 'package:flutter_application_1/app/pages/registro/registro.dart';
import 'package:flutter_application_1/app/pages/verEntrenamiento/VerEntrenamiento.dart';
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
        '/categorias_automaticas':(context) => CategoriasAutomaticas(),
        '/lista':(context) => ListaEjercicios(),
        '/categorias_manuales':(context) => CategoriasManuales(),
        '/detalles_add_ejercicio':(context) => DetallesAddEjercicio(),
        '/sesion':(context) => Login(),
        '/user':(context) => PerfilUsuario(),
        '/registro':(context) => Registro(),
        '/entrenamiento':(context) => VerEntrenamiento(),
        '/listadoEntrenamiento':(context)=> ListaEntrenamientos(),
        '/editarUser':(context)=> UpdateUser(),
      },
    );
  }
}
