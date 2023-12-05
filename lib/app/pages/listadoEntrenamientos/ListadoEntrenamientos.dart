import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/utils/shared_preferences.dart';

class ListaEntrenamientos extends StatefulWidget {
  @override
  State<ListaEntrenamientos> createState() => _ListaEntrenamientosState();
}

class _ListaEntrenamientosState extends State<ListaEntrenamientos> {
  List<dynamic>? listaEntrenamientos;

  @override
  void initState() {
    super.initState();
    obtenerListaEntrenamientos();
  }

  Future<void> obtenerListaEntrenamientos() async {
    List<dynamic>? storedListaEntrenamientos =
        await StorageUtils.getListaEntrenamientos();
    setState(() {
      listaEntrenamientos = storedListaEntrenamientos;
      print(listaEntrenamientos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Entrenamientos'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: listaEntrenamientos == null
            ? Center(child: CircularProgressIndicator())
            : listaEntrenamientos!.isEmpty
                ? Center(child: Text('No hay entrenamientos disponibles.'))
                : ListView.builder(
                    itemCount: listaEntrenamientos!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            listaEntrenamientos![index]["fecha"].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            listaEntrenamientos![index]["completado"]
                                ? "Completado"
                                : "No completado",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            // Acción al hacer clic en un entrenamiento
                            onEntrenamientoTap(listaEntrenamientos![index]);
                          },
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  void onEntrenamientoTap(dynamic entrenamiento) async {
    await StorageUtils.saveEntrenamiento(entrenamiento);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/entrenamiento');
  }
}
