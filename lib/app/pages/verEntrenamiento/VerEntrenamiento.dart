import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import 'package:flutter_application_1/app/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VerEntrenamiento extends StatefulWidget {
  @override
  State<VerEntrenamiento> createState() => _VerEntrenamiento();
}

class _VerEntrenamiento extends State<VerEntrenamiento> {
  List<dynamic> listaEjercicios = [];
  bool comletado = false;
  String id = "";

  @override
  void initState() {
    super.initState();
    // Llama a la función para obtener el token al inicio del widget
    obtenerData();
  }

  // Función para obtener el token y redirigir si está vacío
  Future<void> obtenerData() async {
    Map<String, dynamic>? storedEntrenamiento =
        await StorageUtils.getEntrenamiento();
    print(storedEntrenamiento);
    if (storedEntrenamiento == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/'); // Redirigir a la ruta "/"
    } else {
      setState(() {
        listaEjercicios = storedEntrenamiento["ejercicios"];
        comletado = storedEntrenamiento["completado"];
        id = storedEntrenamiento["_id"];
      });
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
            ], // Colores de tu degradado
          ),
        ),
        child: Column(
          children: [
            TopBar(),
            listaEjercicios.isEmpty
                ? Expanded(child: Container())
                : Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(12),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Entrenamiento",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        for (int i = 0; i < listaEjercicios.length; i++)
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  color: Color.fromARGB(255, 80, 77, 77),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listaEjercicios[i]["nombre"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Guia:",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              listaEjercicios[i]["descripcion"],
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        color: Color.fromARGB(255, 48, 48, 48),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Sesiones: ${listaEjercicios[i]["sesiones"]}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Repeticiones: ${listaEjercicios[i]["repeticiones"]}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          )
                      ],
                    ),
                  ),
            comletado
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () async {
                      try {
                        var url =
                            "http://${Datos.IP}/entrenamiento/completar/$id";

                        var response = await http.post(Uri.parse(url));
                        if (response.statusCode == 200) {
                          var respuesta = jsonDecode(response.body);
                          print(respuesta);
                          StorageUtils.saveEntrenamiento(respuesta);
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, "/home");
                        } else {
                          print("No");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Marcar como completado"))
          ],
        ),
      ),
    );
  }
}
