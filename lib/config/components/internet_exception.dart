import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {

  final void  callback;
  const InternetExceptionWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*.15,)
        ,
        const Icon(
          Icons.cloud_off,
          color: Colors.red,
          size: 50,
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          callback;
        }, child: Text('Retryyyy'))
      ],

    );
  }
}
