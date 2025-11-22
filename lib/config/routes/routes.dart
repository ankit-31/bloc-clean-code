

import 'package:bloccleancode/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/view.dart';

class Routes{

   static Route<dynamic> generateRoutes(RouteSettings settings){

     switch(settings.name){
       case RoutesName.splashScreen:
         return MaterialPageRoute(builder: (context)=> const SplashScreen());

       case RoutesName.homeScreen:
         return MaterialPageRoute(builder: (context)=> const HomeScreen());

       case RoutesName.loginScreen:
         return MaterialPageRoute(builder: (_)=>const LoginScreen());


       default:
         return MaterialPageRoute(builder: (context){
           return Scaffold(
             body: Center(
               child: Text("nothing is available"),
             ),
           );
         });


     }
   }

}