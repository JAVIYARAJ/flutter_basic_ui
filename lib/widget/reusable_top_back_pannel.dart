import 'package:flutter/material.dart';
class ReusableTopBackPanel extends StatelessWidget {

  VoidCallback? backOnTap;
  VoidCallback? skipOnTap;

  ReusableTopBackPanel({this.backOnTap,this.skipOnTap});


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap:backOnTap,
            child: const Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
        InkWell(
            onTap: skipOnTap,
            child: const Text("Skip",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),))
      ],
    );
  }
}
