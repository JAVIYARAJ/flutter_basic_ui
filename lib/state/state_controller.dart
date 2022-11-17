import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetStateController extends GetxController{

  final userName="xyz".obs;
  final userType="".obs;

  updateUserName(String name){
    userName(name);
  }

  updateUserType(String user){
    userType(user);
  }

}