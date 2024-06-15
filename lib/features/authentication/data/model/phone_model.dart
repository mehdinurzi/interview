import 'package:interview/features/authentication/domain/entity/phone_entity.dart';

class PhoneModel extends PhoneEntity {
  PhoneModel({
    super.result,
    super.data,
  });

  factory PhoneModel.fromJson(dynamic json) {
    return PhoneModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      result: json["result"]
    );
  }
}

class Data {
  Data({
    this.messageSent,
    this.otpCount,
  });

  Data.fromJson(dynamic json) {
    messageSent = json['message_sent'];
    otpCount = json['otp_count'];
  }
  String? messageSent;
  String? otpCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message_sent'] = messageSent;
    map['otp_count'] = otpCount;
    return map;
  }
}
