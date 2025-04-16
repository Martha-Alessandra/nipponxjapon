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
    final filteredHospedajes = fechaSeleccionada != null
        ? hospedajes.where((h) => h.fecha == fechaSeleccionada).toList()
        : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hospedajes',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Rubik',
          ),
        ),
        backgroundColor: const Color(0xFF272727),
        shadowColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF121212),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              //Selector de fechas
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selecciona tu periodo:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD30000)
                        ),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: const SizedBox(),
                          hint: const Text('Periodo de viaje'),
                          value: fechaSeleccionada,
                          onChanged: (String? newValue) {
                            setState(() {
                              fechaSeleccionada = newValue;
                            });
                          },
                          items: fechas.map((String fecha) {
                            return DropdownMenuItem<String>(
                              value: fecha,
                              child: Text(
                                fecha,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                        )
                      )
                    ],
                  ), 
                ),
              ),
              const SizedBox(height: 24),

              //Presentación de hospedajes
              if (fechaSeleccionada == null)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Seleccione una fecha para ver\nlos hospedajes disponibles',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  )
                )

              else if (filteredHospedajes.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'No hay hospedajes disponibles para este periodo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    )
                  ),
                )
              
              else
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredHospedajes.length,
                    itemBuilder: (context, index) {
                      final hospedaje = filteredHospedajes[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              //Nombre y raiting del hotel
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      hospedaje.nombreHotel,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (starIndex) {
                                      return Icon(
                                        starIndex < hospedaje.estrellas 
                                            ? Icons.star 
                                            : Icons.star_border,
                                        color: const Color(0xFFD30000),
                                        size: 20,
                                      );
                                    }),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Divider(height: 1),
                              const SizedBox(height: 12),

                              // Detalles
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Periodo: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    hospedaje.fecha,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.people,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Ocupación: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    hospedaje.ocupacion,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              
                              Row(
                                children: [
                                  const Icon(
                                    Icons.hotel,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Noches: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    hospedaje.nochescant,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),

                              //Botón
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD30000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  onPressed: () {

                                  },
                                  child: const Text(
                                    'Ver detalles',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),  
                )
            ],
          ),
        ),
      ) 
      /*Padding(
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
      ),*/
    );
  }
}





//Agregar imagenes y descripción de los hoteles 
