import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_turismo/services/Firebase_selectImage.dart';
import 'package:proyecto_turismo/services/firebase_uploadImage.dart';



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
        title: const Text('Gestión de Pagos'),
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