import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_turismo/services/Firebase_selectImage.dart';
import 'package:proyecto_turismo/services/firebase_uploadImage.dart';
import 'package:proyecto_turismo/views/Informaci%C3%B3n.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/views/Migracion.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:proyecto_turismo/widgets/Buttons_Pagos.dart';
import 'package:proyecto_turismo/widgets/Subtitles.dart';



class GestionPagos extends StatefulWidget {
  const GestionPagos({super.key});

  @override
  State<GestionPagos> createState() => _GestionPagosState();
}

class _GestionPagosState extends State<GestionPagos> {

  File? imagen_to_upload;

  String? pagoSeleccionado;
   
  final List<String> pagos = [
    '1° Pago',
    '2° Pago',
    '3° Pago',
    '4° Pago',
    '5° Pago',
    '6° Pago',
    '7° Pago',
    '8° Pago',
    '9° Pago',
    '10° Pago',
    '11° Pago',
    '12° Pago',
    '13° Pago',
    '14° Pago',
    '15° Pago',
    '16° Pago',
    '17° Pago',
    '18° Pago',
    '19° Pago',
    '20° Pago',
    '21° Pago',
    '22° Pago',
    '23° Pago',
    '24° Pago',
  ];


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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    foregroundColor: Color(0xFF7D7D7D),
                    //foregroundImage: AssetImage('assets/images/usr.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Carlos Lopez',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                      Text(
                        'Próximo viajero',
                        style: TextStyle(
                          fontSize: 10
                        ),  
                      )
                    ],
                  )
                ],
              )
            ),
            const SizedBox(height: 20),
            const Subtitulos(
              subtitulo: 'Detalles de Pago',
              fontSize: 20,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 450,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 1,
                    )
                  ),
                  surfaceTintColor: const Color(0xFFC7C7C7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: imagen_to_upload != null
                        ? Image.file(
                            imagen_to_upload!,
                            fit: BoxFit.cover, // Ajusta la imagen dentro del Card
                            width: double.infinity,
                            height: 200, // Mantén la altura deseada
                          )
                        : Container(
                            margin: const EdgeInsets.all(10),
                            height: 200,
                            width: double.infinity,
                          ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 10
                              ),
                              child: Text(
                                'Cantidad del Pago',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 5
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Ejemplo: 2,500.00',
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFD1D1D1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0XFFD9D9D9),
                                      width: 1,
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0XFFD9D9D9),
                                      width: 1,
                                    )
                                  ),
                                  /*focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0XFFD9D9D9),
                                      width: 1,
                                    )
                                  ),*/
                                  filled: true,
                                  fillColor: const Color(0xFFF5F5F5),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10
                                  )
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF000000)
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Subtitulos(
              subtitulo: 'Adjuntar Imagen',
              fontSize: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5
              ),
              child: Container (
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFD9D9D9),
                    width: 1,
                  )
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    dropdownColor: const Color(0xFFFFFFFF),
                    value: pagoSeleccionado,
                    hint: const Text(
                      'Selecciona el Nº de pago',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                    items: pagos.map((String pago){
                      return DropdownMenuItem<String>(
                        value: pago,
                        child: Text(
                          pago,
                          style: const TextStyle(
                            color: Color(0xFF000000)
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? valor){
                      setState(() {
                        pagoSeleccionado = valor;
                      });
                    },
                    style: const TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 16,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonsPagos(
                  texto: 'Seleccionar Imagen', 
                  size: const Size(190, 42),
                  colorFondo: const Color(0xFFF0F0F0), 
                  colorTexto: const Color(0xFF000000), 
                  onPressed: () async {
                    final imagen = await getImage(); // Llama al método para seleccionar imagen
                    setState(() {
                      imagen_to_upload = File(imagen!.path); // Almacena la imagen seleccionada
                    });
                  },
                ),
                const SizedBox( width: 20,),
                ButtonsPagos(
                  texto: 'Subir Imagen', 
                  size: const Size(190, 42),
                  colorFondo: const Color(0xFF272727), 
                  colorTexto: const Color(0xFFD30000), 
                  onPressed: () async {
                    if (imagen_to_upload == null) {
                      return;
                    }
                    final uploaded = await uploadImage(imagen_to_upload!); // Llama al método para subir imagen
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
    
    
    
    
    /*Scaffold(
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
    );*/
  }
}