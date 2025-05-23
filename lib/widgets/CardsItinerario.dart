import 'package:flutter/material.dart';

class Cardsitinerario extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String imagen;
  final double widthimagen;
  final double heightimagen;

  const Cardsitinerario({
    super.key,
    required this.onTap,
    required this.text,
    required this.imagen,
    required this.widthimagen,
    required this.heightimagen
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 120,
        height: 128,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFD9D9D9),
                    child: Image.asset(
                      imagen,
                      width: widthimagen,
                      height: heightimagen,
                    ) //Icon(icono, size: 30),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    
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