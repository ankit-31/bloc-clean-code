import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

//
//
// run it in terminal  flutter pub run build_runner build --delete-conflicting-outputs
@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    @Default('') @JsonKey(
        name: 'token') //json keys required if there is another list on it to mapp correctly we need it
    String token, //it is jsonkey coming from response of login api
    @Default('') @JsonKey(name: 'error') String error,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);




}
