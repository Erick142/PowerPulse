import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/SeleccionDeTipoDeEntrenamiento.dart';
import 'package:flutter_application_1/app/pages/seleccionDeTipoDeEntrenamiento/widgets/TopBar.dart';

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
    Text(
      'Index 2: School',
    ),
    
  ];

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
              Color.fromRGBO(0, 141, 172, 1.0),], // Colores de tu degradado
          ),
        ),
        //color: Color.fromARGB(255, 33, 33, 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(),
            _widgetOptions[_selectedIndex]
            ,
            BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 24, 24, 24),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timer,
                    size: 40
                  ),
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