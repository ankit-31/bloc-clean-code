
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {

   final double ?size;
  const LoadingWidget({super.key,this.size=40});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Platform.isAndroid?CircularProgressIndicator(
          color: Colors.green,

        ):CupertinoActivityIndicator(
          color: Colors.green,
        ),
      ),
    );
  }
}
