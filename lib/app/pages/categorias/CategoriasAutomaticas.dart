import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/categorias/widgets/FitnessCardActivable.dart';
import 'package:flutter_application_1/app/pages/categorias/widgets/MyCustomButton.dart';
class CategoriasAutomaticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Color.fromARGB(255, 33, 33, 33),
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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: ()=>{
                      print("object")
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 50,
                      color: Color.fromARGB(255, 0, 172, 255),
                    )
                  ),
                  MyCustomButton("Generar rutina")
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable("https://hips.hearstapps.com/hmg-prod/images/body-builder-training-in-industrial-urban-gym-royalty-free-image-1620123342.?crop=0.721xw:1.00xh;0,0&resize=1200:*", "BICEPS"),
                      FitnessCardActivable("https://www.tjlipo.com/wp-content/uploads/2020/11/3-Pectoral-Augmentation-1024x1024.jpg", "PECHO"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable("https://hips.hearstapps.com/hmg-prod/images/back-view-of-a-muscled-black-male-royalty-free-image-1598005441.jpg", "ESPALDA"),
                      FitnessCardActivable("https://as01.epimg.net/deporteyvida/imagenes/2020/12/22/portada/1608627733_687004_1608627919_noticia_normal.jpg", "ABDOMINALES"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitnessCardActivable("https://img.freepik.com/premium-photo/kettlebell-weight-exercise_1098-11984.jpg", "PIERNAS"),
                      FitnessCardActivable("https://cdn0.psicologia-online.com/es/posts/9/4/1/que_es_el_alma_en_psicologia_5149_600_square.jpg", "ALMA"),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
