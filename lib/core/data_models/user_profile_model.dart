// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    int? status;
    String? message;
    Data? data;

    UserProfileModel({
        this.status,
        this.message,
        this.data,
    });

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? merchantId;
    String? firstName;
    String? otherName;
    String? lastName;
    String? idNumber;
    String? idType;
    String? bvn;
    String? email;
    String? phone;
    String? gender;
    DateTime? dateOfBirth;
    String? idImage;
    String? profilePicture;
    String? walletBalance;
    String? pin;
    String? secretQuestion;
    String? secretAnswer;
    String? contactPersonName;
    String? contactPersonPhone;
    String? contactPersonRelationship;
    bool? setPin;
    bool? setContactDetails;
    bool? setId;
    bool? verifyBvn;
    bool? verifyPhoneNumber;
    int? owner;

    Data({
        this.id,
        this.merchantId,
        this.firstName,
        this.otherName,
        this.lastName,
        this.idNumber,
        this.idType,
        this.bvn,
        this.email,
        this.phone,
        this.gender,
        this.dateOfBirth,
        this.idImage,
        this.profilePicture,
        this.walletBalance,
        this.pin,
        this.secretQuestion,
        this.secretAnswer,
        this.contactPersonName,
        this.contactPersonPhone,
        this.contactPersonRelationship,
        this.setPin,
        this.setContactDetails,
        this.setId,
        this.verifyBvn,
        this.verifyPhoneNumber,
        this.owner,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        merchantId: json["merchantId"],
        firstName: json["firstName"],
        otherName: json["otherName"],
        lastName: json["lastName"],
        idNumber: json["id_number"],
        idType: json["id_Type"],
        bvn: json["bvn"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        idImage: json["id_image"],
        profilePicture: json["profilePicture"],
        walletBalance: json["walletBalance"],
        pin: json["pin"],
        secretQuestion: json["secret_question"],
        secretAnswer: json["secret_answer"],
        contactPersonName: json["contactPersonName"],
        contactPersonPhone: json["contactPersonPhone"],
        contactPersonRelationship: json["contactPersonRelationship"],
        setPin: json["setPin"],
        setContactDetails: json["setContactDetails"],
        setId: json["setId"],
        verifyBvn: json["verifyBVN"],
        verifyPhoneNumber: json["verifyPhoneNumber"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merchantId": merchantId,
        "firstName": firstName,
        "otherName": otherName,
        "lastName": lastName,
        "id_number": idNumber,
        "id_Type": idType,
        "bvn": bvn,
        "email": email,
        "phone": phone,
        "gender": gender,
        "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "id_image": idImage,
        "profilePicture": profilePicture,
        "walletBalance": walletBalance,
        "pin": pin,
        "secret_question": secretQuestion,
        "secret_answer": secretAnswer,
        "contactPersonName": contactPersonName,
        "contactPersonPhone": contactPersonPhone,
        "contactPersonRelationship": contactPersonRelationship,
        "setPin": setPin,
        "setContactDetails": setContactDetails,
        "setId": setId,
        "verifyBVN": verifyBvn,
        "verifyPhoneNumber": verifyPhoneNumber,
        "owner": owner,
    };
}
