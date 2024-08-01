

class LogoutModel{

   bool? success;
   String? message;

   LogoutModel({this.success,this.message});

   LogoutModel.fromjson(Map<String,dynamic> json){
      success=json["success"];
      message=json["message"];
   }
}