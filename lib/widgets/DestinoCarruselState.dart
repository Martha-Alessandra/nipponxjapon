import 'package:flutter/material.dart';

class DestinoCarrusel extends StatefulWidget {
  final List<String> images;
  final String destino;

  const DestinoCarrusel({
    super.key,
    required this.images,
    required this.destino,
  });

  @override
  _DestinoCarruselState createState() => _DestinoCarruselState();
}

class _DestinoCarruselState extends State<DestinoCarrusel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 220, // Altura fija para el carrusel
        child: Stack(
          children: [
            // Carrusel de imágenes
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),

            // Recuadro semitransparente con el nombre del destino
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Text(
                  widget.destino,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Indicadores de posición (solo si hay múltiples imágenes)
            if (widget.images.length > 1)
              Positioned(
                bottom: 50, // Encima del recuadro de texto
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
              ),

            // Flecha izquierda (solo si hay múltiples imágenes)
            if (widget.images.length > 1)
              Positioned(
                left: 10,
                top: 0,
                bottom: 40, // Evita que se superponga con el texto
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.chevron_left,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),

            // Flecha derecha (solo si hay múltiples imágenes)
            if (widget.images.length > 1)
              Positioned(
                right: 10,
                top: 0,
                bottom: 40, // Evita que se superponga con el texto
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.chevron_right,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
