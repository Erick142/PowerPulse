import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(182, 24, 24, 24),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print("a sesiones");
            },
            child: Column(
              children: [
                Icon(
                  Icons.timer,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Text(
                  "Sesiones",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print("a pulse");
            },
            child: Column(
              children: [
                Icon(
                  Icons.ac_unit,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Text(
                  "Pulse",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print("a progreso");
            },
            child: Column(
              children: [
                Icon(
                  Icons.checklist_rtl,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Text(
                  "Progreso",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
