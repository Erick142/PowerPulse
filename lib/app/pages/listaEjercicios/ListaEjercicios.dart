import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/widgets/ListItem.dart';

class ListaEjercicios extends StatelessWidget {
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){

                    }, 
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 50,
                      color: Colors.white,
                    )
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20), // Ajusta el valor top según tus necesidades
                  child: Text(
                  "Bíceps",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                  ListItem(),
                  SizedBox(height: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
