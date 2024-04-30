class GetRegisteredAttendanceResponse {
  bool? success;
  List<RegisteredAttendanceData>? data;
  String? message;

  GetRegisteredAttendanceResponse({this.success, this.data, this.message});

  GetRegisteredAttendanceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <RegisteredAttendanceData>[];
      json['data'].forEach((v) {
        data!.add(RegisteredAttendanceData.fromJson(v));
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

class RegisteredAttendanceData {
  int? id;
  int? userId;
  int? driverId;
  String? orderDate;
  String? createdAt;
  String? updatedAt;
  User? user;

  RegisteredAttendanceData(
      {this.id,
        this.userId,
        this.driverId,
        this.orderDate,
        this.createdAt,
        this.updatedAt,
        this.user});

  RegisteredAttendanceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['driver_id'] = driverId;
    data['order_date'] = orderDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
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
  City? city;
  State? state;

  User(
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
        this.state});

  User.fromJson(Map<String, dynamic> json) {
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
