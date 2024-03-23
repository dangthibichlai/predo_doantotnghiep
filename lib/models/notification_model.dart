// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromMap(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromMap(String str) => NotificationModel.fromMap(json.decode(str));

String notificationModelToMap(NotificationModel data) => json.encode(data.toMap());


///CreateNotificationDto
class NotificationModel {
    String? description;
    bool? isDelete;
    String? notificationId;
    String? title;
    String userFrom;
    String userTo;

    NotificationModel({
        this.description,
        this.isDelete,
        this.notificationId,
        this.title,
        required this.userFrom,
        required this.userTo,
    });

    NotificationModel copyWith({
        String? description,
        bool? isDelete,
        String? notificationId,
        String? title,
        String? userFrom,
        String? userTo,
    }) => 
        NotificationModel(
            description: description ?? this.description,
            isDelete: isDelete ?? this.isDelete,
            notificationId: notificationId ?? this.notificationId,
            title: title ?? this.title,
            userFrom: userFrom ?? this.userFrom,
            userTo: userTo ?? this.userTo,
        );

    factory NotificationModel.fromMap(Map<String, dynamic> json) => NotificationModel(
        description: json["description"],
        isDelete: json["isDelete"],
        notificationId: json["notificationId"],
        title: json["title"],
        userFrom: json["userFrom"],
        userTo: json["userTo"],
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "isDelete": isDelete,
        "notificationId": notificationId,
        "title": title,
        "userFrom": userFrom,
        "userTo": userTo,
    };
}