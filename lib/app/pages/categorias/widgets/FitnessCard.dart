import 'package:flutter/material.dart';

class FitnessCard extends StatelessWidget {
  final String url;
  final String nombre;

  FitnessCard(this.url, this.nombre);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/lista");
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    url,
                    height: 200,
                    width: 152,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Text(
            nombre,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      )
    );
  }
}