import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'main_page.dart';

class VideoSong extends StatefulWidget {
  const VideoSong({Key? key}) : super(key: key);

  @override
  State<VideoSong> createState() => _VideoSongState();
}

class _VideoSongState extends State<VideoSong> {

  List videoInfo=[];
  bool _playArea=false;
  bool _isPlaying=false;
  //bool _disposed=false;
  late VideoPlayerController _controller;


  _initData(){
    DefaultAssetBundle.of(context).loadString("json/video_info.json").then((value){
      setState((){
        videoInfo=json.decode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _disposed=true;
  //   _controller?.pause();
  //   _controller?.dispose();
  //   _controller=null;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration:
            _playArea==false?
            BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan.withOpacity(0.7),Colors.blueAccent.withOpacity(0.7)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight
                )
            ):const BoxDecoration(
              color: Color(0xFF6985E8)
            ),
            child: Column(
              children: [
                _playArea==false?
                Container(
                  margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  height: 200,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainPage()));
                              },
                              child: const Icon(Icons.arrow_back_ios_rounded,size: 22,color: Colors.white,)),
                          const Icon(Icons.info_outline,size: 22,color: Colors.white,),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      RichText(
                          text: const TextSpan(
                              text: "Legs Toning\n",
                              children:[
                                TextSpan(text: "and Glues workout")
                              ],
                              style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.normal)
                          )),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.alarm,color: Colors.white,),
                                Text("68 sec")
                              ],
                            ),
                          ),
                          Container(
                            height: 28,
                            width:200,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.handyman_outlined,size: 20,color: Colors.white),
                                SizedBox(width: 5,),
                                Text("Resistant band, Kettle bell",style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ):Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  if(_playArea==true){
                                    _playArea=false;
                                  }
                                });
                              },
                              child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 25,)),
                          const Icon(Icons.info_outline,color: Colors.white,size: 25,),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      _playVideo(context),
                      const SizedBox(height: 10,),
                      _controllerPanel(context)
                    ],
                  ),
                ), //top container
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.only(topRight: Radius.circular(60))
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Circuit 1 : Legs Toning",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: const [
                                Icon(Icons.sync,size: 25,color: Colors.blueAccent,),
                                SizedBox(width: 10,),
                                Text("3 sets",style: TextStyle(fontSize: 18,color: Colors.black54),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                            child: ListView.builder(
                                itemCount: videoInfo.length,
                                itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: () async{
                              _onTapVideo(index);
                              setState((){
                                if(_playArea==false){
                                  _playArea=true;
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5,bottom: 5),
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 5
                                        ),
                                        height: 80,
                                        width: 80
                                        ,decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage("assets/play_icon.png"))
                                      ),
                                      ),
                                      const SizedBox(width: 30,),
                                      Container(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start
                                          ,children: [
                                          Text(videoInfo[index]["title"],style:const TextStyle(fontSize: 20,color: Colors.black),),
                                          const SizedBox(height: 10,),
                                          Text(videoInfo[index]["time"],style:const TextStyle(fontSize: 15,color: Colors.black26),),
                                        ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 20
                                        ,decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: const Center(
                                          child: Text("25s rest",style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                      Row(
                                        children:List.generate(36, (index){
                                          return Container(
                                            margin: const EdgeInsets.only(left: 2,right: 2),
                                            height: 1,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                  colors: [Colors.cyan.withOpacity(0.7),Colors.blueAccent.withOpacity(0.7)],
                                            ),
                                          ));
                                        }),
                                      )

                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //var _onUpdateControllerTime=0;
  void __onControllerUpdate(){

    // if(_disposed){
    //   return;
    // }

    // _onUpdateControllerTime=0;
    // final now=DateTime.now().microsecondsSinceEpoch;
    // if(_onUpdateControllerTime>now){
    //   return;
    // }
    // _onUpdateControllerTime=now+500;

    final controller=_controller;
    if(controller==null){
      debugPrint("controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller can not be initialized");
      return;
    }
    final playing=controller.value.isPlaying;
    _isPlaying=playing;
  }

  _onTapVideo(int index){
    //when i click on video widget then this controller is initialized.
    final controller=VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    // final previousController=_controller;
    //
    _controller=controller;
    //
    // if(previousController!=null){
    //   previousController.removeListener(__onControllerUpdate);
    //   previousController.pause();
    // }

    setState((){
    });

    // ignore: avoid_single_cascade_in_expression_statements
    controller..initialize().then((_){
      //previousController?.dispose();
      controller.addListener(__onControllerUpdate);
      controller.play(); //when video is initialized then automatically video is played.
      setState((){

      });
    });

  }

  Widget _playVideo(BuildContext context){
    final controller=_controller;

    final temp=controller.value.isInitialized;
    if(temp){
      return AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          height: 300,
          width: 300,
          child: VideoPlayer(controller),
        ),
      );
    }else{
      return const AspectRatio(
          aspectRatio: 16/9,
          child: Center(child: Text("Plz wait")));
    }
  }

  Widget _controllerPanel(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          FlatButton(onPressed: (){

          }, child:const Icon(Icons.fast_rewind,size: 25,color: Colors.white,)),
          // ignore: deprecated_member_use
          FlatButton(onPressed: () async{
            if(_isPlaying){
              setState((){
                _isPlaying=false;
              });
              _controller.pause();
            }else{
              setState((){
                _isPlaying=true;
              });
              _controller.play();
            }
          }, child:Icon(_isPlaying?Icons.pause:Icons.play_arrow,size: 25,color: Colors.white,)),
          // ignore: deprecated_member_use
          FlatButton(onPressed: () {
          }, child:const Icon(Icons.fast_forward,size: 25,color: Colors.white,)),
        ],
      ),
    );
  }
}

