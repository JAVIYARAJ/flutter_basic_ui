import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'google_auth.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                const Image(image: AssetImage("assets/login_page_image.jpg"),fit: BoxFit.cover,),
                const SizedBox(height: 50,),
                const Text("Get stronger and fitter with us.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                const SizedBox(height: 50,),
                const Text("Create your Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black26),),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        minimumSize: const Size(double.infinity, 50)
                      ),
                      onPressed: () async {

                        final auth=GoogleSignProvider();
                        auth.googleLogin();

                  }, icon:FaIcon(FontAwesomeIcons.google,color: Colors.blueAccent.withOpacity(0.7),), label: const Text("Sign Up with Google",style: TextStyle(color: Colors.black,fontSize: 16),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
