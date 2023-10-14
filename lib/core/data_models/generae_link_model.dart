// To parse this JSON data, do
//
//     final generateLinkModel = generateLinkModelFromJson(jsonString);

import 'dart:convert';

GenerateLinkModel generateLinkModelFromJson(String str) => GenerateLinkModel.fromJson(json.decode(str));

String generateLinkModelToJson(GenerateLinkModel data) => json.encode(data.toJson());

class GenerateLinkModel {
    int? status;
    Body? body;

    GenerateLinkModel({
        this.status,
        this.body,
    });

    factory GenerateLinkModel.fromJson(Map<String, dynamic> json) => GenerateLinkModel(
        status: json["status"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "body": body?.toJson(),
    };
}

class Body {
    String? status;
    String? message;
    Data? data;

    Body({
        this.status,
        this.message,
        this.data,
    });

    factory Body.fromJson(Map<String, dynamic> json) => Body(
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
    String? txRef;
    String? flwRef;
    String? deviceFingerprint;
    int? amount;
    int? chargedAmount;
    double? appFee;
    int? merchantFee;
    String? processorResponse;
    String? authModel;
    String? currency;
    String? ip;
    String? narration;
    String? status;
    String? authUrl;
    String? paymentType;
    String? fraudStatus;
    DateTime? createdAt;
    int? accountId;
    Customer? customer;
    Meta? meta;

    Data({
        this.id,
        this.txRef,
        this.flwRef,
        this.deviceFingerprint,
        this.amount,
        this.chargedAmount,
        this.appFee,
        this.merchantFee,
        this.processorResponse,
        this.authModel,
        this.currency,
        this.ip,
        this.narration,
        this.status,
        this.authUrl,
        this.paymentType,
        this.fraudStatus,
        this.createdAt,
        this.accountId,
        this.customer,
        this.meta,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        txRef: json["tx_ref"],
        flwRef: json["flw_ref"],
        deviceFingerprint: json["device_fingerprint"],
        amount: json["amount"],
        chargedAmount: json["charged_amount"],
        appFee: json["app_fee"]?.toDouble(),
        merchantFee: json["merchant_fee"],
        processorResponse: json["processor_response"],
        authModel: json["auth_model"],
        currency: json["currency"],
        ip: json["ip"],
        narration: json["narration"],
        status: json["status"],
        authUrl: json["auth_url"],
        paymentType: json["payment_type"],
        fraudStatus: json["fraud_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        accountId: json["account_id"],
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tx_ref": txRef,
        "flw_ref": flwRef,
        "device_fingerprint": deviceFingerprint,
        "amount": amount,
        "charged_amount": chargedAmount,
        "app_fee": appFee,
        "merchant_fee": merchantFee,
        "processor_response": processorResponse,
        "auth_model": authModel,
        "currency": currency,
        "ip": ip,
        "narration": narration,
        "status": status,
        "auth_url": authUrl,
        "payment_type": paymentType,
        "fraud_status": fraudStatus,
        "created_at": createdAt?.toIso8601String(),
        "account_id": accountId,
        "customer": customer?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Customer {
    int? id;
    dynamic phoneNumber;
    String? name;
    String? email;
    DateTime? createdAt;

    Customer({
        this.id,
        this.phoneNumber,
        this.name,
        this.email,
        this.createdAt,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        email: json["email"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "name": name,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
    };
}

class Meta {
    Authorization? authorization;

    Meta({
        this.authorization,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        authorization: json["authorization"] == null ? null : Authorization.fromJson(json["authorization"]),
    );

    Map<String, dynamic> toJson() => {
        "authorization": authorization?.toJson(),
    };
}

class Authorization {
    String? mode;
    String? redirect;
    String? validateInstructions;

    Authorization({
        this.mode,
        this.redirect,
        this.validateInstructions,
    });

    factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        mode: json["mode"],
        redirect: json["redirect"],
        validateInstructions: json["validate_instructions"],
    );

    Map<String, dynamic> toJson() => {
        "mode": mode,
        "redirect": redirect,
        "validate_instructions": validateInstructions,
    };
}
