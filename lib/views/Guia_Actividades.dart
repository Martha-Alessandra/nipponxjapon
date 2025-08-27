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

class _ExploraItinerarioState extends State<ExploraItinerario>
    with SingleTickerProviderStateMixin {
  String? ciudadSeleccionada;
  String? expandedCardId;
  AnimationController? _animationController;
  Animation<double>? _animation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (expandedCardId != null) {
            setState(() {
              expandedCardId = null;
            });
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Guía de Actividades',
              style: TextStyle(
                color: Color(0xFFD30000),
                fontSize: 30,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xFF272727),
            iconTheme: const IconThemeData(color: Color(0xFFD30000)),
          ),
          drawer: Menudesplegable(
            iconoPrimerMenu: Icons.calendar_month_rounded,
            textoPrimerMenu: 'Itinerario',
            PrimerFuncionMenu: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Itinerario()));
            },
            iconoSegundoMenu: Icons.credit_card,
            textoSegundoMenu: 'Gestión de Pagos',
            SegundoFuncionMenu: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GestionPagos()));
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Itinerario()));
            },
          ),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF272727),
                  Color(0xFF121212),
                ])),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  //Selector de ciudad mejorado
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('ciudades')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Color(0xFFD30000),
                            ));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}',
                                style: const TextStyle(color: Colors.white));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Text('No hay ciudades disponibles.',
                                style: TextStyle(color: Colors.white));
                          }

                          final ciudades = snapshot.data!.docs;

                          return DropdownButtonFormField<String>(
                            value: ciudadSeleccionada,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16)),
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
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Lista de lugares
                  if (ciudadSeleccionada != null)
                    Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ciudades')
                          .doc(ciudadSeleccionada)
                          .collection('lugares')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Color(0xFFD30000),
                          ));
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}',
                                  style: const TextStyle(color: Colors.white)));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return const Center(
                              child: Text('No hay lugares para esta ciudad.',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 16)));
                        }

                        final lugares = snapshot.data!.docs;

                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: lugares.length,
                          itemBuilder: (context, index) {
                            final lugar = lugares[index];
                            return _buildLugarCard(lugar);
                          },
                        );
                      },
                    ))
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildLugarCard(QueryDocumentSnapshot lugar) {
    final data = lugar.data() as Map<String, dynamic>;

    return Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _showExpandedCard(lugar, context),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Imagen del Lugar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: data['imagen'] != null
                        ? Image.network(
                            data['imagen'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[200],
                              child:
                                  const Icon(Icons.place, color: Colors.grey),
                            ),
                          )
                        : Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(Icons.place,
                                size: 40, color: Colors.grey)),
                  ),
                  const SizedBox(width: 16),
                  // Info del Lugar
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['nombre']?.toString() ?? 'Nombre no disponible',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data['descripcion']?.toString() ??
                              'Descripción no disponible',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  void _showExpandedCard(QueryDocumentSnapshot lugar, BuildContext context) {
    final data = lugar.data() as Map<String, dynamic>;
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
        builder: (context) => GestureDetector(
              onTap: () {
                _animationController?.reverse().then((_) => _removeOverlay());
              },
              behavior: HitTestBehavior.opaque,
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.5),
                body: Center(
                  child: ScaleTransition(
                    scale: _animation!,
                    child: Hero(
                      tag: 'card_${lugar.id}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    spreadRadius: 5)
                              ]),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: data['imagen'] != null
                                            ? Image.network(
                                                data['imagen'],
                                                width: double.infinity,
                                                height: 200,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, __, ___) =>
                                                    _buildPlaceholderIcon(),
                                              )
                                            : _buildPlaceholderIcon(),
                                      )),
                                  const SizedBox(height: 16),
                                  Text(
                                    data['nombre']?.toString() ??
                                        'Nombre no disponible',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data['descripcion']?.toString() ??
                                        'Descripción no disponible',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));

    Overlay.of(context).insert(_overlayEntry!);
    _animationController
        ?.forward(); // Aquí puedes agregar más widgets o lógica según sea necesario
  }

  Widget _buildPlaceholderIcon() {
    return Center(
      child: Icon(
        Icons.place,
        size: 60,
        color: Colors.grey[600],
      ),
    );
  }
  /*Widget build(BuildContext context) {
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
  }*/
}
