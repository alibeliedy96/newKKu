class GetAvailableBusResponse {
  bool? success;
  List<AvailableBusData>? data;
  String? message;

  GetAvailableBusResponse({this.success, this.data, this.message});

  GetAvailableBusResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <AvailableBusData>[];
      json['data'].forEach((v) {
        data!.add(AvailableBusData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class AvailableBusData {
  int? id;
  String? fullName;
  dynamic emailVerifiedAt;
  String? email;
  String? phoneNumber;
  int? isVerified;
  String? photo;
  int? cityId;
  int? stateId;
  dynamic major;
  dynamic levelAcademic;
  dynamic fcmToken;
  dynamic createdAt;
  dynamic updatedAt;
  String? type;
  String? busName;
  String? busNumber;
  String? busStartTime;
  int? stateIdTwo;
  City? city;
  State? state;
  State? stateTwo;

  AvailableBusData(
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
        this.city,
        this.state,
        this.stateTwo});

  AvailableBusData.fromJson(Map<String, dynamic> json) {
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
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    stateTwo = json['state_two'] != null
        ? State.fromJson(json['state_two'])
        : null;
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
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (stateTwo != null) {
      data['state_two'] = stateTwo!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;

  City({this.id, this.name, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class State {
  int? id;
  String? name;
  int? cityId;
  dynamic createdAt;
  dynamic updatedAt;

  State({this.id, this.name, this.cityId, this.createdAt, this.updatedAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
