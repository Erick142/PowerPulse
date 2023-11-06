import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(child: Container()),
        Container(
          color: Color.fromARGB(255, 24, 24, 24),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    print("config");
                  },
                  icon: Icon(
                    Icons.ac_unit,
                    color: Color.fromARGB(255, 0, 172, 255),
                  )
              ),
              Image.asset(
                'assets/xd.png',
                height: 26,
                width: 210,
                fit: BoxFit.fitHeight,
              ),
              IconButton(
                  onPressed: () {
                    print("user");
                  },
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 0, 172, 255),
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
