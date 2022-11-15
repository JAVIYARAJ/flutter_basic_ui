import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  String name="";
  String email="";
  String password="";
  @override
  Widget build(BuildContext context) {

    Future<bool> _displayDialog() async{
        return await showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text("Training App",style: TextStyle(fontSize: 20),),
            content: const Text("Are sure to exit?",style: TextStyle(fontSize: 20),),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(onPressed: (){
                    Navigator.of(context).pop(false);
              }, child:const Text("No",style: TextStyle(fontSize: 20),)),
              // ignore: deprecated_member_use
              FlatButton(onPressed: (){
                    Navigator.of(context).pop(true);
              }, child:const Text("Yes",style: TextStyle(fontSize: 20),))
            ],
          );
        })??false;
    }

    return WillPopScope(
      onWillPop: (){
        return _displayDialog();
      },
      child: SafeArea(child: Scaffold(
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
        ),)),
    );
  }
}
