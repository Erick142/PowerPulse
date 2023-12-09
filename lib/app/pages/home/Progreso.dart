import 'dart:convert';
import 'package:flutter_application_1/app/pages/listadoEntrenamientos/ListadoEntrenamientos.dart';
import 'package:flutter_application_1/app/utils/datos.dart';
import "package:http/http.dart" as http;
import "../../utils/shared_preferences.dart";
import 'package:flutter/material.dart';

class CalendarApp extends StatefulWidget {
  final String token;

  CalendarApp(this.token);
  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  bool cargando = true;
  DateTime _currentMonth = DateTime.now();
  List<dynamic> entrenamientos = [];

  void initState() {
    super.initState();
    // Llama a la función para obtener el token al inicio del widget
    obtenerData();
  }

  // Función para obtener el token y redirigir si está vacío
  Future<void> obtenerData() async {
    try {
      var url = "http://${Datos.IP}/entrenamiento/miprogreso/${widget.token}";

      var response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          entrenamientos = jsonDecode(response.body)["entrenamientos"];
          print(entrenamientos);
          cargando = false;
        });
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  bool revisar(diaDelMesActual, numeroDeMesActual, numeroDeAnioActual) {
    if (entrenamientos.isEmpty) {
      return false;
    }
    // Verificar si hay algún entrenamiento en la fecha actual
    bool hayEntrenamiento = entrenamientos.any((entrenamiento) {
      DateTime fechaEntrenamiento = DateTime.parse(entrenamiento["fecha"]);
      return fechaEntrenamiento.year == numeroDeAnioActual &&
          fechaEntrenamiento.month == numeroDeMesActual &&
          fechaEntrenamiento.day == diaDelMesActual;
    });

    return hayEntrenamiento;
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;

    return cargando
      ? Text("cargando....", style: TextStyle(color: Colors.white),)
      : Column(
          children: [
            CalendarHeader(
              year: _currentMonth.year,
              month: _currentMonth.month,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentMonth = DateTime(
                          _currentMonth.year, _currentMonth.month - 1);
                    });
                  },
                  child: Text('Anterior Mes'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentMonth = DateTime(
                          _currentMonth.year, _currentMonth.month + 1);
                    });
                  },
                  child: Text('Siguiente Mes'),
                ),
              ],
            ),
            for (int i = 0; i < daysInMonth; i += 7)
              buildCalendarRow(i, daysInMonth),
          ],
        );
  }

  Widget buildCalendarRow(int startDay, int daysInMonth) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int day = startDay + 1; day <= startDay + 7; day++)
              if (day <= daysInMonth)
                Container(
                    margin: EdgeInsets.only(right: day < startDay + 7 ? 10 : 0),
                    child: entrenamientos.isEmpty
                        ? DefaultBox(day)
                        : revisar(day, _currentMonth.month, _currentMonth.year)
                            ? DayWidget(
                                token: widget.token,
                                dia: day,
                                mes: _currentMonth.month,
                                year: _currentMonth.year)
                            : DefaultBox(day))
              else
                Container(
                  margin: EdgeInsets.only(right: day < startDay + 7 ? 10 : 0),
                  width: 46,
                  height: 46,
                ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CalendarHeader extends StatelessWidget {
  final int year;
  final int month;

  CalendarHeader({required this.year, required this.month});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$year',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          _getMonthName(month),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Enero';
      case 2:
        return 'Febrero';
      case 3:
        return 'Marzo';
      case 4:
        return 'Abril';
      case 5:
        return 'Mayo';
      case 6:
        return 'Junio';
      case 7:
        return 'Julio';
      case 8:
        return 'Agosto';
      case 9:
        return 'Septiembre';
      case 10:
        return 'Octubre';
      case 11:
        return 'Noviembre';
      case 12:
        return 'Diciembre';
      default:
        return '';
    }
  }
}

class DefaultBox extends StatelessWidget {
  final int day;

  DefaultBox(this.day);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Fondo transparente
          border: Border.all(color: Colors.blue), // Contorno azul
          borderRadius: BorderRadius.circular(6),
        ),
        width: 46,
        height: 46,
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(color: Colors.white), // Texto blanco
          ),
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final String token;
  final int dia;
  final int mes;
  final int year;

  DayWidget(
      {required this.token,
      required this.dia,
      required this.mes,
      required this.year});

  Future<void> _handleTap(context) async {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ListaEntrenamientos(token, dia, mes, year)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 46,
          height: 46,
          color: Colors.blue, // Cambiado a azul
          child: Center(
            child: Text(
              '$dia', // Utiliza el día proporcionado
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}