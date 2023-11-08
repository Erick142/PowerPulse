import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/pantallaInicio/widgets/MyCustomOutlineButton.dart';

class PantallaInicio extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/logo_pp_black-removebg-preview.png',
                width: 300,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/pngwing.com (1).png'),
            SizedBox(height: 20),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromARGB(255, 0, 172, 255),
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                  ),
                  child: Text(
                    "COMENZAR",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                MyCustomOutlineButton("Ya tengo cuenta"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

