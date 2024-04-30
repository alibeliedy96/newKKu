

class RegisterRequest {



  String fullName;
  String? email;
  String? cityId;
  String? stateId;
  String? password;
  String? confirmPassword;





  RegisterRequest({required this.fullName,required   this.cityId,required this.email,
    required this.stateId,
    required this.confirmPassword,
    this.password, });

   toRequest() {
     return {

         "full_name" : fullName ,
         "email"     : email,
         "city_id"   : cityId,
         "state_id"  : stateId,
         "password"     : password,
         "c_password"   : confirmPassword



  };
   }


}