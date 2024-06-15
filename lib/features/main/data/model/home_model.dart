import 'package:interview/features/main/domain/entity/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({super.data, super.result});

  factory HomeModel.fromJson(dynamic json) {
    return HomeModel(
      result: json['result'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  Data({
    this.secret,
    this.reason,
    this.uuid,
  });

  Data.fromJson(dynamic json) {
    secret = json['secret'];
    reason = json['reason'];
    uuid = json['uuid'];
  }
  String? secret;
  String? reason;
  String? uuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['secret'] = secret;
    map['reason'] = reason;
    map['uuid'] = uuid;
    return map;
  }
}
