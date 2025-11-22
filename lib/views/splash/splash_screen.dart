import 'package:bloccleancode/config/components/internet_exception.dart';
import 'package:bloccleancode/config/components/loading_widget.dart';
import 'package:bloccleancode/config/routes/routes_name.dart';
import 'package:bloccleancode/data/exceptions/app_exceptions.dart';
import 'package:bloccleancode/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices =SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(





      body: Center(child: Text('Splash Screen')),

    );
  }
}
