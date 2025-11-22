
import 'package:bloccleancode/utils/enum.dart';

class ApiResponse<T>{//it can be any type

  Status ?status;
  T?data;
  String ?message;

  //now make constructor
ApiResponse(this.status,this.message,this.data);

//it is also constructor with initalization

 ApiResponse.loading():status=Status.loading;//it is named constructor crates a new instances

ApiResponse.completed(this.data):status=Status.completed;

ApiResponse.error(this.message):status=Status.error;



 @override
  String toString() {
    // TODO: implement toString
   return 'Status :$status \n Message :$message \n DAta :$data';
  }

}