import 'package:flutter/material.dart';
import 'package:traning_app/widget/reusable_button.dart';

class ExerciseFocusArea extends StatefulWidget {
  const ExerciseFocusArea({Key? key}) : super(key: key);

  @override
  State<ExerciseFocusArea> createState() => _ExerciseFocusAreaState();
}

class _ExerciseFocusAreaState extends State<ExerciseFocusArea> {

  List<String> exerciseType=["FULL BODY","ARM","CHEST","ABS","LEG"];

  Map<String,bool> selectedExerciseType ={"FULL BODY":false,"ARM":false,"CHEST":false,"ABS":false,"LEG":false};

  bool fullBodyIsSelected=true;
  bool otherExerciseIsSelected=false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
                    const Text("Skip",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
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

                },)
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
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/focus_area_icon.jpg")
      )
    ),
  );

  Widget _leftWidgetCard({required String value,required int index})=>InkWell(
    onTap: (){
      setState((){
        if(index==0){
          fullBodyIsSelected=!fullBodyIsSelected;
          selectedExerciseType[exerciseType[0]]=fullBodyIsSelected;
        }else{
          if(fullBodyIsSelected==false){
            selectedExerciseType[exerciseType[index]]=!selectedExerciseType[exerciseType[index]]!;
            if(selectedExerciseType[exerciseType[index]]==true){
              otherExerciseIsSelected=true;
            }
          }
        }
        debugPrint(selectedExerciseType.toString());
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
              selectedExerciseType[exerciseType[index]]==true?
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
