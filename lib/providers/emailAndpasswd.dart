import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logincontroller extends ChangeNotifier{
  var userid="";
  signupmethode({required email,required password})async {
   try{
    FirebaseAuth firebaseAuthinstance=FirebaseAuth.instance;
    var ref= await firebaseAuthinstance.createUserWithEmailAndPassword(email: email, password: password);
    if(ref.user!.uid.isNotEmpty){
      userid=ref.user!.uid;
print("registration success");
    }
   }
   catch(e){
print(("errooor$e"));
   }
  }

  addtodata({required Map<String,dynamic> data}) async{
    try{
      FirebaseFirestore frinstance=FirebaseFirestore.instance;
      await signupmethode(email: data["email"],password: data["password"]);
      if(userid.isNotEmpty){
        print(userid);
        await frinstance.collection("user").doc(userid).set(data);
      }
      else{
        print("hg");
      }
    }
    catch(e2){
      print("its an error$e2");
    }

  }

}


class googlecontrlr extends ChangeNotifier{
  signintogoogle()async{
    try{
      FirebaseAuth firebaseauthinstance=FirebaseAuth.instance;
      GoogleSignInAccount? user=await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleauth= await user?.authentication;

      var credential=GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken,
          idToken:googleauth?.idToken );

      var ref=await firebaseauthinstance.signInWithCredential(credential);
if(ref.user!.uid.isNotEmpty) {
  print("loginsucceess");
}
    }
    catch(e){
     print("error $e");
    }
  }
}

