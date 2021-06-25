
import 'dart:convert';

ModelData modelDataFromJson(String str) => ModelData.fromJson(json.decode(str));

String modelDataToJson(ModelData data) => json.encode(data.toJson());

class ModelData {
  ModelData({
    this.data,
    this.msg,
    this.status,
  });

  Data data;
  String msg;
  int status;

  factory ModelData.fromJson(Map<String, dynamic> json) => ModelData(
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  Data({
    this.userId,
    this.userToken,
    this.username,
    this.registrationCode,
    this.email,
    this.verifyForgotCode,
    this.socialId,
    this.profileImage,
    this.address,
    this.latitude,
    this.longitude,
    this.stripeId,
    this.connectStripeId,
    this.deviceType,
    this.authToken,
    this.devicePushToken,
    this.userType,
    this.businessRegistrationCode,
    this.isLoggedOut,
    this.badge,
  });

  int userId;
  String userToken;
  String username;
  String registrationCode;
  String email;
  String verifyForgotCode;
  String socialId;
  String profileImage;
  String address;
  var latitude;
  var longitude;
  String stripeId;
  String connectStripeId;
  String deviceType;
  String authToken;
  String devicePushToken;
  String userType;
  String businessRegistrationCode;
  int isLoggedOut;
  int badge;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    userToken: json["user_token"],
    username: json["username"],
    registrationCode: json["registration_code"],
    email: json["email"],
    verifyForgotCode: json["verify_forgot_code"],
    socialId: json["social_id"],
    profileImage: json["profile_image"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    stripeId: json["stripe_id"],
    connectStripeId: json["connect_stripe_id"],
    deviceType: json["device_type"],
    authToken: json["auth_token"],
    devicePushToken: json["device_push_token"],
    userType: json["user_type"],
    businessRegistrationCode: json["business_registration_code"],
    isLoggedOut: json["is_logged_out"],
    badge: json["badge"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_token": userToken,
    "username": username,
    "registration_code": registrationCode,
    "email": email,
    "verify_forgot_code": verifyForgotCode,
    "social_id": socialId,
    "profile_image": profileImage,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "stripe_id": stripeId,
    "connect_stripe_id": connectStripeId,
    "device_type": deviceType,
    "auth_token": authToken,
    "device_push_token": devicePushToken,
    "user_type": userType,
    "business_registration_code": businessRegistrationCode,
    "is_logged_out": isLoggedOut,
    "badge": badge,
  };
}
