import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/home/Home.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import 'package:flutter_application_1/app/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VerEntrenamiento extends StatefulWidget {
  final String token;
  final String idEntrenamiento;

  VerEntrenamiento(this.token, this.idEntrenamiento);
  @override
  State<VerEntrenamiento> createState() => _VerEntrenamiento();
}

class _VerEntrenamiento extends State<VerEntrenamiento> {
  bool cargando = true;
  late Map<String, dynamic> entrenamiento;
  late bool completado;

  @override
  void initState() {
    super.initState();
    // Llama a la función para obtener el token al inicio del widget
    obtenerData();
  }

  Future<void> obtenerData() async {
    try {
      var url = "http://${Datos.IP}/entrenamiento/${widget.idEntrenamiento}";

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          entrenamiento = jsonDecode(response.body);
          print(entrenamiento);
          completado = entrenamiento["completado"];
          cargando = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cargando
          ? Text("cargando...")
          : Container(
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
                  TopBar(widget.token),
                  Expanded(
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
                        for (int i = 0;
                            i < entrenamiento["ejercicios"].length;
                            i++)
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
                                              entrenamiento["ejercicios"][i]["nombre"],
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
                                              entrenamiento["ejercicios"][i]["descripcion"],
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
                                                  "Sesiones: ${entrenamiento["ejercicios"][i]["sesiones"]}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Repeticiones: ${entrenamiento["ejercicios"][i]["repeticiones"]}",
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
                  completado
                      ? SizedBox()
                      : ElevatedButton(
                          onPressed: () async {
                            try {
                              var url =
                                  "http://${Datos.IP}/entrenamiento/completar/${widget.idEntrenamiento}";

                              var response = await http.post(Uri.parse(url));
                              if (response.statusCode == 200) {
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> Home(widget.token))
                                );
                              } else {
                                print("error");
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
