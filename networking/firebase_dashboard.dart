import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

_readVideoList({required String category}){

  final value;

  final fb=FirebaseFirestore.instance.collection("videoList");

   value=fb.doc();
  debugPrint(value);
}