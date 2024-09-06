import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  try {
    print('Ruta de la imagen: ${image.path}');
    final String nameFile = image.path.split("/").last;
    Reference ref = storage.ref().child("Primer Pago").child(nameFile);
    
    // Inicia la tarea de subida
    final UploadTask uploadTask = ref.putFile(image);

    // Monitorear el progreso de la subida
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      final progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      print('Progreso de la subida: $progress%');
    });

    // Esperar a que la subida complete
    final TaskSnapshot snapshot = await uploadTask;

    print('Subida completada: ${snapshot.bytesTransferred} bytes transferidos.');

    // Obtener la URL de descarga de la imagen subida
    final String url = await snapshot.ref.getDownloadURL();
    print('URL de la imagen subida: $url');

    // Retornar true si la subida fue exitosa
    return true;
  } catch (e) {
    // Manejo de errores
    print('Error al subir la imagen: $e');
    return false;
  }
}
