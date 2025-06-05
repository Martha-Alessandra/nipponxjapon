import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Informacion.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
 
class ExploraItinerario extends StatelessWidget {
 
const ExploraItinerario({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guía de Actividades', 
          style: TextStyle(
            color: Color(0xFFD30000),
            fontSize: 30,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF272727),
        shadowColor: Colors.grey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: const Color(0xFFD30000),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Menudesplegable(
        iconoPrimerMenu: Icons.calendar_month_rounded, 
        textoPrimerMenu: 'Itinerario', 
        PrimerFuncionMenu: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Itinerario()
            )
          );
        },
        iconoSegundoMenu: Icons.credit_card, 
        textoSegundoMenu: 'Gestión de Pagos', 
        SegundoFuncionMenu: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const GestionPagos()
            )
          );
        },
        iconoTercerMenu: Icons.people, 
        textoTercerMenu: 'Sobre Nosotros', 
        TercerFuncionMenu: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Informacion()
            )
          );
        },
        iconoCuartoMenu: Icons.library_books_outlined,
        textoCuartoMenu: 'Registros Turísticos',
        CuartaFuncionMenu: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Itinerario()
            )
          );
        },
      ),
      body: const SingleChildScrollView(

      ),
    );
  }
}