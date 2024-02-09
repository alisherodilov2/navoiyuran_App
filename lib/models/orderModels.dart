import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<List<Orders>> fetchOrders() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  print("token$token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(SubApi.orders));
  return (jsonDecode(response.body) as List)
      .map((e) => Orders.fromJson(e))
      .toList();
}

class Orders {
  int? id;
  Null? describtion;
  String? status;
  String? skvajina;
  String? samplesCount;
  Null? reason;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? userId;
  String? mineId;
  String? placeTypeId;
  Null? materialTypeId;
  String? someTypeId;
  Mine? mine;

  Orders(
      {this.id,
      this.describtion,
      this.status,
      this.skvajina,
      this.samplesCount,
      this.reason,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.mineId,
      this.placeTypeId,
      this.materialTypeId,
      this.someTypeId,
      this.mine});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    describtion = json['describtion'];
    status = json['status'];
    skvajina = json['skvajina'];
    samplesCount = json['samples_count'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    mineId = json['mine_id'];
    placeTypeId = json['place_type_id'];
    materialTypeId = json['material_type_id'];
    someTypeId = json['some_type_id'];
    mine = json['mine'] != null ? new Mine.fromJson(json['mine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['describtion'] = this.describtion;
    data['status'] = this.status;
    data['skvajina'] = this.skvajina;
    data['samples_count'] = this.samplesCount;
    data['reason'] = this.reason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    data['mine_id'] = this.mineId;
    data['place_type_id'] = this.placeTypeId;
    data['material_type_id'] = this.materialTypeId;
    data['some_type_id'] = this.someTypeId;
    if (this.mine != null) {
      data['mine'] = this.mine!.toJson();
    }
    return data;
  }
}

class Mine {
  int? id;
  String? name;
  String? kril;
  String? ru;
  String? status;
  String? startTime;
  String? endTime;
  String? describtion;
  String? regionId;
  String? districtId;
  String? customerId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Mine(
      {this.id,
      this.name,
      this.kril,
      this.ru,
      this.status,
      this.startTime,
      this.endTime,
      this.describtion,
      this.regionId,
      this.districtId,
      this.customerId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Mine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kril = json['kril'];
    ru = json['ru'];
    status = json['status'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    describtion = json['describtion'];
    regionId = json['region_id'];
    districtId = json['district_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['kril'] = this.kril;
    data['ru'] = this.ru;
    data['status'] = this.status;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['describtion'] = this.describtion;
    data['region_id'] = this.regionId;
    data['district_id'] = this.districtId;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
