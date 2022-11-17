import 'package:flutter/material.dart';
import 'package:traning_app/widget/reusable_button.dart';
import 'package:get/get.dart';

import '../../model/user_type.dart';
import '../../state/state_controller.dart';
import '../../widget/reusable_top_back_pannel.dart';

class ExerciseFocusArea extends StatefulWidget {
  const ExerciseFocusArea({Key? key}) : super(key: key);

  @override
  State<ExerciseFocusArea> createState() => _ExerciseFocusAreaState();
}

class _ExerciseFocusAreaState extends State<ExerciseFocusArea> {


  List<String> exerciseType=["FULL BODY","ARM","CHEST","ABS","LEG"];

  Map<String,bool> selectedExerciseType ={"FULL BODY":false,"ARM":false,"CHEST":false,"ABS":false,"LEG":false};

  bool fullBodyIsSelected=false;
  bool otherExerciseIsSelected=false;

  var userType=Get.arguments["userType"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReusableTopBackPanel(backOnTap: (){
                  Get.back();
                },skipOnTap: (){

                },),
                const SizedBox(height: 30,),
                const Text("PLEASE CHOOSE YOUR",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                const Text("FOCUS AREA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                const SizedBox(height: 30,),
                Row(
                  children: [
                        Row(
                          children: [
                            _leftFocusAreaWidget(),
                            const SizedBox(width: 10,),
                            _rightFocusAreaWidget(),
                          ],
                        )
                  ],
                ),
                Expanded(child: Container()),
                ReusableNextButton(buttonName: "NEXT",onTap: (){
                    // if(selectedExerciseType.isEmpty){
                    //   Get.snackbar("Exercise Focus Area","Please Select Your Focus Area",backgroundColor: Colors.blueAccent.withOpacity(0.4));
                    // }
                  Get.toNamed("/exercise_goal_page");
                },bottomMargin: 10,topMargin: 0,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _leftFocusAreaWidget()=>Container(
    height: 350,
    width: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) => _leftWidgetCard(value:exerciseType[index],index: index)),
    ),
  );

  Widget _rightFocusAreaWidget()=>Container(
    height: 350,
    width: 150,
    decoration:BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          userType==User.MALE ? "assets/male_focus_area_icon.jpg": "assets/female_focus_area_icon.png"
        )
      )
    ),
  );

  Widget _leftWidgetCard({required String value,required int index})=>InkWell(
    onTap: (){
      setState((){
        if(index==0){
          for(int i=1;i<selectedExerciseType.length;i++){
            selectedExerciseType[exerciseType[i]]=false;
          }
          fullBodyIsSelected=!fullBodyIsSelected;
          selectedExerciseType[exerciseType[0]]=fullBodyIsSelected;
        }else{
          fullBodyIsSelected=false;
          selectedExerciseType[exerciseType[index]]=!selectedExerciseType[exerciseType[index]]!;
        }
      });
    },
    child: Container(
      margin: const EdgeInsets.only(top: 5,bottom: 5),
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          border: index==0 ? Border.all(
              width: 2,
              color: fullBodyIsSelected==true ? Colors.black : Colors.white
          ) : Border.all(
              width: 2,
              color:
              fullBodyIsSelected==false && selectedExerciseType[exerciseType[index]]==true?
              Colors.black:Colors.white
          ),
        boxShadow:[
          BoxShadow(offset: const Offset(1,2),color: Colors.black.withOpacity(0.3),blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      child: Center(child: Text(value,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
    ),
  );
}
