import 'package:flutter/material.dart';

class RegistrosTuristicos extends StatelessWidget {
  const RegistrosTuristicos({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros Turísticos'),
      ),
      body: const Center(
        child: Text(
          'Contenido de Registros Turísticos',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}