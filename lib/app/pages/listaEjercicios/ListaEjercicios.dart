import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/listaEjercicios/widgets/ListItem.dart';

class ListaEjercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 33, 33, 33),
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
                      Icons.subdirectory_arrow_left_outlined,
                      color: Colors.white,
                    )
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "BICEPS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
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
