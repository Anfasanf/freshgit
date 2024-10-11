import 'package:fidemo/constants/Textconfig/textstyles.dart';
import 'package:fidemo/screen/view%20users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../constants/theme/maintheme.dart';
import '../providers/emailAndpasswd.dart';
import '../providers/visibility.dart';

class Myscreen extends StatelessWidget {
   Myscreen({super.key});
  TextEditingController emailcon=TextEditingController();
  TextEditingController paaswordcon=TextEditingController();

  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<Passwordcontroller>(context);
    Provider.of<Logincontroller>(context);
    Provider.of<googlecontrlr>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("LOGIN",style: TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary)),
        leading: Icon(Icons.west,color: Theme.of(context).colorScheme.secondary,),
        actions: [
          Icon(Icons.add,color: Theme.of(context).colorScheme.secondary),
          Text("     "),
          Icon(Icons.person,color: Theme.of(context).colorScheme.secondary),
          Text("     "),
          Icon(Icons.mail,color: Theme.of(context).colorScheme.secondary),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Container(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: 720,
                  width: 400,
                  decoration: BoxDecoration(
                    gradient:LinearGradient(colors: [Theme.of(context).colorScheme.onSurface,
                      Theme.of(context).colorScheme.surface],
                    begin: Alignment.bottomCenter,end: Alignment.topCenter)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 78.0),
                        child: Text("Enter your Email and Password to login",style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,fontSize: 14,fontWeight: FontWeight.bold
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0,left: 10,right: 10),
                        child: TextFormField(
                          controller: emailcon,
                          decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.secondary,filled: true,
                              hintText: "Email",hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                              prefixIcon: Icon(Icons.mail,color: Theme.of(context).colorScheme.primary),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0,right: 10,left: 10),
                        child: TextFormField(obscureText: provider.visible,
                          controller: paaswordcon,
                          decoration: InputDecoration(
                              fillColor: Theme.of(context).colorScheme.secondary,filled: true,
                              hintText: "Password",hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                              prefixIcon: Icon(Icons.key,color: Theme.of(context).colorScheme.primary,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            suffixIcon: IconButton(
                                onPressed: (){
                                  provider.makevisible();
                                },
                                icon: provider.visible?Icon(Icons.visibility_off):Icon(Icons.visibility))
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0,left: 40),
                            child: Text("Dont have an account yet?",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 16,color: Theme.of(context).colorScheme.secondary
                            ),),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 18.0,left: 35),
                              child: TextButton(onPressed: (){}, child: Text("Signup",style: tx2a,))
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38.0,left: 15,right: 15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.grey,
                                minimumSize: Size(380, 50),
                                backgroundColor: maintheme.lighttheme.focusColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                            ),
                            onPressed: (){
                             Provider.of<Logincontroller>(context,listen: false).addtodata(data: {"email":emailcon.text,
                               "password":paaswordcon.text});
                            }, child: Text("Signin",style: tx1,)),
                      ),

                      ElevatedButton(onPressed: ()  {
                        Provider.of<googlecontrlr>(context,listen: false).signintogoogle();
                      }
                          , child: Text("google")),



                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>viewusers()));
                      },
                          child: Text("view",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ),

              ],
              ),
        ),
        ),

    ));
  }
}
