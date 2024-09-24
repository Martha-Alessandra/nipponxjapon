import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_turismo/services/Firebase_selectImage.dart';
import 'package:proyecto_turismo/services/firebase_uploadImage.dart';
import 'package:proyecto_turismo/views/Informaci%C3%B3n.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/views/Migracion.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';



class GestionPagos extends StatefulWidget {
  const GestionPagos({super.key});

  @override
  State<GestionPagos> createState() => _GestionPagosState();
}

class _GestionPagosState extends State<GestionPagos> {

   File? imagen_to_upload;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestión de Pagos', 
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
        iconoSegundoMenu: Icons.edit_document, 
        textoSegundoMenu: 'Migración y Pasaporte', 
        SegundoFuncionMenu: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Migracion()
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
      ),
      body: Column(
        children: [
          imagen_to_upload !=null ? Image.file(imagen_to_upload!) :
          Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            color: Colors.red,
          ),
          ElevatedButton(
            onPressed: () async{
              final imagen = await getImage();
              setState(() {
                imagen_to_upload = File(imagen!.path);
              });
            },
             child : const Text("Seleccionar Imagen")
             ),
             
          ElevatedButton(
            onPressed: () async{
              if(imagen_to_upload == null){
                return;

              }
              final uploaded = await uploadImage(imagen_to_upload!);
            }, child : const Text("Subir Imagen")
            ),

        ], 
      )
    );
  }
}