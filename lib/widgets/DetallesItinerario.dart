import 'package:flutter/material.dart';

class DetallesViaje extends StatelessWidget{
  final IconData imagenIcono;
  final String encabezado;
  final String detalleViaje;

  const DetallesViaje({
    super.key,
    required this.imagenIcono,
    required this.encabezado,
    required this.detalleViaje
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(
        right: 35,
      ),
      child:  Row(
        children: [
          const SizedBox(width: 28),
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFFEBEBEB),
            child: Icon(imagenIcono),
          ),
          const SizedBox(width: 20),
          Text(
            encabezado,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  detalleViaje,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}