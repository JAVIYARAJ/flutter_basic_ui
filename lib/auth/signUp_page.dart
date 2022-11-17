

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traning_app/model/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

    final nameController=TextEditingController();
    final emailController=TextEditingController();
    final passwordController=TextEditingController();

    String name="";
    String email="";
    String password="";

    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(image: AssetImage("assets/login_page_image.jpg"),fit: BoxFit.cover,),
            const SizedBox(height: 15,),
            const Text("Get stronger and fitter with us.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            const Text("Create your Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black26),),
            const SizedBox(height: 15,),
            TextField(
              cursorColor: Colors.blueAccent,
              keyboardType: TextInputType.text,
              onChanged: (value){
                name=value;
              },
              controller: nameController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 15),
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.blueAccent,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                email=value;
              },
              controller: emailController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 15),
                hintText: "Enter your email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              cursorColor: Colors.blueAccent,
              keyboardType: TextInputType.text,
              onChanged: (value){
                password=value;
              },
              controller: passwordController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 15),
                hintText: "Enter your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async{
                  await _createUser(Temp(name: name, email: email, password: password));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyanAccent.withOpacity(0.6),
                        Colors.blueAccent.withOpacity(0.4),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight
                    )
                  ),
                  child: const Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black26),),
                const SizedBox(width: 5,),
                InkWell(
                    onTap: (){

                    },
                    child: const Text("Login",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),))
              ],
            )
          ],
        ),
    ),
      ),));
  }
}


_createUser(Temp user) async {

  if(user.name.isNotEmpty && user.email.isNotEmpty && user.password.isNotEmpty){
  final firebase=FirebaseFirestore.instance.collection("videoList");

  await firebase.add({"name":user.name,"email":user.email,"password":user.password}).whenComplete((){
    debugPrint("complete");
  });
  }else{
    debugPrint("please enter value");
  }
}