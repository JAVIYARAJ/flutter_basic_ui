import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traning_app/pages/welcome/exercise_focur_area_page.dart';
import 'package:traning_app/widget/reusable_button.dart';
import 'package:get/get.dart';


import '../../constant/constant.dart';
import '../../model/user_type.dart';
import '../../state/state_controller.dart';

class GenderIdentifyPage extends StatefulWidget {
  const GenderIdentifyPage({Key? key}) : super(key: key);



  @override
  State<GenderIdentifyPage> createState() => _GenderIdentifyPageState();
}

class _GenderIdentifyPageState extends State<GenderIdentifyPage> {

  var selectedUserType;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
            child: Column(
              children:[
                const Text("WHAT'S YOUR GENDER?",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                const Text("Let's know you better",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.normal),),const
                SizedBox(height: 20,),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        InkWell(
                          child: _buildGenderWidget(index:1,
                              colors: selectedUserType==User.MALE
                                  ?selectedUserCardColor
                                  :unSelectedUserCardColor
                          ),onTap: (){
                                  setState((){
                                    selectedUserType=User.MALE;
                                  });
                        },),
                        InkWell(child: _buildGenderWidget(index:2,colors: selectedUserType==User.FEMALE
                            ?selectedUserCardColor
                            :unSelectedUserCardColor
                        ),onTap: (){
                                  setState((){
                                    selectedUserType=User.FEMALE;
                                  });
                        },),
                      ]
                  ),
                ),

                ReusableNextButton(buttonName: "NEXT",onTap:(){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExerciseFocusArea()));
                  if(selectedUserType!=null){
                    Get.toNamed("/exercise_focus_area_page",arguments: {
                      "userType":selectedUserType,
                    });
                  }else{
                    Get.snackbar("Alert","Please Select Gender",snackPosition: SnackPosition.TOP,backgroundColor: Colors.blueAccent.withOpacity(0.4));
                  }
                },bottomMargin: 10,topMargin: 0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildGenderWidget({required int index,required Color colors}){
  return Container(
    padding: const EdgeInsets.only(top: 15),
    height: 275,
    width: 150,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            offset: const Offset(1,2),
            color: Colors.black26.withOpacity(0.2),
            blurRadius: 10
        ),
        BoxShadow(
            offset: const Offset(-1,-2),
            color: Colors.black26.withOpacity(0.2),
            blurRadius: 5
        )
      ],
      borderRadius: BorderRadius.circular(20),
      color:colors,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("assets/gender_icon$index.jpg"),fit: BoxFit.cover,width: 200,height: 220,),
        const SizedBox(height: 10,),
        Text(index==1?"MALE":"FEMALE",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
      ],
    ),
  );
}
