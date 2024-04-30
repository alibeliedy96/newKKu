

class UpdateProfileRequest {



  String fullName;
  String? major;
  String? cityId;
  String? stateId;
  String? levelAcademic;
  String? phoneNumber;





  UpdateProfileRequest({required this.fullName,required   this.cityId,required this.major,
    required this.stateId,
    required this.phoneNumber,
    required this.levelAcademic, });

  
   toRequest() {
     return {

         "full_name" : fullName ,
         "major"     : major,
         "city_id"   : cityId,
         "state_id"  : stateId,
         "level_academic"     : levelAcademic,
         "phone_number"   : phoneNumber



  };
   }


}