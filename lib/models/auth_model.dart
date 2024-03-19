// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_bool_literals_in_conditional_expressions
import 'dart:convert';

import '../resources/export/core_export.dart';

class AuthModel {
  String? id;
  String? phone;
  String? password;
  String? role;
  String? deviceID;
  String? social_id;
  String? social_type;
  String? accessToken;
  String? refreshToken;
  String? full_name;
  String? email;
  String? avatar;
  String? otp;
  bool? isNewAccount;
  List<String>? fcm_token;
  AuthModel({
    this.id,
    this.phone,
    this.password,
    this.role,
    this.deviceID,
    this.social_id,
    this.social_type,
    this.accessToken,
    this.refreshToken,
    this.full_name,
    this.email,
    this.avatar,
    this.otp,
    this.isNewAccount,
    this.fcm_token,
  });

  AuthModel copyWith({
    String? id,
    String? phone,
    String? password,
    String? role,
    String? deviceID,
    String? social_id,
    String? social_type,
    String? accessToken,
    String? refreshToken,
    String? full_name,
    String? email,
    String? avatar,
    String? otp,
    bool? isNewAccount,
    List<String>? fcm_token,
  }) {
    return AuthModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      role: role ?? this.role,
      deviceID: deviceID ?? this.deviceID,
      social_id: social_id ?? this.social_id,
      social_type: social_type ?? this.social_type,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      full_name: full_name ?? this.full_name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      otp: otp ?? this.otp,
      isNewAccount: isNewAccount ?? this.isNewAccount,
      fcm_token: fcm_token ?? this.fcm_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (!AppValidate.nullOrEmpty(id)) '_id': id,
      if (!AppValidate.nullOrEmpty(phone)) 'phone': phone,
      if (!AppValidate.nullOrEmpty(password)) 'password': password,
      if (!AppValidate.nullOrEmpty(role)) 'role': role,
      if (!AppValidate.nullOrEmpty(deviceID)) 'deviceID': deviceID,
      if (!AppValidate.nullOrEmpty(social_id)) 'social_id': social_id,
      if (!AppValidate.nullOrEmpty(social_type)) 'social_type': social_type,
      if (!AppValidate.nullOrEmpty(accessToken)) 'accessToken': accessToken,
      if (!AppValidate.nullOrEmpty(refreshToken)) 'refreshToken': refreshToken,
      if (!AppValidate.nullOrEmpty(full_name)) 'full_name': full_name,
      if (!AppValidate.nullOrEmpty(email)) 'email': email,
      if (!AppValidate.nullOrEmpty(avatar)) 'avatar': avatar,
      if (!AppValidate.nullOrEmpty(otp)) 'otp': otp,
      if (!AppValidate.nullOrEmpty(isNewAccount)) 'isNewAccount': isNewAccount,
      if (!AppValidate.nullOrEmpty(fcm_token)) 'fcm_token': fcm_token,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      deviceID: map['deviceID'] != null ? map['deviceID'] as String : null,
      social_id: map['social_id'] != null ? map['social_id'] as String : null,
      social_type: map['social_type'] != null ? map['social_type'] as String : null,
      accessToken: map['accessToken'] != null ? map['accessToken'] as String : null,
      refreshToken: map['refreshToken'] != null ? map['refreshToken'] as String : null,
      full_name: map['full_name'] != null ? map['full_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      otp: map['otp'] != null ? map['otp'] as String : null,
      isNewAccount: map['isNewAccount'] != null ? map['isNewAccount'] as bool : null,
      fcm_token: map['fcm_token'] != null ? List<String>.from(map['fcm_token'] as List) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthModel(id: $id, phone: $phone, password: $password, role: $role, deviceID: $deviceID, social_id: $social_id, social_type: $social_type, accessToken: $accessToken, refreshToken: $refreshToken, full_name: $full_name, email: $email, avatar: $avatar, otp: $otp)';
  }

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.phone == phone &&
        other.password == password &&
        other.role == role &&
        other.deviceID == deviceID &&
        other.social_id == social_id &&
        other.social_type == social_type &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.full_name == full_name &&
        other.email == email &&
        other.avatar == avatar &&
        other.isNewAccount == isNewAccount &&
        other.otp == otp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        phone.hashCode ^
        password.hashCode ^
        role.hashCode ^
        deviceID.hashCode ^
        social_id.hashCode ^
        social_type.hashCode ^
        accessToken.hashCode ^
        refreshToken.hashCode ^
        full_name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        isNewAccount.hashCode ^
        otp.hashCode;
  }
}
