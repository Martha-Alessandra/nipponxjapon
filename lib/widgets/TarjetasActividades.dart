import 'package:flutter/material.dart';

class TarjetaActividades extends StatelessWidget{
  final String imagen;
  final String nombre;
  final String dia;

  const TarjetaActividades({
    super.key,
    required this.imagen,
    required this.nombre,
    required this.dia
  });

  @override
  Widget build (BuildContext context){
    return SizedBox(
      width: 235,
      height: 320,
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
                  height: 230,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dia,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100
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