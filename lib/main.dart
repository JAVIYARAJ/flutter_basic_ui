import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:traning_app/auth/auth_dashboard.dart';
import 'package:traning_app/auth/auth_page.dart';
import 'package:traning_app/pages/gender_selection_page.dart';
import 'package:traning_app/pages/splash_screen.dart';
import 'package:traning_app/temp/video_sample.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenderIdentifyPage(),
    );
  }
}


