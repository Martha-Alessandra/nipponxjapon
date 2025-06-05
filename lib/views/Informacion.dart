import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/views/Guia_Actividades.dart';
import 'package:proyecto_turismo/views/Registros_Turisticos.dart';
import 'package:proyecto_turismo/widgets/DatosRegistroN.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_turismo/widgets/Divider.dart';
import 'package:proyecto_turismo/widgets/ReviewCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
 
class Informacion extends StatelessWidget {
 
  const Informacion({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
 
  @override
  Widget build(BuildContext context) {

    final List<Widget> reviewCards = [
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/astrid.png', // URL de avatar o imagen
        name: 'Astrid Serrato',
        date: '2023-06-12',
        reviewText: 'En 2019 tuve la oportunidad de hacer un viaje con ellos a Shanghai y Shenzhen, los recomiendo ampliamente, organizan muy bien todo y alcanzas a ver demasiados lugares. \n Sin duda volvería a viajar con esta agencia.',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/paulina.png',
        name: 'Paulina Flores',
        date: '2023-06-12',
        reviewText: 'Excelente servicio, muy atentos y amables. Muy flexibles por si quieres ver algo en específico. Seguro será un viaje increíble!',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/tane.png',
        name: 'Tane Cruz',
        date: '2023-06-12',
        reviewText: 'Todo excelente, la información clara y precisa, muy amables y atentos ante cualquier duda. Los recomiendo muchísimo!! Que sigan los éxitos!!',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/pedro.png',
        name: 'Pedro Cerna',
        date: '2023-06-12',
        reviewText: 'Excelente trato y atención 😊 super recomendado, ya tengo agendado el próximo viaje con ellos…',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/gumer.png',
        name: 'Gumer Rodriguez',
        date: '2023-06-12',
        reviewText: 'Excelente servicio. Son muy confiables y los itinerarios los tienen bien planeados',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/brandon.png',
        name: 'brandon jacobo',
        date: '2023-06-12',
        reviewText: 'Excelente atención el mejor lugar para tu viaje',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/alejandro.png',
        name: 'alejandro salazar',
        date: '2023-06-12',
        reviewText: 'Excelente servicio y atención, la mejor opción que existe para lograr mi sueño de conocer Japón 👏…',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/ernesto.png',
        name: 'Ernesto Leon',
        date: '2023-06-12',
        reviewText: 'Muy buena atención y servicio. El viaje fue espectacular, 100% recomendado',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/christian.png',
        name: 'Christian Salceda',
        date: '2023-06-12',
        reviewText: 'La atención, el personal y el seguimiento son muy buenas, recomendado si buscas un lugar para viajar a Japón',
        stars: 5,
      ),
      const Reviewcard(
        avatarUrl: 'assets/images/usersphoto/luz.png',
        name: 'luz salazar',
        date: '2023-06-12',
        reviewText: 'Un gran servicio y atención. Además la información que manejan es interesante y clara.',
        stars: 5,
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre Nosotros', 
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
        PrimerFuncionMenu: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const Itinerario()
            )
          );
        },
        iconoSegundoMenu: Icons.credit_card, 
        textoSegundoMenu: 'Gestión de Pagos', 
        SegundoFuncionMenu: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const GestionPagos()
            )
          );
        },
        iconoTercerMenu: Icons.map,
        textoTercerMenu: 'Explora el Itinerario',
        TercerFuncionMenu: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ExploraItinerario()
            )
          );
        },
        iconoCuartoMenu: Icons.library_books_outlined,
        textoCuartoMenu: 'Registros Turísticos',
        CuartaFuncionMenu: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistrosTuristicos()
            )
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 6
              ),
              child: Text(
                'NIPPON X JAPON',
                style: TextStyle(
                  color: Color(0xFFD30000),
                  fontSize: 30,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Queremos ser parte de uno de los mejores viajes de tu vida y brindarte el mejor soporte que podamos brindarte.'
                    ),
                    TextSpan(
                      text: 'Te esperamos en Nippon x Japón.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              )
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: Text(
                '¿Dónde nos encontramos?',
                style: TextStyle(
                  color: Color(0xFFD30000),
                  fontSize: 25,
                  fontFamily: 'Lilita One',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      center: const LatLng(21.1037843, -101.6363576), // Coordenadas de Nippon x Japon en León, Guanajuato
                      zoom: 16.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: const LatLng(21.1037843, -101.6363576), 
                            builder: (ctx) => const Icon(
                              Icons.location_pin,
                              color: Color(0xFFD30000),
                              size: 40,
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32
              ),
              child: Text(
                'Blvd. Adolfo López Mateos Fracc, Julián de Obregón 3401, León, Guanajuato',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
            const Divisor(),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                bottom: 5,
              ),
              child: Text(
                'Reseñas',
                style: TextStyle(
                  color: Color(0xFFD30000),
                  fontSize: 28,
                  fontFamily: 'Lilita One',
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return reviewCards[index];
                },
                itemCount: reviewCards.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                autoplayDelay: 4000,
                duration: 1000,
              ),
            ),
            const SizedBox(height: 8),
            const Divisor(),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  'Registro de Turismo',
                  style: TextStyle(
                    color: Color(0xFFD30000),
                    fontSize: 32,
                    fontFamily: 'Lilita One',
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      'DATOS PARA CONSULTA EN EL REGISTRO \nNACIONAL DE TURISMO:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Datosregistro(
                    encabezado: 'Nombre: ', 
                    contenido: 'Nippon x japon'
                  ),
                  const Datosregistro(
                    encabezado: 'Estado: ', 
                    contenido: 'GUANAJUATO'
                  ),
                  const Datosregistro(
                    encabezado: 'Municipio: ', 
                    contenido: 'LEON'
                  ),
                  const Datosregistro(
                    encabezado: 'RNT: ', 
                    contenido: '04110200912'
                  ),
                  const Datosregistro(
                    encabezado: 'Número de Trámite: ', 
                    contenido: '2EE5D'
                  ),
                  const Datosregistro(
                    encabezado: 'Clave de Control: ', 
                    contenido: '04I0BA014'
                  ),
                  const SizedBox(height: 10,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _launchURL('https://rnt.sectur.gob.mx/');
                      },
                      child: Image.asset(
                        'assets/images/RegistroNacional.png',
                        height: 310,
                        width: double.infinity,
                      )
                    )
                  ),
                  const SizedBox(height: 10,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _launchURL('https://registroestataldeturismo.guanajuato.gob.mx/consulta-ciudadana/ver/RET022052963');
                      },
                      child: Image.asset(
                        'assets/images/RegistroEstatal.png',
                        height: 310,
                        width: double.infinity,
                      )
                    )
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Divisor(),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      'ESTAMOS CERTIFICADOS COMO \nGUIAS JNTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Lilita One',
                        color: Color(0xFFD30000)
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Esta certificación es avalda por la \nOficina Nacional de Turismo de Japón',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      'assets/images/CertificadoLuis.png',
                      height: 310,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/CertificadoDiana.jpg',
                      height: 310,
                      width: double.infinity,
                    ),
                  ),
                ],
              )
            )
            //const SizedBox(height: 200),
          ],
        )         
      ),
    );
  }
}