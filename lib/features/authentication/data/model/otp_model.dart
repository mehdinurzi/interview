import 'package:interview/features/authentication/domain/entity/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({super.data, super.result});

  factory OtpModel.fromJson(dynamic json) {
    return OtpModel(
      result: json['result'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  Data({
    this.session,
    this.reason,
    this.reasonLocal,
    this.uuid,
  });

  Data.fromJson(dynamic json) {
    session = json['session'];
    reason = json['reason'];
    reasonLocal = json['reason_local'];
    uuid = json['uuid'];
  }
  String? session;
  String? reason;
  String? reasonLocal;
  String? uuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['session'] = session;
    map['reason'] = reason;
    map['reason_local'] = reasonLocal;
    map['uuid'] = uuid;
    return map;
  }
}
