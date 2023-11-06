import 'package:flutter/material.dart';

class FitnessCard extends StatefulWidget {
  final String url;
  final String nombre;

  FitnessCard(this.url, this.nombre);

  @override
  FitnessCardState createState() {
    return FitnessCardState();
  }
}

class FitnessCardState extends State<FitnessCard> {
  bool status = false;

  void toggleStatus() {
    setState(() {
      status = !status;
    });
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          toggleStatus();
        },
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: (status)?Color.fromARGB(255, 0, 172, 255):Colors.white,
                      padding: EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.url,
                          height: 200,
                          width: 152,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Text(
                  widget.nombre,
                  style: TextStyle(
                      color: (status)?Color.fromARGB(255, 0, 172, 255):Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Icon(
                Icons.task_alt,
                color: (status)
                    ? Color.fromARGB(255, 0, 172, 255)
                    : Color.fromARGB(0, 0, 172, 255),
                size: 44,
              ),
            )
          ],
        ));
  }
}
