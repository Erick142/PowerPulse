import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/pantallaInicio/widgets/MyCustomOutlineButton.dart';
import 'package:flutter_application_1/app/pages/sesiones/widgets/MyCustomButton.dart';

class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 33, 33, 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(),
            ),
            Image.asset(
              'assets/logo_pp_black-removebg-preview.png'
            ),
            SizedBox(height: 38),
            Image.asset(
              'assets/pngwing.com (1).png'
            ),
            SizedBox(height: 38),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/sesiones')
                  },
                  style: (
                    ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 172, 255),
                      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12)
                    )
                  ),
                  child: Text(
                    "COMENZAR",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                MyCustomOutlineButton("Ya tengo cuenta")
              ],
            )
          ],
        ),
      ),
    );
  }
}
