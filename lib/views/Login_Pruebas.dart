import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:flutter/services.dart';

class Login_Pruebas extends StatefulWidget {
  const Login_Pruebas({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login_Pruebas> {
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 140.0),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: const Text(
                  "NIPPON",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Rubik',
                  ),
                ), 
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  "X JAPON",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Rubik',
                  ),
                ), 
              ),
              Container(
                margin: const EdgeInsets.only(left: 100),
                child: const Text(
                  "Viviendo Japón",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  ),
                ), 
              ),
              const SizedBox(height: 120),
              AnimatedContainer(
                height: 220,
                duration: const Duration(milliseconds: 500),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE80000),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  border: Border.all(
                    color: const Color(0xFFEF762F),
                    width: 3,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8E2BB),
                          borderRadius: const BorderRadius.all(Radius.circular(9)),
                          border: Border.all(color: const Color(0xFFF6DCAC), width: 1),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Correo',
                            disabledBorder:InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.mail),
                            iconColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8E2BB),
                          borderRadius: const BorderRadius.all(Radius.circular(9)),
                          border: Border.all(color: const Color(0xFFF6DCAC), width: 1),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            disabledBorder:InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock),
                            iconColor: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    if (isRegistering)
                      const SizedBox(height: 8),
                    if (isRegistering)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8E2BB),
                            borderRadius: const BorderRadius.all(Radius.circular(9)),
                            border: Border.all(color: const Color(0xFFF6DCAC), width: 1),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Confirmar Contraseña',
                              disabledBorder:InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock_outline),
                              iconColor: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 28.0),
                      child: GestureDetector(
                        onTap: () {
                          print("x");
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isRegistering = !isRegistering;
                            });
                          },
                          style: TextButton.styleFrom(
                            enabledMouseCursor: SystemMouseCursors.click,
                            backgroundColor: const Color(0xFFEF762F),
                            foregroundColor: const Color(0xFFFFFFFF),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.2
                            ),
                            fixedSize: const Size(145, 42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: const Text('REGISTRARSE'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Itinerario())
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFEF762F),
                            foregroundColor: const Color(0xFFFFFFFF),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.2
                            ),
                            fixedSize: const Size(140, 42),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: const Text('ENTRAR'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
