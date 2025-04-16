import 'package:flutter/material.dart';

class DescripcionHotel extends StatelessWidget {
  final String descripcion;
  final String icono;

  const DescripcionHotel({
    super.key,
    required this.descripcion,
    this.icono = '🏞️', // Icono por defecto es el reloj como en tu ejemplo
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                icono,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            // Descripción
            Expanded(
              child: Text(
                descripcion,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}