import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_turismo/utils/auth.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_turismo/views/Registro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginSate createState() => _LoginSate();
}

class _LoginSate extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      body: SingleChildScrollView( // Asegura que todo el contenido sea visible
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
            Container(
              height: 220,
              width: 385,
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
                    padding: const EdgeInsets.only(
                        bottom: 3, top: 20, left: 28, right: 28),
                    child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8E2BB),
                        borderRadius: const BorderRadius.all(Radius.circular(9)),
                        border: Border.all(
                            color: const Color(0xFFF6DCAC), width: 1),
                      ),
                      child: TextField(
                        controller: emailController, // Asociar el controlador
                        decoration: const InputDecoration(
                          hintText: 'Correo',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 2, top: 5, left: 28, right: 28),
                    child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8E2BB),
                        borderRadius: const BorderRadius.all(Radius.circular(9)),
                        border: Border.all(
                            color: const Color(0xFFF6DCAC), width: 1),
                      ),
                      child: TextField(
                        controller: passwordController, // Asociar el controlador
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 39,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 1,
                          left: 1,
                          right: 1,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Registro()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFEF762F),
                              foregroundColor: const Color(0xFFFFFFFF),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2),
                              fixedSize: const Size(145, 42),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text('REGISTRARSE'),
                        ),
                      ),
                      Container(
                        width: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 1,
                          left: 1,
                          right: 1,
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Por favor, complete todos los campos.'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              return;
                            }

                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();

                            var result = await _authService
                                .SignInEmailAndPassword(email, password);

                            if (result == 1 || result == 2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error en el usuario o contraseña'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else if (result != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Itinerario()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Ocurrió un error. Inténtalo nuevamente.'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFEF762F),
                              foregroundColor: const Color(0xFFFFFFFF),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.2),
                              fixedSize: const Size(140, 42),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: const Text('INICIAR SESION'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
