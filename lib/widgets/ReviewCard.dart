import 'package:flutter/material.dart';
 
class Reviewcard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String date;
  final String reviewText;
  final int stars;

  const Reviewcard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.date,
    required this.reviewText,
    required this.stars,
  });
 
  @override
  Widget build(BuildContext context) {
   return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10), // Espacio entre los elementos
            Row(
              children: List.generate(
                stars,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Flexible(
              child: Text(
                reviewText,
                style: const TextStyle(
                  fontSize: 14,
                ),
                maxLines: 5, // Limitar a 3 líneas de texto
                overflow: TextOverflow.ellipsis, // Mostrar puntos suspensivos si el texto es muy largo
              ),
            ),
          ],
        ),
      ),
    );
  }
}