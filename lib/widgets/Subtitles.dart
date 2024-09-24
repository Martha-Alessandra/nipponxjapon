import 'package:flutter/material.dart';

class Subtitulos extends StatelessWidget{
  final String subtitulo;
  final double fontSize;

  const Subtitulos({
    super.key, 
    required this.subtitulo,
    required this.fontSize
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        subtitulo,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}