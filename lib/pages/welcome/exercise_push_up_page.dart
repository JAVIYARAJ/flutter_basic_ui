import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/widget/reusable_button.dart';
import 'package:traning_app/widget/reusable_top_back_pannel.dart';

class ExercisePushUpPage extends StatefulWidget {
  const ExercisePushUpPage({Key? key}) : super(key: key);

  @override
  State<ExercisePushUpPage> createState() => _ExercisePushUpPageState();
}

class _ExercisePushUpPageState extends State<ExercisePushUpPage> {

  final map={"Beginner":"3-5 push-ups","Intermediate":"5-10 push-ups","Advanced":"At least 10"};

  final result={"Beginner":false,"Intermediate":false,"Advanced":false};

  var beginner=false;
  var intermediate=false;
  var advanced=false;

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
                  ReusableTopBackPanel(
                      backOnTap: (){
                          Get.back();
                      },
                    skipOnTap: (){

                    },
                  ),
                  const SizedBox(height: 10,),
                  const Text("HOW MANY PUSH-UPS CAN",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                  const Text("YOU DO AT ONE TIME?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                  const SizedBox(height: 30,),
                  Column(
                    children:List.generate(map.length, (index) => _buildPushUpCard(cardTitle:map.keys.elementAt(index),cardSubTitle:map.values.elementAt(index),index: index)),
                  ),
                  Expanded(child: Container()),
                  ReusableNextButton(buttonName: "NEXT",onTap: (){
                  },bottomMargin:10,topMargin: 0,)
                ],
              ),
          ),
        ),
      ),
    );
  }
  Widget _buildPushUpCard({required String cardTitle,required String cardSubTitle,required int index})=>InkWell(
    onTap: (){
      setState((){
        if(index==0){
          beginner=!beginner;
          intermediate=false;
          advanced=false;
        }else if(index==1){
          intermediate=!intermediate;
          beginner=false;
          advanced=false;
        }else if(index==2){
          advanced=!advanced;
          beginner=false;
          intermediate=false;
        }
        result[result.keys.elementAt(0)]=beginner;
        result[result.keys.elementAt(1)]=intermediate;
        result[result.keys.elementAt(2)]=advanced;
        debugPrint(result.toString());
      });

    },
    child:   Container(
      padding: const EdgeInsets.only(left: 50),
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: result[result.keys.elementAt(index)]==true ?Border.all(color: Colors.black,width: 2) :Border.all(color: Colors.white),
          boxShadow: const [
            BoxShadow(offset: Offset(1,2),blurRadius:5,color: Colors.black26)
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardTitle,style: const TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          Text(cardSubTitle,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.normal),),
        ],
      ),
    ),
  );
}

