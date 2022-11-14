import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traning_app/auth_page.dart';
import 'package:traning_app/main_page.dart';
import 'package:traning_app/signUp_page.dart';
class AuthDashboard extends StatelessWidget {

  const AuthDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasData){
            return const MainPage();
          }else if(snapshot.hasError){
            return const Center(
              child: Text("Something went wrong!",style: TextStyle(fontSize: 20,color: Colors.black),),
            );
          }else{
            return const AuthPage();
          }
        },
      ),
    );
  }
}
