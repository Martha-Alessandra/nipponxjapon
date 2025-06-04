import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Informacion.dart';
import 'package:proyecto_turismo/views/Migracion.dart';
import 'package:proyecto_turismo/widgets/CardsItinerario.dart';
import 'package:proyecto_turismo/widgets/Divider.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:proyecto_turismo/widgets/Subtitles.dart';
import 'package:proyecto_turismo/widgets/TarjetasActividades.dart';
import 'package:proyecto_turismo/views/VuelosView.dart';
import 'package:proyecto_turismo/views/HospedajeView.dart';
import 'package:proyecto_turismo/views/ActividadesView.dart';
import 'package:proyecto_turismo/models/actividadesdia_md.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:proyecto_turismo/widgets/DestinoCarruselState.dart';
import 'package:proyecto_turismo/widgets/DescripcionDestino.dart';
import 'package:proyecto_turismo/widgets/ActividadesPlaneadas.dart';


class Itinerario extends StatefulWidget {
  const Itinerario({super.key});

  @override
  _ItinerarioState createState() => _ItinerarioState();
} 

class _ItinerarioState extends State<Itinerario> {
  // DIA seleccionado por el usuario
  String? diaSeleccionado;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Obtener las actividades correspondientes al DIA seleccionado
    final actividadesFiltradas = diaSeleccionado != null
        ? actividadesPorDia.firstWhere(
            (actividad) => actividad.dia == diaSeleccionado,
            orElse: () => actividadesPorDia[0], // Usar el primer DIA si no se encuentra
          )
    : actividadesPorDia[0];

    // Lista de imágenes para el itinerario
    final List<Widget> actividadesProgramadas = [
      const TarjetaActividades(
        imagen: 'assets/images/actividades/SantuarioSensō-ji.jpg',
        nombre: 'Santuario Sensō-ji',
        dia: 'DIA 1',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/SantuarioTsurugaokaHachiman-gu.jpg',
        nombre: 'Santuario Tsurugaoka Hachiman-gu',
        dia: 'DIA 3',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/MonumentoHackiko.jpg',
        nombre: 'Monumento Hackiko',
        dia: 'DIA 6',
      ),
      const TarjetaActividades( 
        imagen: 'assets/images/actividades/FushimiInariTaisha.jpg',
        nombre: 'Fushimi Inari Taisha',
        dia: 'DIA 9',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/NikkoTosho-gu.jpg',
        nombre: 'Nikko Tosho-gu',
        dia: 'DIA 2',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/ParqueNara.jpg',
        nombre: 'Parque de Nara',
        dia: 'DIA 10',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/ParqueArakurayamaSengen.jpg',
        nombre: 'Parque Arakurayama Sengen',
        dia: 'DIA 4',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/Hiroshima.jpg',
        nombre: 'Hiroshima',
        dia: 'DIA 12',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/NishikiMarket.jpg',
        nombre: 'Nishiki Market',
        dia: 'DIA 8',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/CascadaKegon.jpg',
        nombre: 'Cascada Kegon',
        dia: 'DIA 2',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/Arashiyama.jpg',
        nombre: 'Arashiyama',
        dia: 'DIA 9',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/DisneylandTokio.jpg',
        nombre: 'Disneyland Tokio',
        dia: 'DIA 5',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/CastilloOsaka.jpg',
        nombre: 'Castillo de Osaka',
        dia: 'DIA 10',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/OshinoHakkaiTown.jpg',
        nombre: 'Oshino Hakkai Town',
        dia: 'DIA 4',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/PabellónDorado.jpg',
        nombre: 'Pabellón Dorado',
        dia: 'DIA 9',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/HaseDeraTemple.jpg',
        nombre: 'Hase Dera Temple',
        dia: 'DIA 3',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/UniversalStudios.jpg',
        nombre: 'Universal Studios Osaka',
        dia: 'DIA 11',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/YokohamaChinatown.jpg',
        nombre: 'Yokohama Chinatown',
        dia: 'DIA 7',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/Tokio.jpg',
        nombre: 'Tokio',
        dia: 'DIA 13',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/TiendaNintendo.jpg',
        nombre: 'Tienda Nintendo',
        dia: 'DIA 6',
      ),
      const TarjetaActividades(
        imagen: 'assets/images/actividades/Kiyomizudera.jpg',
        nombre: 'Kiyomizudera',
        dia: 'DIA 9',
      ),
    ];

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
                  imagen: 'assets/images/avion.png',
                  widthimagen: 35,
                  heightimagen: 35,
                  //icono: Icons.airplanemode_active,
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
                  imagen: 'assets/images/hotel.png',
                  widthimagen: 33.5,
                  heightimagen: 33.5,
                  //icono: Icons.home_work_outlined,
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
                  text: 'Actividades por Ciudad',
                  imagen: 'assets/images/atracciones1.png',
                  widthimagen: 40,
                  heightimagen: 40,
                  //icono: Icons.attractions,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Alinea todo a la derecha
                children: [
                  Container(
                    width: 210,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black54),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: diaSeleccionado,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: Colors.white,
                      hint: const Text('Selecciona un día'),
                      items: actividadesPorDia.map((actividad) {
                        return DropdownMenuItem<String>(
                          value: actividad.dia,
                          child: Text(
                            actividad.dia,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          diaSeleccionado = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const SizedBox(width: 250),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Actividades \ndel DIA', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Color(0xFFD30000),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lilita One',
                      ),
                    ),
                  ),
                  //const Icon(Icons.landscape, color: Colors.black54),
                  /// Selector de días
                  Container(
                    width: 210,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black54),
                      color: const Color(0xFFFFFFFF)
                    ),
                    child: DropdownButtonFormField<String>(
                      value: diaSeleccionado,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // Color de fondo
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: Colors.white,
                      hint: const Text('Selecciona un día'),
                      items: actividadesPorDia.map((actividad) {
                        return DropdownMenuItem<String>(
                          value: actividad.dia,
                          child: Text(
                            actividad.dia,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          diaSeleccionado = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),*/
            const Divisor(),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Destinos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: DestinoCarrusel(
                images: actividadesFiltradas.images,
                destino: actividadesFiltradas.destino,
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(
                right: 35,
                top: 3,
                bottom: 3
              ),
              child:  Row(
                children: [
                  const SizedBox(width: 28),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFEBEBEB),
                    child: Icon(Icons.landscape),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Destino',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Aquí agregamos la lógica para dividir el destino
                        ...actividadesFiltradas.destino.split(',').map((destino) => Text(
                          destino.trim(),
                          style: const TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.w900
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              )
            ),*/
            //const Divisor(),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
              child: Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Nuevo widget de descripción
            DescripcionHotel(
              descripcion: actividadesFiltradas.descripcion,
              icono: '🗺️', // Puedes cambiar el emoji según prefieras
            ),
            /*Padding(
              padding: const EdgeInsets.only(
                right: 35,
                top: 3,
                bottom: 3
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(width: 28),
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFEBEBEB),
                        child: Icon(Icons.local_hotel),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Descripción',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      actividadesFiltradas.descripcion,
                      style: const TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ] 
              )
            ),*/
            const Divisor(),
            ActividadesPlaneadasSection(
              actividades: actividadesFiltradas.actividades,
            ),
            /*const Subtitulos(
              subtitulo: 'Actividades Planeadas',
              fontSize: 18,
            ),
            const SizedBox(height: 10),
            ...actividadesFiltradas.actividades.map((actividad) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0, 
                  horizontal: 16.0
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline, 
                      color: Colors.green
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        actividad,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ),*/
            const SizedBox(height: 20),
            const Subtitulos(
              subtitulo: 'Actividades Programadas',
              fontSize: 18,
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 340,
                width: 450,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return actividadesProgramadas[index];
                  },
                  itemCount: actividadesProgramadas.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(
                    color: Colors.grey,
                    size: 35,
                    padding: EdgeInsets.symmetric(horizontal: 10)
                  ),
                  autoplay: true,
                  autoplayDelay: 3000,
                  autoplayDisableOnInteraction: false,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}