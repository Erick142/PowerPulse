import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/pantallaInicio/PantallaInicio.dart';
import 'package:flutter_application_1/app/pages/perfilUsuario/PerfilUsuario.dart';

class TopBar extends StatelessWidget {
  final String token;

  TopBar(this.token);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: Container()),
        Container(
          //color: Color.fromARGB(255, 24, 24, 24),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> PantallaInicio())
                    );
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 40,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              Image.asset(
                'assets/xd.png',
                height: 70,
                width: 220,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> PerfilUsuario(token))
                    );
                  },
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
