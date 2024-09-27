import 'package:flutter/material.dart';
 
class ButtonsLogin extends StatelessWidget {
  final String texto;
  final Size size;
  final Function() onPressed;
 
  const ButtonsLogin({
    super.key,
    required this.texto,
    required this.size,
    required this.onPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 1,
        left: 1,
        right: 1,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          enabledMouseCursor: SystemMouseCursors.click,
          backgroundColor: const Color(0xFFEF762F),
          foregroundColor: const Color(0xFFFFFFFF),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.2
          ),
          fixedSize: Size(size.width, size.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        child: Text(texto),
      )
    );
  }
}