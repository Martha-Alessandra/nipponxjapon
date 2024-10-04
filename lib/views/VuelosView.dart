import 'package:flutter/material.dart';
import 'package:proyecto_turismo/models/vuelos_md.dart';

class VuelosView extends StatefulWidget {
  const VuelosView({super.key});

  @override
  _VuelosViewState createState() => _VuelosViewState();
}

class _VuelosViewState extends State<VuelosView> {
  // Lista de vuelos disponibles
  final List<Vuelo> vuelos = [
    Vuelo(fecha: '5 DE MARZO - 19 DE MARZO', estado: 'AGOTADO'),
    Vuelo(fecha: '19 DE MARZO - 2 DE ABRIL', estado: 'AGOTADO'),
    Vuelo(fecha: '2 DE ABRIL - 16 DE ABRIL', estado: 'AGOTADO'),
    Vuelo(fecha: '16 DE ABRIL - 30 DE ABRIL', estado: 'AGOTADO'),
    Vuelo(fecha: '1 DE JULIO - 15 DE JULIO', estado: 'PREVENTA'),
    Vuelo(fecha: '15 DE JULIO - 29 DE JULIO', estado: 'PREVENTA'),
    Vuelo(fecha: '01 DE OCTUBRE - 15 DE OCTUBRE', estado: 'EN ESPERA'),
    Vuelo(fecha: '15 DE OCTUBRE - 29 DE OCTUBRE', estado: 'EN ESPERA'),
    Vuelo(fecha: '29 DE OCTUBRE - 12 DE NOVIEMBRE', estado: 'EN ESPERA'),
    Vuelo(fecha: '12 DE NOVIEMBRE - 26 DE NOVIEMBRE', estado: 'EN ESPERA'),
  ];

  // Variable para almacenar la selección del usuario
  Vuelo? vueloSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Vuelo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccione una fecha para ver los detalles del vuelo:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<Vuelo>(
              hint: const Text("Seleccione una fecha"),
              value: vueloSeleccionado,
              onChanged: (Vuelo? newValue) {
                setState(() {
                  vueloSeleccionado = newValue;
                });
              },
              items: vuelos.map((Vuelo vuelo) {
                return DropdownMenuItem<Vuelo>(
                  value: vuelo,
                  child: Text(vuelo.fecha),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (vueloSeleccionado != null) ...[
              const Text(
                'Detalles del vuelo:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Fecha: ${vueloSeleccionado!.fecha}'),
              Text('Estado: ${vueloSeleccionado!.estado}'),
              const SizedBox(height: 10),
              const Text(
                'Vuelo redondo: Ciudad de México (CDMX) - Narita, Japón',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Para verificar detalles adicionales como la hora y la puerta de embarque, por favor revise los detalles con la aerolínea.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              if (vueloSeleccionado!.estado == 'AGOTADO') 
                const Text('Lo sentimos, esta fecha está agotado.'),
              if (vueloSeleccionado!.estado == 'PREVENTA') 
                const Text('Esta fecha está en preventa, ¡resérvalo ahora!'),
              if (vueloSeleccionado!.estado == 'EN ESPERA') 
                const Text('Esta fecha está en espera, ¡pronto estará disponible!'),
            ],
          ],
        ),
      ),
    );
  }
}
