import 'package:flutter/material.dart';
import 'package:proyecto_turismo/models/hospedaje_md.dart';


class HospedajeView extends StatefulWidget {
  const HospedajeView({super.key});

  @override
  _HospedajeViewState createState() => _HospedajeViewState();
}

class _HospedajeViewState extends State<HospedajeView> {
  // Instancia de tu servicio
  final HospedajeService hospedajeService = HospedajeService();

  // Lista de todas las fechas disponibles
  final List<String> fechas = [
    '5 DE MARZO - 19 DE MARZO',
    '19 DE MARZO - 2 DE ABRIL',
    '2 DE ABRIL - 16 DE ABRIL',
    '16 DE ABRIL - 30 DE ABRIL',
    '1 DE JULIO - 15 DE JULIO',
    '15 DE JULIO - 29 DE JULIO',
    '01 DE OCTUBRE - 15 DE OCTUBRE',
    '15 DE OCTUBRE - 29 DE OCTUBRE',
    '29 DE OCTUBRE - 12 DE NOVIEMBRE',
    '12 DE NOVIEMBRE - 26 DE NOVIEMBRE',
  ];

  // Variable para almacenar la selección del usuario
  String? fechaSeleccionada;

  @override
  Widget build(BuildContext context) {
    // Obtener hospedajes desde el servicio
    final List<Hospedaje> hospedajes = hospedajeService.obtenerHospedajes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Hospedaje'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccione una fecha para ver los hospedajes:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Dropdown para seleccionar la fecha
            DropdownButton<String>(
              hint: const Text("Seleccione una fecha"),
              value: fechaSeleccionada,
              onChanged: (String? newValue) {
                setState(() {
                  fechaSeleccionada = newValue;
                });
              },
              items: fechas.map((String fecha) {
                return DropdownMenuItem<String>(
                  value: fecha,
                  child: Text(fecha),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Mostrar las tarjetas solo si se ha seleccionado una fecha
            if (fechaSeleccionada != null) ...[
              const Text(
                'Información de hospedajes:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: hospedajes.length,
                  itemBuilder: (context, index) {
                    final hospedaje = hospedajes[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hospedaje.nombreHotel,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Ocupación: ${hospedaje.ocupacion}'),
                            Text('Tiempo de Estancia: ${hospedaje.nochescant}'),
                            Text('Estrellas: ${hospedaje.estrellas}'),
                            const SizedBox(height: 10),
                            const Text(
                              'Descripción',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else
              const Center(
                child: Text('Seleccione una fecha para ver los hospedajes disponibles.'),
              ),
          ],
        ),
      ),
    );
  }
}





//Agregar imagenes y descripción de los hoteles 
