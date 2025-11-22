

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlushBarHelper{


  static void flushbarErrorMessage(String mesage,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      message: mesage,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.TOP,

    )..show(context));//.. is cascade to invoeke multiple methods on same obj
  }
  static void flushbarSucessMessage(String mesage,BuildContext context){
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: const EdgeInsets.all(15),
      message: mesage,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,

    )..show(context));//.. is cascade to invoeke multiple methods on same obj
  }
}