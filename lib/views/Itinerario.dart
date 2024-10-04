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

class Itinerario extends StatelessWidget {
  const Itinerario({super.key});

  @override
  Widget build(BuildContext context) {
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
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          'Próximo viajero',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cardsitinerario(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VuelosView() // Navega a la vista de Vuelos
                            ),
                      );
                    },
                    text: 'Vuelos',
                    icono: Icons.airplanemode_active),
                Cardsitinerario(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HospedajeView() // Navega a la vista de Hospedaje
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
                          builder: (context) =>
                              const ActividadView() // Navega a la vista de Actividades
                          ),
                    );
                  },
                  text: 'Actividades',
                  icono: Icons.attractions,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Subtitulos(subtitulo: 'Detalles del Viaje', fontSize: 18),
            const SizedBox(height: 7),
            const DetallesViaje(
              imagenIcono: Icons.landscape,
              encabezado: 'Destino',
              detalleViaje: 'Tokio',
            ),
            const Divisor(),
            const DetallesViaje(
              imagenIcono: Icons.calendar_month_outlined,
              encabezado: 'Fechas',
              detalleViaje: 'Jun 15 -\n Jun 19',
            ),
            const Divisor(),
            const DetallesViaje(
              imagenIcono: Icons.local_hotel,
              encabezado: 'Hospedaje',
              detalleViaje: 'Royal Japan',
            ),
            const Divisor(),
            const DetallesViaje(
              imagenIcono: Icons.surfing_rounded,
              encabezado: 'Actividades Programadas',
              detalleViaje: 'Escalada \nVisita Guiada.',
            ),
            const SizedBox(
              height: 20,
            ),
            const Subtitulos(
              subtitulo: 'Actividades del Día',
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
            )
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