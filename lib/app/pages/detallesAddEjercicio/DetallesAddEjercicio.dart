import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/categorias/widgets/FitnessCard.dart';
import 'package:flutter_application_1/app/pages/categorias/widgets/MyCustomButton.dart';

class DetallesAddEjercicio extends StatelessWidget {
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
                Color.fromRGBO(0, 141, 172, 1.0),
              ], // Colores de tu degradado
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => {print("object")},
                        icon: Icon(
                          Icons.subdirectory_arrow_left,
                          size: 26,
                          color: Color.fromARGB(255, 0, 172, 255),
                        )),
                  ],
                ),
              ),
              Expanded(
                //color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dumbbell Lateral Raise",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                      child: Column(
                        children: [
                          Image.asset('assets/ejercicioguia.png'),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Series",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SliderExample()
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sesiones",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SliderExample()
                            ],
                          ),
                          MyCustomButton("Agregar")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 12;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 32,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
