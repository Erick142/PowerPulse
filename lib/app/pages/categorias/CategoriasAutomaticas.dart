import 'dart:convert';
import 'package:flutter_application_1/app/pages/verEntrenamiento/VerEntrenamiento.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/utils/shared_preferences.dart';

class CategoriasAutomaticas extends StatefulWidget {
  @override
  State<CategoriasAutomaticas> createState() => _CategoriasAutomaticas();
}

class _CategoriasAutomaticas extends State<CategoriasAutomaticas> {
  Set<String> selectedCards = Set<String>();

  void updateSelectedCards(String nombre, bool status) {
    setState(() {
      if (status) {
        selectedCards.add(nombre);
      } else {
        selectedCards.remove(nombre);
      }
    });

    print("Tarjetas seleccionadas: $selectedCards");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Color.fromARGB(255, 33, 33, 33),
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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 50,
                        color: Color.fromARGB(255, 0, 172, 255),
                      )),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        String? storedToken =
                            await StorageUtils.getTokenFromSharedPreferences();
                        if (storedToken == null || storedToken.isEmpty) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(
                              context, '/'); // Redirigir a la ruta "/"
                        } else {
                          var url =
                              "http://192.168.1.148:4001/entrenamiento/auto";

                          Map<String, dynamic> data = {
                            "token": storedToken,
                            "musculos": selectedCards.toList(),
                          };
                          Map<String, String> headers = {
                            'Content-Type': 'application/json',
                          };
                          var response = await http.post(Uri.parse(url),
                              headers: headers, body: jsonEncode(data));

                          if (response.statusCode == 200) {
                            var respuesta = jsonDecode(response.body);
                            StorageUtils.saveEntrenamiento(respuesta["entrenamiento"]);
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context,"/entrenamiento");
                          } else {
                            print("No");
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color.fromARGB(255, 0, 172, 255),
                      padding:
                          EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                    ),
                    child: Text(
                      "ENTRAR",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable(
                        url:
                            "https://hips.hearstapps.com/hmg-prod/images/body-builder-training-in-industrial-urban-gym-royalty-free-image-1620123342.?crop=0.721xw:1.00xh;0,0&resize=1200:*",
                        nombre: "BICEPS",
                        onStatusChanged: (nombre, status) {
                          updateSelectedCards(nombre, status);
                        },
                      ),
                      FitnessCardActivable(
                          url:
                              "https://www.tjlipo.com/wp-content/uploads/2020/11/3-Pectoral-Augmentation-1024x1024.jpg",
                          nombre: "PECHO",
                          onStatusChanged: (nombre, status) {
                            updateSelectedCards(nombre, status);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable(
                        url:
                            "https://hips.hearstapps.com/hmg-prod/images/back-view-of-a-muscled-black-male-royalty-free-image-1598005441.jpg",
                        nombre: "ESPALDA",
                        onStatusChanged: (nombre, status) {
                          updateSelectedCards(nombre, status);
                        },
                      ),
                      FitnessCardActivable(
                        url:
                            "https://as01.epimg.net/deporteyvida/imagenes/2020/12/22/portada/1608627733_687004_1608627919_noticia_normal.jpg",
                        nombre: "ABDOMINALES",
                        onStatusChanged: (nombre, status) {
                          updateSelectedCards(nombre, status);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable(
                        url:
                            "https://img.freepik.com/premium-photo/kettlebell-weight-exercise_1098-11984.jpg",
                        nombre: "PIERNAS",
                        onStatusChanged: (nombre, status) {
                          updateSelectedCards(nombre, status);
                        },
                      ),
                      FitnessCardActivable(
                        url: "https://i.ytimg.com/vi/ldO-Vfzx63M/hqdefault.jpg",
                        nombre: "HOMBRO",
                        onStatusChanged: (nombre, status) {
                          updateSelectedCards(nombre, status);
                        },
                      ),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class FitnessCardActivable extends StatefulWidget {
  final String url;
  final String nombre;
  final Function(String, bool) onStatusChanged; // Nuevo callback

  FitnessCardActivable(
      {required this.url, required this.nombre, required this.onStatusChanged});

  @override
  State createState() {
    return _FitnessCardActivable();
  }
}

class _FitnessCardActivable extends State<FitnessCardActivable> {
  bool status = false;

  void toggleStatus() {
    setState(() {
      status = !status;
    });
    print(status);
    widget.onStatusChanged(widget.nombre, status);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          toggleStatus();
        },
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: (status)
                          ? Color.fromARGB(255, 0, 172, 255)
                          : Colors.white,
                      padding: EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.url,
                          height: 200,
                          width: 152,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Text(
                  widget.nombre,
                  style: TextStyle(
                      color: (status)
                          ? Color.fromARGB(255, 0, 172, 255)
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Icon(
                Icons.task_alt,
                color: (status)
                    ? Color.fromARGB(255, 0, 172, 255)
                    : Color.fromARGB(0, 0, 172, 255),
                size: 44,
              ),
            )
          ],
        ));
  }
}
