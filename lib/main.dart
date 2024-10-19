import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_turismo/views/Informacion.dart';
import 'firebase_options.dart';
import 'package:proyecto_turismo/views/Login_Pruebas.dart';
import 'package:proyecto_turismo/models/user.dart';
import 'package:proyecto_turismo/views/Login.dart';
import 'package:proyecto_turismo/views/Registro.dart';
import 'package:proyecto_turismo/views/users.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Etiqueta de Debug 
      /*title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      home: Itinerario(),
    );
  }
}

