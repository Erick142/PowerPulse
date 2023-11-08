import 'package:flutter/material.dart';

class MyCustomOutlineButton extends StatelessWidget {
  final String texto;
  MyCustomOutlineButton(this.texto);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12)),

      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
