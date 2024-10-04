import 'package:flutter/material.dart';
import 'package:proyecto_turismo/models/actividades_md.dart';

class ActividadView extends StatelessWidget {
  const ActividadView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de ciudades únicas
    final ciudades = actividades.map((actividad) => actividad.ciudad).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades por Ciudad'),
      ),
      body: ListView.builder(
        itemCount: ciudades.length,
        itemBuilder: (context, index) {
          final ciudad = ciudades[index];
          // Filtrar las actividades por ciudad
          final actividadesPorCiudad = actividades.where((actividad) => actividad.ciudad == ciudad).toList();

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              title: Text(
                ciudad,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: actividadesPorCiudad.map((actividad) {
                return ListTile(
                  title: Text(actividad.nombreActividad),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
