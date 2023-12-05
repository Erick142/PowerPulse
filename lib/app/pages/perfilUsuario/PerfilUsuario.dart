import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';
import '../../utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PerfilUsuario extends StatefulWidget {
  @override
  State<PerfilUsuario> createState() => _PerfilUsuario();
}

class _PerfilUsuario extends State<PerfilUsuario> {
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
    String? storedToken = await StorageUtils.getTokenFromSharedPreferences();
    if (storedToken == null || storedToken.isEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/'); // Redirigir a la ruta "/"
    } else {
      try {
        var url = "http://192.168.1.148:4001/ver/$storedToken";

        var response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          var respuesta = jsonDecode(response.body);
          respuesta = respuesta["usuario"];
          print(response);
          setState(() {
            nombreUsuario = respuesta["nombre"];
            estatura = respuesta["estatura"] ?? "Aun no definido";
            peso = respuesta["peso"]  ?? "Aun no definido";
            edad = respuesta["edad"] ?? "Aun no definido";
          });
        } else {
          // ignore: use_build_context_synchronously
          mostrarModal(context);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          children: [
            TopBar(),
            SizedBox(height: MediaQuery.of(context).size.height * 1 / 6),
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
            )
          ],
        ),
      ),
    );
  }

  void mostrarModal(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ocurrio un error'),
          content: Text('Inténtalo de nuevo mas tarde.'),
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
}
