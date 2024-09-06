// import 'package:flutter/material.dart';
// import 'package:proyecto_turismo/services/firebase_service.dart';

// class addUser extends StatefulWidget {
//   const addUser({super.key});

//   @override
//   State<addUser> createState() => _addUserState();
// }

// class _addUserState extends State<addUser> {

//    TextEditingController nameController = TextEditingController(text: "");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Name'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               hintText: 'Enter Name',
//             ),
//           ),
//           ElevatedButton(onPressed: () async{
//             (nameController.text);
//           }, child: Text("Guardar"))
//         ],

//       ),
//     );
//   }
// }