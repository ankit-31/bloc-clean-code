import 'package:another_flushbar/flushbar_helper.dart';
import 'package:bloccleancode/bloc/login/login_bloc.dart';
import 'package:bloccleancode/config/routes/routes_name.dart';
import 'package:bloccleancode/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {

  final formkey;

  const LoginButton({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(//changes listen(here bloc builder rebuild widget but here we have to listen the buton)
      listenWhen: (current,previous)=>current.status!=previous.status,
      listener: (context, state) {
       if(state.status==LoginStatus.error){

         FlushBarHelper.flushbarErrorMessage(state.error.toString(), context);
       }
       if(state.status==LoginStatus.sucess){
         Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
         FlushBarHelper.flushbarSucessMessage('Sucessfully Login', context);

       }

      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {

                context.read<LoginBloc>().add(LoginApi());
                print('login');
              }
            },
            child: state.status==LoginStatus.loading?CircularProgressIndicator():Text('Login'),
          );
        },
      ),
    );
  }
}
