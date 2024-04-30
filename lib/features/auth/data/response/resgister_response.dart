class RegisterResponse {
  bool? success;
  dynamic data;
  String? message;

  RegisterResponse({this.success, this.data, this.message});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}
