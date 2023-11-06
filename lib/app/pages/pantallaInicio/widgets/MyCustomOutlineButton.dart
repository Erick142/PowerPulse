import 'package:flutter/material.dart';

class MyCustomOutlineButton extends StatelessWidget {
  final String texto;
  MyCustomOutlineButton(this.texto);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color.fromARGB(255, 0, 172, 255)),
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12)),
      onPressed: () {
        print("xd");
      },
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
