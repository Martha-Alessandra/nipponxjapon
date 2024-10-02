import 'package:flutter/material.dart';
 
// ignore: must_be_immutable
class TextfieldLogin extends StatelessWidget {
  final String hintText;
  final IconData icono;
  EdgeInsetsGeometry padding;
  TextEditingController controller;
  bool obscure;

 
  TextfieldLogin({
    super.key,
    required this.hintText,
    required this.icono,
    required this.padding,
    required this.controller,
    required this.obscure
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 45,
        width: 300,
        decoration: BoxDecoration(
          color: const Color(0xFFF8E2BB),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          border: Border.all(
            color: const Color(0xFFF6DCAC), 
            width: 1
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            disabledBorder:InputBorder.none ,
            border: InputBorder.none,
            prefixIcon: Icon(icono),
            iconColor: const Color(0xFFFFFFFF),
            /*hintStyle: TextStyle(
              fontWeight: FontWeight.bold
            )*/
          ),
          obscureText: obscure,
        ),
      ),
    );
  }
}