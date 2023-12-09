import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/perfilUsuario/PerfilUsuario.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import 'package:http/http.dart' as http;
import '../../utils/shared_preferences.dart';

class UpdateUser extends StatefulWidget {
  final String token;

  UpdateUser(this.token);
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController edadController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar Usuario'),
      ),
      body: Container(
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
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: nombreController,
                      decoration: InputDecoration(
                        hintText: "Nombre",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: pesoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Peso",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: alturaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Altura",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: edadController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Edad",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        var url = "http://${Datos.IP}/usuarios/perfil/editar";

                        Map<String, dynamic> data = {
                          "nombre": nombreController.text,
                          "peso": pesoController.text,
                          "altura": alturaController.text,
                          "edad": edadController.text,
                          "token": widget.token
                        };

                        print(data);
                        Map<String, String> headers = {
                          'Content-Type': 'application/json',
                        };

                        var response = await http.put(Uri.parse(url),
                            headers: headers, body: jsonEncode(data));

                        if (response.statusCode == 200) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PerfilUsuario(widget.token)));
                        } else {
                          // ignore: use_build_context_synchronously
                          mostrarModal(context, response);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      minimumSize: Size(300, 50),
                    ),
                    child: Text("Actualizar Usuario",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarModal(context, response) {
    var respuesta = jsonDecode(response.body);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error al actualizar usuario'),
          content: Text(respuesta["error"]),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
