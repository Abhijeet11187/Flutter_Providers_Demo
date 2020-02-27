import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/userModel.dart';


class addUser extends ChangeNotifier {
  List<userModel> userList=[];
 addUserInList(){
   userModel user=userModel("Abhijeet", "lokhandeabhijeet11187@gmail.com");
   userList.add(user);
   print("User Added ");
   print(userList);
   notifyListeners();
 }
}


