import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/pages/video_info_page.dart';

import '../auth/google_auth.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // This widget is the root of your application.

  List info=[];

  _initData() async{
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      setState((){
        info=json.decode(value);
      });
    });
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {

     final user=FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                const Text("Training",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                InkWell(
                  onTap: (){
                    GoogleSignProvider().logout();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user?.photoURL??"https://static-media-prod-cdn.itsre-sumo.mozilla.net/static/default-FFA-avatar.2f8c2a0592bda1c5.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text("welcome ${user?.displayName}",style: const TextStyle(fontSize: 20,color: Colors.black26,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Your Program",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),),
                Row(
                  children:[
                    const Text("Details",style: TextStyle(color: Colors.cyan,fontSize: 20),),
                    const SizedBox(width: 10,),
                    GestureDetector(
                        onTap: (){
                          Get.to(const VideoInfo());
                        },
                        child: const Icon(Icons.arrow_forward))
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                        offset: const Offset(10,10),
                        blurRadius: 20,
                        color:Colors.blueAccent.withOpacity(0.3)
                    )
                  ],
                  gradient: LinearGradient(colors:[
                    Colors.cyan,
                    Colors.blueAccent.withOpacity(0.7)
                  ]),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15),topLeft: Radius.circular(15),topRight:Radius.circular(80))),
              height: 200,
              width: double.infinity,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text("Next Workout",style: TextStyle(fontSize: 17,color: Colors.white),),
                  const SizedBox(height: 5,),
                  const Text("Legs const Toning",style: TextStyle(fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 5,),
                  const Text("and Glutes Workout",style: TextStyle(fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.alarm,color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("60 sec",style: TextStyle(fontSize: 15,color: Colors.white),)
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color:  Colors.greenAccent.withOpacity(0.5),
                                  offset: const Offset(1,1),
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,size: 50,color: Colors.white,shadows: [

                        ],),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                        offset:const Offset(8, 10),
                        blurRadius: 10,
                        color: Colors.blueAccent.withOpacity(0.3)
                    ),
                    BoxShadow(
                        offset:const Offset(-1, -2),
                        blurRadius: 5,
                        color: Colors.blueAccent.withOpacity(0.3)
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/excercise_card_icon.png")
                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 150,top: 30,right: 5),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        const Text("Your are doing great",
                          style: TextStyle(fontSize: 17,color: Colors.cyan),),
                        const SizedBox(height: 5,),
                        RichText(text: const TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                            children: [
                              TextSpan(text: "stick to your plan"),
                            ]
                        )),

                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Text("Area of focus",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal),),
            Expanded(child: GridView.count(
              crossAxisCount: 2, children:
            List.generate(info.length, (index){
              return Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurpleAccent.withOpacity(0.2),
                            offset: const Offset(2,3),
                            blurRadius: 2
                        ),
                        BoxShadow(
                            color: Colors.deepPurpleAccent.withOpacity(0.2),
                            offset: const Offset(-1,-2),
                            blurRadius: 2
                        ),
                      ]
                  ),
                  height: 200,
                  width: 200,
                  child:Column(
                    children: [
                      Image(image: AssetImage(info[index]["img"]),fit: BoxFit.fill,),
                      const SizedBox(height: 10,),
                      Text(info[index]["title"],style: const TextStyle(color: Colors.cyan,fontSize: 15),)
                    ],
                  )
              );
            })
              ,))
          ],
        ),
      ),
    );
  }
}
