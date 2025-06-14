import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Informacion.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';

class ExploraItinerario extends StatefulWidget {
  const ExploraItinerario({Key? key}) : super(key: key);

  @override
  _ExploraItinerarioState createState() => _ExploraItinerarioState();
}

class _ExploraItinerarioState extends State<ExploraItinerario> {
  String? ciudadSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explora el Itinerario',
          style: TextStyle(
            color: Color(0xFFD30000),
            fontSize: 30,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF272727),
        shadowColor: Colors.grey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: const Color(0xFFD30000),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Menudesplegable(
        iconoPrimerMenu: Icons.calendar_month_rounded,
        textoPrimerMenu: 'Itinerario',
        PrimerFuncionMenu: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Itinerario()));
        },
        iconoSegundoMenu: Icons.credit_card,
        textoSegundoMenu: 'Gestión de Pagos',
        SegundoFuncionMenu: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GestionPagos()));
        },
        iconoTercerMenu: Icons.people,
        textoTercerMenu: 'Sobre Nosotros',
        TercerFuncionMenu: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Informacion()));
        },
        iconoCuartoMenu: Icons.library_books_outlined,
        textoCuartoMenu: 'Registros Turísticos',
        CuartaFuncionMenu: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Itinerario()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown para seleccionar ciudad
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('ciudades').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Text('No hay ciudades disponibles.');
                }

                final ciudades = snapshot.data!.docs;

                return DropdownButton<String>(
                  value: ciudadSeleccionada,
                  hint: const Text('Selecciona una ciudad'),
                  isExpanded: true,
                  items: ciudades.map((doc) {
                    return DropdownMenuItem<String>(
                      value: doc.id,
                      child: Text(doc['nombre']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      ciudadSeleccionada = value;
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // Lista de lugares para la ciudad seleccionada
            if (ciudadSeleccionada != null)
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('ciudades')
                      .doc(ciudadSeleccionada)
                      .collection('lugares')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No hay lugares para esta ciudad.'));
                    }

                    final lugares = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: lugares.length,
                      itemBuilder: (context, index) {
                        final lugar = lugares[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: lugar['imagen'] != null
                                ? Image.network(lugar['imagen'], width: 60, fit: BoxFit.cover)
                                : const Icon(Icons.place),
                            title: Text(lugar['nombre']),
                            subtitle: Text(lugar['descripcion']),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
