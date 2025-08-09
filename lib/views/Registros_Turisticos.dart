import 'package:flutter/material.dart';
import 'package:proyecto_turismo/views/Gestion_Pagos.dart';
import 'package:proyecto_turismo/views/Guia_Actividades.dart';
import 'package:proyecto_turismo/views/Informacion.dart';
import 'package:proyecto_turismo/views/Itinerario.dart';
import 'package:proyecto_turismo/widgets/DatosRegistroN.dart';
import 'package:proyecto_turismo/widgets/Divider.dart';
import 'package:proyecto_turismo/widgets/MenuDesplegable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:proyecto_turismo/views/RecomendacionesView.dart';

class RegistrosTuristicos extends StatelessWidget {

  const RegistrosTuristicos({Key ? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registros Turísticos', 
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
        iconoCuartoMenu: Icons.people,
        textoCuartoMenu: 'Sobre Nosotros',
        CuartaFuncionMenu: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Informacion()
            )
          );
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
            ]
          )
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              CardInfo(
                title: 'Datos para consulta', 
                items: const [
                  {'label': 'Nombre:', 'value': 'Nippon x Japon'},
                  {'label': 'Estado:', 'value': 'GUANAJUATO'},
                  {'label': 'Municipio:', 'value': 'LEON'},
                  {'label': 'RNT:', 'value': '04110200912'},
                  {'label': 'Número de Trámite:', 'value': '2EE5D'},
                  {'label': 'Clave de Control:', 'value': '04I0BA014'},
                ]
              ),
              const SizedBox(height: 24),

              Column(
                children: [
                  InkWell(
                    onTap: () => _launchURL('https://rnt.sectur.gob.mx/'),
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/RegistroNacional.png',
                          fit: BoxFit.cover,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () => _launchURL('https://registroestataldeturismo.guanajuato.gob.mx/consulta-ciudadana/ver/RET022052963'),
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/RegistroEstatal.png',
                          fit: BoxFit.cover,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              const Divider(color: Colors.grey),
              const SizedBox(height: 24),

              const Text(
                'Certificados JNTO',
                style: TextStyle(
                  color: Color(0xFFD30000),
                  fontSize: 28,
                  fontFamily: 'Lilita One',
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Esta certificación es avalada por la Oficina Nacional de Turismo de Japón',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        'assets/images/CertificadoLuis.png',
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Certificado de Luis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF272727)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        'assets/images/CertificadoDiana.jpg',
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Certificado de Diana',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF272727)
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
      /*SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
      )*/
    );
  }
}

Widget CardInfo({required String title, required List<Map<String, String>> items}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD30000),
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['label']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item['value']!,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ) 
                )
              ],
            ),
          )).toList(),
        ],
      ),
    ),
  );
}