import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String texto;
  MyCustomButton(this.texto);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {print("xd")},
      style: (
        ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 0, 172, 255),
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12)
        )
      ),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
