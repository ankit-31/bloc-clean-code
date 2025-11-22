

import 'dart:convert';

import 'package:bloccleancode/models/user/user_model.dart';
import 'package:bloccleancode/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController{

  static final SessionController _controller=SessionController._internal();


  UserModel userModel=UserModel();
  LocalStorage localStorage=LocalStorage();
  bool ?isLogin;

  SessionController._internal(){//it is used to make singleton pattern
    isLogin=false;//by default false
  }

  factory SessionController(){//factory constructor which return pre existing instances
    return _controller;
  }

  Future<void>saveUserPreferences(dynamic  user)async{

    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');

  }
  Future<void>getUserPreferences()async{
    try{
      var userData=await localStorage.readValue('token');
      var isLogin=await localStorage.readValue('isLogin');
      if(userData.isNotEmpty){
        SessionController().userModel=UserModel.fromJson(jsonDecode(userData));//it can be accessed golbally

      }
      SessionController().isLogin=isLogin=='true'?true:false;

    } catch(e){
      debugPrint(e.toString());
    }
  }


}


