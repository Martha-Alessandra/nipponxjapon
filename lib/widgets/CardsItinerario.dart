import 'package:flutter/material.dart';

class Cardsitinerario extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icono;

  const Cardsitinerario({
    super.key,
    required this.onTap,
    required this.text,
    required this.icono,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        height: 110,
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFD9D9D9),
                    child: Icon(icono, size: 30),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}