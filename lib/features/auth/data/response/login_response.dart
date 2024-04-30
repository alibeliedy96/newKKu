class LoginResponse {
  bool? success;
  LoginData? data;
  String? message;

  LoginResponse({this.success, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class LoginData {
  int? id;
  String? fullName;
  dynamic emailVerifiedAt;
  String? email;
  String? phoneNumber;
  int? isVerified;
  String? photo;
  int? cityId;
  int? stateId;
  String? major;
  String? levelAcademic;
  dynamic fcmToken;
  String? createdAt;
  String? updatedAt;
  String? type;
  dynamic busName;
  dynamic busNumber;
  dynamic busStartTime;
  dynamic stateIdTwo;
  String? token;

  LoginData(
      {this.id,
        this.fullName,
        this.emailVerifiedAt,
        this.email,
        this.phoneNumber,
        this.isVerified,
        this.photo,
        this.cityId,
        this.stateId,
        this.major,
        this.levelAcademic,
        this.fcmToken,
        this.createdAt,
        this.updatedAt,
        this.type,
        this.busName,
        this.busNumber,
        this.busStartTime,
        this.stateIdTwo,
        this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    emailVerifiedAt = json['email_verified_at'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    isVerified = json['isVerified'];
    photo = json['photo'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    major = json['major'];
    levelAcademic = json['level_academic'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    busName = json['bus_name'];
    busNumber = json['bus_number'];
    busStartTime = json['bus_start_time'];
    stateIdTwo = json['state_id_two'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email_verified_at'] = emailVerifiedAt;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['isVerified'] = isVerified;
    data['photo'] = photo;
    data['city_id'] = cityId;
    data['state_id'] = stateId;
    data['major'] = major;
    data['level_academic'] = levelAcademic;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['bus_name'] = busName;
    data['bus_number'] = busNumber;
    data['bus_start_time'] = busStartTime;
    data['state_id_two'] = stateIdTwo;
    data['token'] = token;
    return data;
  }
}
