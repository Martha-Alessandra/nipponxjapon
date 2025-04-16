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
        title: const Text(
          'Actividades por Ciudad',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF3D3D3D),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF272727),
              Color(0xFF121212),
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: ciudades.length,
            itemBuilder: (context, index) {
              final ciudad = ciudades[index];
              final actividadesPorCiudad = actividades
                .where((actividad) => actividad.ciudad == ciudad)
                .toList();

              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12) 
                ),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD30000).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Color(0xFFD30000),
                    ),
                  ),
                  title: Text(
                    ciudad,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF272727)
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: actividadesPorCiudad.map((actividad) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFD30000),
                                      width: 2,
                                    )
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Color(0xFFD30000),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    actividad.nombreActividad,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8)
                  ],
                ),
              );
            },
          )
        ),
      )
      
      /*ListView.builder(
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
      ),*/
    );
  }
}
