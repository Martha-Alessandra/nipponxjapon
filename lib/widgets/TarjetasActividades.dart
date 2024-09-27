import 'package:flutter/material.dart';

class TarjetaActividades extends StatelessWidget{
  final String etiqueta;
  final String imagen;
  final String nombre;
  final String duracion;

  const TarjetaActividades({
    super.key,
    required this.etiqueta,
    required this.imagen,
    required this.nombre,
    required this.duracion
  });

  @override
  Widget build (BuildContext context){
    return SizedBox(
      width: 230,
      height: 310,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)
                    ),
                    child: Image.asset(
                      imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(
                      etiqueta,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    duracion,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}