import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/verEntrenamiento/VerEntrenamiento.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import 'package:flutter_application_1/app/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ListaEntrenamientos extends StatefulWidget {
  final String token;
  final int dia;
  final int mes;
  final int year;

  ListaEntrenamientos(this.token, this.dia, this.mes, this.year);
  @override
  State<ListaEntrenamientos> createState() => _ListaEntrenamientosState();
}

class _ListaEntrenamientosState extends State<ListaEntrenamientos> {
  bool cargando = true;
  late List<dynamic> listaEntrenamientos;

  @override
  void initState() {
    super.initState();
    obtenerListaEntrenamientos();
  }

  Future<void> obtenerListaEntrenamientos() async {
    try {
      var url = "http://${Datos.IP}/entrenamiento/dia";

      Map<String, dynamic> datos = {
        "token": widget.token,
        "dia": widget.dia,
        "mes": widget.mes,
        "year": widget.year
      };

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(datos));

      if (response.statusCode == 200) {
        setState(() {
          listaEntrenamientos = jsonDecode(response.body);
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
      appBar: AppBar(
        title: Text('Lista de Entrenamientos'),
      ),
      body: cargando
        ? Text("cargando...")
        : Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: listaEntrenamientos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  listaEntrenamientos[index]["fecha"].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  listaEntrenamientos[index]["completado"]
                      ? "Completado"
                      : "No completado",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> VerEntrenamiento(widget.token, listaEntrenamientos[index]["_id"]))
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

}
