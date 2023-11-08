import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/sesiones2/widgets/TopBar.dart';

class PerfilUsuario extends StatelessWidget {
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
            ],
          ),
        ),
        child: Column(
          children: [
            TopBar(),
            SizedBox(height: MediaQuery.of(context).size.height * 1/6),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage("https://pbs.twimg.com/media/DoH8AVIUYAY2NV1.jpg"),
            ),
            Text(
              "Usuario",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text("\nEstatura cm\nPeso kg",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

            )
          ],
        ),
      ),
    );
  }
}
