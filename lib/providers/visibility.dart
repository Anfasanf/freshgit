import 'package:flutter/cupertino.dart';

class Passwordcontroller extends ChangeNotifier{
  bool visible=false;
  makevisible(){
    visible=!visible;
    notifyListeners();
  }
}