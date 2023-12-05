import 'dart:convert';
import '../../utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(2, 0, 36, 1.0),
              Color.fromRGBO(29, 29, 176, 1.0),
              Color.fromRGBO(0, 141, 172, 1.0),
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            SafeArea(
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo_pp_black-removebg-preview.png',
                width: 300,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        var url = "http://192.168.1.148:4001/login";

                        Map<String, String> data = {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        Map<String, String> headers = {
                          'Content-Type': 'application/json',
                        };
                        var response = await http.post(Uri.parse(url),
                            headers: headers, body: jsonEncode(data));
  
                        if (response.statusCode == 200) {
                          // ignore: use_build_context_synchronously
                          exito(context, response);
                          
                        } else {
                          // ignore: use_build_context_synchronously
                          mostrarModal(context);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      minimumSize: Size(300, 50),
                    ),
                    child:
                        Text("Iniciar sesión", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // iniciar sesión con Google
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo_google.png',
                            width: 24, height: 24),
                        SizedBox(width: 10),
                        Text("Iniciar sesión con Google"),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                  ElevatedButton(
                    onPressed: () {
                      // iniciar sesión con Facebook
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo_FB.png',
                            width: 24, height: 24),
                        SizedBox(width: 10),
                        Text("Iniciar sesión con Facebook"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarModal(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Inicio de sesión fallido'),
          content: Text('Credenciales incorrectas. Inténtalo de nuevo.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void exito(context, response) async {
    var respuesta = jsonDecode(response.body);
    String token = respuesta["token"];
    await StorageUtils.saveTokenToSharedPreferences(token);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
