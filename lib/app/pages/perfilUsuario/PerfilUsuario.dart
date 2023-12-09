import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/editarUsuario/UpdateUser.dart';
import 'package:flutter_application_1/app/pages/home/Home.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import '../../utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PerfilUsuario extends StatefulWidget {
  final String token;

  PerfilUsuario(this.token);
  @override
  State<PerfilUsuario> createState() => _PerfilUsuario();
}

class _PerfilUsuario extends State<PerfilUsuario> {
  bool cargando = true;
  String nombreUsuario = "";
  dynamic estatura = 0;
  dynamic peso = 0;
  dynamic edad = 0;

  @override
  void initState() {
    super.initState();
    // Llama a la función para obtener el token al inicio del widget
    obtenerData();
  }

  // Función para obtener el token y redirigir si está vacío
  Future<void> obtenerData() async {
    try {
      var url = "http://${Datos.IP}/usuarios/perfil/${widget.token}";

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var respuesta = jsonDecode(response.body);
        print(respuesta);
        setState(() {
          nombreUsuario = respuesta["nombre"];
          estatura = respuesta["altura"] ?? "Aun no definido";
          peso = respuesta["peso"] ?? "Aun no definido";
          edad = respuesta["edad"] ?? "Aun no definido";
          cargando=false;
        });
      } else {
        // ignore: use_build_context_synchronously
        mostrarModal(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(2, 0, 36, 1.0),
                Color.fromRGBO(29, 29, 176, 1.0),
                Color.fromRGBO(0, 141, 172, 1.0),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/media/DoH8AVIUYAY2NV1.jpg"),
              ),
              Text(
                nombreUsuario,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Estatura $estatura cm",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Peso $peso kg",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "$edad años",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateUser(widget.token)));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(300, 50),
                ),
                child: Text("Editar Perfil", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarModal(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ocurrió un error'),
          content: Text('Inténtalo de nuevo más tarde.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(widget.token)));
    return true;
  }
}
