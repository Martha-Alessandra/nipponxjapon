import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Servicios
import 'package:proyecto_turismo/services/firebase_service.dart';

class Users extends StatelessWidget{
  const Users({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: FutureBuilder(

        future: getPeople(),
        
        builder : ((context, snapshot){
          if(snapshot.hasData){

               return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Text(snapshot.data?[index]['name']);
            },

          );

          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
       

        }) ),
    );
  }
}
