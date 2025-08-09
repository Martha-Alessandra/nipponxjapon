import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/views/Guia_Actividades.dart';
import 'package:proyecto_turismo/views/Registros_Turisticos.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:proyecto_turismo/widgets/Divider.dart';
import 'package:proyecto_turismo/widgets/ReviewCard.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
 
class Informacion extends StatelessWidget {
 
  const Informacion({Key? key}) : super(key: key);
 
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
      backgroundColor: const Color(0xFF272727), // Fondo negro principal
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
                'Nippon X Japon',
                style: TextStyle(
                  color: Color(0xFFD30000),
                  fontSize: 30,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    /*Container(
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD30000),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8)
                        )
                      ),
                    ),*/
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Queremos ser parte de uno de los mejores viajes de tu vida y brindarte el mejor soporte que podamos brindarte.'
                                ),
                                TextSpan(
                                  text: 'Te esperamos en Nippon x Japón.',
                                ),
                                TextSpan(
                                  text: '"Los sueños no están para ser cumplidos. Están para ser vividos."',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ]
                            )
                          )
                        )
                      ),
                    ),
                    /*Container(
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD30000),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8)
                        )
                      ),
                    ),*/
                  ],
                ),
              ),
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
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
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
                  color: Colors.white,
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
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
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
            //const SizedBox(height: 200),
          ],
        )         
      ),
    );
  }
}