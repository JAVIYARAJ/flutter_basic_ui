import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traning_app/user.dart';
class VideoSample extends StatelessWidget {
  const VideoSample({Key? key}) : super(key: key);

  Widget _buildWidget(VideoModel videoModel)=>
      Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueAccent.withOpacity(0.6)
        ),
        child: Column(
          children: [
            Text(videoModel.title,style: const TextStyle(fontSize: 20),),
            Text(videoModel.time,style: const TextStyle(fontSize: 20),),
            Text(videoModel.videoUrl,style: const TextStyle(fontSize: 20),),
          ],
        ),
      );

  Stream<List<VideoModel>> readVideoList()=>
      FirebaseFirestore.instance.collection("VideoList").snapshots()
          .map((snapshot) => snapshot.docs.map(
              (docs) => VideoModel.fromJson(docs.data())
      ).toList());


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: StreamBuilder<List<VideoModel>>(
            stream: readVideoList(),
            builder: (context,snap){
              if(snap.hasData){

                final video=snap.data!;

                return ListView(
                  children:video.map(_buildWidget).toList(),
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
