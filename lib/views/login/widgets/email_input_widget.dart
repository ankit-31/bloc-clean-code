import 'package:bloccleancode/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class EmailInputWidget extends StatelessWidget {

  final FocusNode emailFocusNodde;

  const EmailInputWidget({super.key, required this.emailFocusNodde});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (current,previous)=>current.email!=previous.email,
      builder: (context, state) {


        return TextFormField(

          keyboardType: TextInputType.text,
          focusNode: emailFocusNodde,
          decoration: InputDecoration(
            hintText: "Enter Password"
            ,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          onChanged: (value) {

            context.read<LoginBloc>().add(EmailChanged(email: value));
          }
          ,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Password';
            }


            if(!EmailValidator.validate(value)){

              return "please use correct email";
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
