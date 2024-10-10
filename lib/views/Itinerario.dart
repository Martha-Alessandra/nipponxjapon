import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Informaci%C3%B3n.dart';
import 'package:proyecto_turismo/views/Migracion.dart';
import 'package:proyecto_turismo/widgets/CardsItinerario.dart';
import 'package:proyecto_turismo/widgets/DetallesItinerario.dart';
import 'package:proyecto_turismo/widgets/Divider.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:proyecto_turismo/widgets/Subtitles.dart';
import 'package:proyecto_turismo/widgets/TarjetasActividades.dart';
import 'package:proyecto_turismo/views/VuelosView.dart';
import 'package:proyecto_turismo/views/HospedajeView.dart';
import 'package:proyecto_turismo/views/ActividadesView.dart';
import 'package:proyecto_turismo/models/actividadesdia_md.dart';



class Itinerario extends StatefulWidget {
  const Itinerario({super.key});

  @override
  _ItinerarioState createState() => _ItinerarioState();
}

class _ItinerarioState extends State<Itinerario> {
  // Día seleccionado por el usuario
  String? diaSeleccionado;

  @override
  Widget build(BuildContext context) {
    // Obtener las actividades correspondientes al día seleccionado
    final actividadesFiltradas = diaSeleccionado != null
        ? actividadesPorDia.firstWhere(
            (actividad) => actividad.dia == diaSeleccionado,
            orElse: () => actividadesPorDia[0], // Usar el primer día si no se encuentra
          )
        : actividadesPorDia[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Itinerario',
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
        iconoPrimerMenu: Icons.credit_card,
        textoPrimerMenu: 'Gestión de Pagos',
        PrimerFuncionMenu: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GestionPagos()));
        },
        iconoSegundoMenu: Icons.edit_document,
        textoSegundoMenu: 'Migración y Pasaporte',
        SegundoFuncionMenu: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Migracion()));
        },
        iconoTercerMenu: Icons.people,
        textoTercerMenu: 'Sobre Nosotros',
        TercerFuncionMenu: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Informacion()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    foregroundColor: Color(0xFF7D7D7D),
                    //foregroundImage: AssetImage('assets/images/usr.png'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Carlos Lopez',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Próximo viajero',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cardsitinerario(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VuelosView(),
                      ),
                    );
                  },
                  text: 'Vuelos',
                  icono: Icons.airplanemode_active,
                ),
                Cardsitinerario(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HospedajeView(),
                      ),
                    );
                  },
                  text: 'Hospedaje',
                  icono: Icons.home_work_outlined,
                ),
                Cardsitinerario(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ActividadView(),
                      ),
                    );
                  },
                  text: 'Actividades',
                  icono: Icons.attractions,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Subtitulos(subtitulo: 'Actividades del Día', fontSize: 18),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.landscape, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: diaSeleccionado,
                        hint: const Text(
                          "Seleccione un día",
                          style: TextStyle(fontSize: 16),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            diaSeleccionado = newValue;
                          });
                        },
                        items: actividadesPorDia.map((actividad) {
                          return DropdownMenuItem<String>(
                            value: actividad.dia,
                            child: Text(
                              actividad.dia,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        underline: SizedBox(), // Eliminar la línea de abajo del dropdown
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divisor(),
            DetallesViaje(
              imagenIcono: Icons.landscape,
              encabezado: 'Destino',
              detalleViaje: actividadesFiltradas.destino,
            ),
            const Divisor(),
            DetallesViaje(
              imagenIcono: Icons.local_hotel,
              encabezado: 'Descripción',
              detalleViaje: actividadesFiltradas.descripcion,
            ),
            const Divisor(),
            const Subtitulos(
              subtitulo: 'Actividades Programadas',
              fontSize: 18,
            ),
            ...actividadesFiltradas.actividades.map((actividad) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          actividad,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            const Subtitulos(
              subtitulo: 'Recomendaciones',
              fontSize: 18,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TarjetaActividades(
                    etiqueta: 'Recomendado',
                    imagen: 'assets/images/montefuji2.jpg',
                    nombre: 'Monte Fuji',
                    duracion: '5 HRS'),
                TarjetaActividades(
                    etiqueta: 'Novedad',
                    imagen: 'assets/images/towerjapan.jpg',
                    nombre: 'Torre de Tokio',
                    duracion: '2 HRS'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}








 /*SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF272727),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'NIPPON X JAPON',
                      style: TextStyle(
                        color: Color(0xFFD30000),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rubik',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        color: Color(0xFFFFFFFF),
                        thickness: 3,
                      ),
                    )
                  ]
                ),
              ),
            ),*/