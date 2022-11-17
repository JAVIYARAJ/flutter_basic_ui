import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:traning_app/pages/welcome/exercise_focur_area_page.dart';
import 'package:traning_app/pages/welcome/exercise_goal_page.dart';
import 'package:traning_app/pages/welcome/exercise_push_up_page.dart';
import 'package:traning_app/pages/welcome/gender_selection_page.dart';
import 'package:traning_app/pages/splash_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>const SplashScreen()),
        GetPage(name: "/gender_selection_page", page: ()=>const GenderIdentifyPage()),
        GetPage(name: "/exercise_focus_area_page", page: ()=>const ExerciseFocusArea()),
        GetPage(name: "/exercise_goal_page", page: ()=>const ExerciseGoalPage()),
        GetPage(name: "/exercise_push_up_page", page: ()=>const ExercisePushUpPage()),
      ],
    );
  }
}


