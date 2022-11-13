import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/main_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timerFunction();
  }

  _timerFunction(){
    Timer(const Duration(seconds: 5),(){
      Get.to(()=>const MainPage(),
          transition: Transition.fade,duration: const Duration(seconds: 2));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/exercise_logo.jpg")),

              Text("Training App",style: TextStyle(color: Colors.black,fontSize: 25),)
            ],
          ),
        ),
      ),
    );
  }
}