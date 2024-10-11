import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class viewusers extends StatelessWidget {
  const viewusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          StreamBuilder(stream: FirebaseFirestore.instance.collection("user").snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                  return  Text(snapshot.data!.docs[index]["email"]);
                  }
              );
            }
            else{
              return Text("error bro");
            }
               },
          )


    );
  }
}
