import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/sesiones/widgets/FitnessCard.dart';
import 'package:flutter_application_1/app/pages/sesiones/widgets/MyCustomButton.dart';
import 'package:flutter_application_1/app/pages/sesiones2/widgets/NavBar.dart';
import 'package:flutter_application_1/app/pages/sesiones2/widgets/TopBar.dart';

class Sesiones2 extends StatelessWidget {
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
              Color.fromRGBO(0, 141, 172, 1.0),],
          ),
        ),
        //color: Color.fromARGB(255, 33, 33, 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      //color: Color.fromARGB(87, 255, 255, 255),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Escoge tu forma de creacion de rutina',
                            //'Para comenzar, escoge cómo crear tu rutina:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/categorias');
                                  },
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                            //color: Color.fromARGB(
                                            //    255, 0, 172, 255),
                                            padding: EdgeInsets.all(2),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                'assets/humano.png',
                                                height: 270,
                                                width: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                          top: 10,
                                          child: Text(
                                            "Personaliza tu\nentrenamiento",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/categorias');
                                  },
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                            //color: Color.fromARGB(
                                            //    255, 0, 172, 255),
                                            padding: EdgeInsets.all(2),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                'assets/robot.png',
                                                height: 270,
                                                width: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                          top: 10,
                                          child: Text(
                                            "Entrenamiento\nrecomendado",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, '/lista');
                                  },
                                  style: (ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 172, 255),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 12))),
                                  child: Text(
                                    "Lista de rutinas",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            NavBar(),
          ],
        ),
      ),
    );
  }
}
