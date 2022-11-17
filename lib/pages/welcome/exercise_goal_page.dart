import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/widget/reusable_button.dart';
import 'package:traning_app/widget/reusable_top_back_pannel.dart';

import '../../model/user_type.dart';

class ExerciseGoalPage extends StatefulWidget {
  const ExerciseGoalPage({Key? key}) : super(key: key);

  @override
  State<ExerciseGoalPage> createState() => _ExerciseGoalPageState();
}

class _ExerciseGoalPageState extends State<ExerciseGoalPage> {

  final infoImage=["assets/exercise_lose_weight_icon.png","assets/exercise_body_muscle_icon.png","assets/exercise_body_fit_icon.png"];

  final map={"Lose Weight":false,"Build Muscle":false,"Keep Fit":false};

  var loseWeight=false;
  var buildMuscle=false;
  var keepFit=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top:20,left: 20,right: 20),
            child: Column(
              children: [
                ReusableTopBackPanel(backOnTap: (){
                  Get.back();
                },skipOnTap: (){

                },),
                const SizedBox(height: 10,),
                const Text("WHAT ARE YOUR MAIN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                const Text("GOALS?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                const SizedBox(height: 10,),
                Column(
                  children:List.generate(map.length, (index) =>_buildExerciseGoalCard(goalName: map.keys.elementAt(index), goalImage:infoImage[index],index: index)),
                ),
                Expanded(child: Container()),
                ReusableNextButton(buttonName: "NEXT",onTap:(){
                    Get.toNamed("/exercise_push_up_page");
                },bottomMargin: 10,topMargin: 0,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseGoalCard({required String goalName,required String goalImage,required int index})=>InkWell(
    onTap:(){
      setState((){
        if(index==0){
          loseWeight=!loseWeight;
          buildMuscle=false;
          keepFit=false;
        }else if(index==1){
          buildMuscle=!buildMuscle;
          loseWeight=false;
          keepFit=false;
        }else if(index==2){
          keepFit=!keepFit;
          loseWeight=false;
          buildMuscle=false;
        }
        map[map.keys.elementAt(0)]=loseWeight;
        map[map.keys.elementAt(1)]=buildMuscle;
        map[map.keys.elementAt(2)]=keepFit;
        debugPrint(map.toString());
      });
    },
    child:   Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      height: 150,
      width:double.infinity,
      decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(offset: const Offset(1,2),color: Colors.black.withOpacity(0.3),blurRadius: 5)
          ],
          border: map[map.keys.elementAt(index)]==true ?Border.all(color: Colors.black,width: 2) :Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20),
            child: Text(goalName,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
          ),
          Image(image: AssetImage(goalImage),fit: BoxFit.cover,)
        ],
      ),
    ),
  );

}

