import 'package:bloccleancode/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputWidget extends StatelessWidget {

  final FocusNode passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(

      buildWhen: (current,previous)=>current.password!=previous.password,
      builder: (context, state) {

        return TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          decoration: InputDecoration(
            hintText: "Enter Password"
            ,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          onChanged: (value) {

            context.read<LoginBloc>().add(PasswordChanged(pass: value));
          }
          ,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }
            if(value.length<6){
              return 'Character must be greater than 6';
            }
            return null;
          },
          onFieldSubmitted: (value) {

          },
        );
      },
    );
  }
}
