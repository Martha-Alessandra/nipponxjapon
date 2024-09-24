import 'package:flutter/material.dart';
 
class Menudesplegable extends StatelessWidget {
  final IconData iconoPrimerMenu;
  final String textoPrimerMenu;
  final void Function()? PrimerFuncionMenu;
  final IconData iconoSegundoMenu;
  final String textoSegundoMenu;
  final void Function()? SegundoFuncionMenu;
  final IconData iconoTercerMenu;
  final String textoTercerMenu;
  final void Function()? TercerFuncionMenu;

  const Menudesplegable({
    super.key,
    required this.iconoPrimerMenu,
    required this.textoPrimerMenu,
    required this.PrimerFuncionMenu,
    required this.iconoSegundoMenu,
    required this.textoSegundoMenu,
    required this.SegundoFuncionMenu,
    required this.iconoTercerMenu,
    required this.textoTercerMenu,
    required this.TercerFuncionMenu,
  });
 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF272727),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          const SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 5, 
                    right: 5,
                    top: 30
                  ),
                  child: Text(
                    'NIPPON X JAPON',
                    style: TextStyle(
                      color: Color(0xFFD30000),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Color(0xFFFFFFFF),
                  ),
                )
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                iconoPrimerMenu,
                color: const Color(0xFFFFFFFF),
              ),
              title: Text(
                textoPrimerMenu,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              onTap: PrimerFuncionMenu,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                iconoSegundoMenu,
                color: const Color(0xFFFFFFFF),
              ),
              title: Text(
                textoSegundoMenu,	
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              onTap: SegundoFuncionMenu,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(
                iconoTercerMenu,
                color:const Color(0xFFFFFFFF),
              ),
              title: Text(
                textoTercerMenu,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              onTap: TercerFuncionMenu,
            )
          ),
        ],
      ),
    );
  }
}