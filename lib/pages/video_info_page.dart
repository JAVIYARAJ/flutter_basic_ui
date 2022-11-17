import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/model/user.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {

  List videoInfo=[];
  bool _playArea=false;
  bool _isPlaying=false;
  bool _disposed=false;  //use for free/release previous video cache memory.
  int _isPlayingIndex=-1;
  VideoPlayerController? _controller;

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
    //final ans=readVideoList();
    //debugPrint("video ans is $ans");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller=null;
    super.dispose();
  }


  Widget _buildWidget(VideoModel videoModel){
    return Container(
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
                  Text(videoModel.title,style:const TextStyle(fontSize: 20,color: Colors.black),),
                  const SizedBox(height: 10,),
                  Text(videoModel.title,style:const TextStyle(fontSize: 15,color: Colors.black26),),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
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
                                Get.back();
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
                ):Column(
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
                            child:Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                        onTap: (){
                                          Get.back();
                                        },
                                    child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 25,)))),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.info_outline,color: Colors.white,size: 25,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    _playVideo(context),
                    const SizedBox(height: 6,),
                    _controllerPanel(context),
                    const SizedBox(height: 6,)
                  ],
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
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text("3 sets",style: TextStyle(fontSize: 18,color: Colors.black54),),
                                )
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

  var _onUpdateControllerTime=0;

  Duration? _duration;
  Duration? _position;
  var _progress=0.0;

  void __onControllerUpdate() async{

    //if previous video resources already free then no need to call this method.
    if(_disposed){
      return;
    }

    _onUpdateControllerTime=0;
    final now=DateTime.now().microsecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }

    _onUpdateControllerTime=now+500;

    final controller=_controller;
    if(controller==null){
      debugPrint("controller is null");
      return;
    }

    if(!controller.value.isInitialized){
      debugPrint("controller can not be initialized");
      return;
    }

    _duration ??= _controller?.value.duration;  //update total video duration

    var duration=_duration;

    if(duration==null) return;

    var position=await controller.position;
    _position=position; //update current video position

    final playing=controller.value.isPlaying;
    if(playing){
      if(_disposed) return;
      setState((){
        _progress=_position!.inMilliseconds.ceilToDouble()/duration.inMilliseconds.ceilToDouble();
      });
    }

    _isPlaying=playing;
  }

  _onTapVideo(int index){
    //when i click on video widget then this controller is initialized.
    final controller=VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final VideoPlayerController? previousVideoController=_controller;

    _controller=controller;

    if(previousVideoController!=null){
      previousVideoController.removeListener(__onControllerUpdate);
      previousVideoController.pause();
    }

    setState((){
    });

    // ignore: avoid_single_cascade_in_expression_statements
    controller..initialize().then((_){
      _isPlayingIndex=index;
      previousVideoController?.dispose();
      controller.addListener(__onControllerUpdate);
      controller.play(); //when video is initialized then automatically video is played.
      setState((){

      });
    });

  }

  Widget _playVideo(BuildContext context){
    final controller=_controller;

    final temp=controller?.value.isInitialized;
    if(temp!){
      return AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          height: 300,
          width: 300,
          child: VideoPlayer(controller!),
        ),
      );
    }else{
      return const AspectRatio(
          aspectRatio: 16/9,
          child: Center(child: Text("Plz wait")));
    }
  }

  _snackBarView(){
    Get.snackbar(
        "Video List","",
        icon:const Icon(Icons.face,size: 30,color: Colors.white,),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        messageText:const Text("No more video in the list",style: TextStyle(
            color: Colors.white,fontSize: 20
        ),),
        backgroundColor: Colors.blueAccent.withOpacity(0.7));
  }

  //if value> 10 means display in two digit otherwise one digit.
  String convertTwo(int value){
    return value < 10 ?"0$value" : "$value";
  }

  Widget _controllerPanel(BuildContext context){

    final noMute=(_controller?.value.volume??0)>0;

    //total video length
    final duration = _duration?.inSeconds ?? 0; //if second is null
    final head = _position?.inSeconds ?? 0; //if second is null
    final remained = max(0, duration-head); //remaining time
    final mins = convertTwo(remained ~/60);  // 22 ~/ 7 = 3.1...=>3 //tilled sign use for getting a only integer part.
    final secs = convertTwo(remained % 60);  // 22 % 7 = 3.1...=>1


    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: const RoundedRectSliderTrackShape(),
                      trackHeight: 2.0,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayColor: Colors.red.withAlpha(32),
                      // ignore: prefer_const_constructors
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                      activeTickMarkColor: Colors.red[700],
                      inactiveTickMarkColor: Colors.red[100],
                      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.redAccent,
                      valueIndicatorTextStyle: const TextStyle(
                          color: Colors.white
                      )
                  ), child: Slider(
                  value: max(0,min(_progress*100,100)),
                  min: 0,
                  divisions: 100,
                  label: _position?.toString().split(".")[0],

                  max: 100, onChanged: (double value) {
                  setState((){
                    _progress=value*0.01;
                  });
                },
                  onChangeStart: (value){
                    _controller?.pause();
                  },
                  onChangeEnd: (value){
                    final duration=_controller?.value.duration;
                    if(duration!=null){
                      var newValue=max(0,min(value,99))*0.01;
                      var millis=(duration.inMilliseconds * newValue).toInt();
                      _controller?.seekTo(Duration(milliseconds: millis));
                      _controller?.play();
                    }
                  },

                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:10),
                child: Text("$mins:$secs",style:const TextStyle(fontSize: 20,color: Colors.white),),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(onPressed: () async{
                setState((){
                  if(noMute){
                    _controller?.setVolume(0.0);
                  }else{
                    _controller?.setVolume(1.0);
                  }
                });
              }, child:Icon(noMute? Icons.volume_up:Icons.volume_off,size: 20,color: Colors.white,)),
              // ignore: deprecated_member_use
              FlatButton(onPressed: () async{
                final index=_isPlayingIndex-1;
                // ignore: prefer_is_empty
                if(index>=0 && videoInfo.length>=0){
                  _onTapVideo(index);
                }else{
                  _snackBarView();
                }

              }, child:const Icon(Icons.fast_rewind,size: 20,color: Colors.white,)),
              // ignore: deprecated_member_use
              FlatButton(onPressed: () async{
                if(_isPlaying){
                  setState((){
                    _isPlaying=false;
                  });
                  _controller?.pause();
                }else{
                  setState((){
                    _isPlaying=true;
                  });
                  _controller?.play();
                }
              }, child:Icon(_isPlaying?Icons.pause:Icons.play_arrow,size: 20,color: Colors.white,)),
              // ignore: deprecated_member_use
              FlatButton(onPressed: () async {
                final index=_isPlayingIndex+1;
                // ignore: prefer_is_empty
                if(index<=videoInfo.length-1){
                  _onTapVideo(index);
                }else{
                  _snackBarView();
                }
              }, child:const Icon(Icons.fast_forward,size: 20,color: Colors.white,)),
            ],
          ),
        ],
      ),
    );
  }
}


