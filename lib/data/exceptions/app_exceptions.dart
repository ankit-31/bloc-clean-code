

class AppException implements Exception{


  final message;
  final prefix;

  AppException([this.message,this.prefix]);
  @override
  String toString() {
    // TODO: implement toString
    return "$prefix$message";//it automatically convert exception e to string while printing
  }


}

class InternetException extends AppException{
  InternetException([String ?message]):super(message,'No internet');//it takes parent constructor with msg and prefix

}

class ServerException extends AppException{
  ServerException([String ?message]):super(message,"Server error");

}

class RequestTimeout extends AppException{
  RequestTimeout([String ?message]):super(message,'Request Time Out');
}


class IncorrectUrl extends AppException{
  IncorrectUrl([String ? message]):super(message,"");
}
class FetchException extends AppException{
  FetchException([String? message]):super(message,'');
}