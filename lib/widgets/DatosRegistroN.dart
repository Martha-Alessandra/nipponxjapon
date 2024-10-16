import 'package:flutter/material.dart';
 
class Datosregistro extends StatelessWidget {
  final String encabezado;
  final String contenido;
 
  const Datosregistro({
    super.key,
    required this.encabezado,
    required this.contenido
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: encabezado,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: contenido
            )
          ]
        )
      )
    );
  }
}