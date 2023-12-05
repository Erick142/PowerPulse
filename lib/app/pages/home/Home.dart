import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/home/Progreso.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/SeleccionDeTipoDeEntrenamiento.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';
import '../../utils/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SeleccionDeTipoDeEntrenamiento(),
    Text(
      'Index 1: Business',
    ),
    CalendarApp(),
  ];
  @override
  void initState() {
    super.initState();
    // Llama a la función para obtener el token al inicio del widget
    _checkToken();
  }

  // Función para obtener el token y redirigir si está vacío
  Future<void> _checkToken() async {
    String? storedToken = await StorageUtils.getTokenFromSharedPreferences();
    if (storedToken == null || storedToken.isEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/'); // Redirigir a la ruta "/"
    }

    print("stored token:$storedToken");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        //color: Color.fromARGB(255, 33, 33, 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(),
            _widgetOptions[_selectedIndex],
            BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 24, 24, 24),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer, size: 40),
                  label: 'Sesiones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.ac_unit,
                    size: 40,
                  ),
                  label: 'PULSE',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.checklist_rtl,
                    size: 40,
                  ),
                  label: 'Progreso',
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.white,
              selectedItemColor: Color.fromARGB(255, 0, 172, 255),
              onTap: _onItemTapped,
            )
          ],
        ),
      ),
    );
  }
}
