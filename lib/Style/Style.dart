

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: colorRed,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: colorGreen,
      textColor: Colors.white,
      fontSize: 16.0
  );
}



ScreenBackground(context){
  return SvgPicture.asset(
      'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );


}

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(
        color: colorGreen,
        width: 1,
      )
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),

    enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(
          color: colorWhite,
          width: 0,
        )
    ),
    border: OutlineInputBorder(),
    labelText: label,
  );
}
DecoratedBox appDecoratedBox(child){

  return DecoratedBox(

      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: child,
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite,width: 1),
        borderRadius: BorderRadius.circular(4),
      )

  );
}
ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    )

  );
}
Ink SuccessButtonChild(buttonText){
  return Ink(
   decoration: BoxDecoration(
     color: colorGreen,
     borderRadius: BorderRadius.circular(6),
   ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(buttonText,style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),),
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProducGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      mainAxisExtent: 200,

  );
  
  
}