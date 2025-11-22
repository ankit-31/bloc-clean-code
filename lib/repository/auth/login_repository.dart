

import 'package:bloccleancode/config/internet_url/internet_url.dart';
import 'package:bloccleancode/data/network/network_api_service.dart';
import 'package:bloccleancode/models/user/user_model.dart';

class LoginRepository{
    final _api=NetworkApiService();
   Future<UserModel> loginApi(var data)async{//model is return type
     final response= await _api.postApi(InternetUrl.loginUrl, data);

     return UserModel.fromJson(response);
   }

}