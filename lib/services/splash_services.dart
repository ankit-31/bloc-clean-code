import 'dart:async';

import 'package:bloccleancode/config/routes/routes.dart';
import 'package:bloccleancode/config/routes/routes_name.dart';
import 'package:bloccleancode/services/session_manager/session_manager.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {
  //to check whether user is already login or not

  //check whether user is login or not
  void islogin(BuildContext context) {
    SessionController()
        .getUserPreferences()
        .then((value) {
          if (SessionController().isLogin ?? false) {
            Timer(
              Duration(seconds: 3),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.homeScreen,
                (routes) => false,
              ),
            );
          }
          else{
            Timer(
              Duration(seconds: 3),
                  () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.loginScreen,
                    (routes) => false,
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          Timer(
            Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.loginScreen,
              (routes) => false,
            ),
          );
        });
  }
}
