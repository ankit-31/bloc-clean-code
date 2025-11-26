
import 'package:bloc/bloc.dart';
import 'package:bloccleancode/repository/auth/login_repository.dart';
import 'package:bloccleancode/services/session_manager/session_manager.dart';
import 'package:bloccleancode/utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';




class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginRepository loginRepository=LoginRepository();

  LoginBloc():super(const LoginState()){
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<LoginApi>(loginApi);

  }

  void onEmailChanged(EmailChanged event,Emitter<LoginState>emit){



    print(event.email);
    emit(state.copyWith(email: event.email));

  }
  void onPasswordChanged(PasswordChanged event,Emitter<LoginState>emit){
    emit(state.copyWith(password: event.pass));

  }
  void loginApi(LoginApi event,Emitter<LoginState>emit)async {
    //now we need to map as data contains email and pasword


    Map data={//dart to json 
      'email':state.email,
      'password':state.password,
    };
    emit(state.copyWith(status: LoginStatus.loading));
      await loginRepository.loginApi(data).then((value) async {
        if(value.error.isNotEmpty){
          emit(state.copyWith(status: LoginStatus.error));
          emit(state.copyWith(error: value.error.toString()));

        }else{
          //for session maintaining
          await SessionController().saveUserPreferences(value);
          await SessionController().getUserPreferences();
          emit(state.copyWith(status: LoginStatus.sucess));
          print('Success');
        }



      }).onError((error,stackTrace){
        emit(state.copyWith(error: error.toString()));
      });


  }



}
