// Función para almacenar el token en SharedPreferences
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static Future<void> saveTokenToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> saveEntrenamiento(Map<String, dynamic> entrenamiento) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String entrenamientoString = jsonEncode(entrenamiento);
    prefs.setString('entrenamiento', entrenamientoString);
  }

  static Future<Map<String, dynamic>?> getEntrenamiento() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? entrenamientoString = prefs.getString('entrenamiento');

    if (entrenamientoString != null) {
      Map<String, dynamic> entrenamiento = jsonDecode(entrenamientoString);
      return entrenamiento;
    } else {
      return null;
    }
  }

  static Future<void> saveListaEntrenamientos(List<dynamic> entrenamiento) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String entrenamientoString = jsonEncode(entrenamiento);
    prefs.setString('listaEntrenamiento', entrenamientoString);
  }

  static Future<List<dynamic>?> getListaEntrenamientos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? entrenamientoString = prefs.getString('listaEntrenamiento');

    if (entrenamientoString != null) {
      List<dynamic> entrenamiento = jsonDecode(entrenamientoString);
      return entrenamiento;
    } else {
      return null;
    }
  }
}