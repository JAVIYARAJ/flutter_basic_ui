import 'package:flutter/material.dart';

class ReusableNextButton extends StatelessWidget {

  String? buttonName;
  VoidCallback? onTap;
  double? bottomMargin;
  double? topMargin;

  ReusableNextButton({this.buttonName,this.onTap,this.bottomMargin,this.topMargin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin!,top: topMargin!),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:LinearGradient(
                colors: [
                  Colors.cyanAccent.withOpacity(0.4),
                  Colors.cyan.withOpacity(0.4),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
            )
        ),
        child: Center(
          child: Text(buttonName!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}


