import 'package:flutter/material.dart';
 
class ButtonsPagos extends StatelessWidget {
  final String texto;
  final Size size;
  final Color colorFondo;
  final Color colorTexto;
  final Function() onPressed;

  const ButtonsPagos({
    super.key,
    required this.texto,
    required this.size,
    required this.colorFondo,
    required this.colorTexto,
    required this.onPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          enabledMouseCursor: SystemMouseCursors.click,
          backgroundColor: colorFondo,
          foregroundColor: colorTexto,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.2
          ),
          fixedSize: size,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ) ,
        child: Text(texto),
      ),
    );
  }
}