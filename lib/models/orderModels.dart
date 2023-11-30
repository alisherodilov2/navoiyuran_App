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
  String? orderNumber;
  Null? describtion;
  int? status;
  String? samplesCount;
  Null? reason;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? userId;
  int? areaId;
  int? placeTypeId;
  Null? materialTypeId;
  int? someTypeId;
  Area? area;

  Orders(
      {this.id,
      this.orderNumber,
      this.describtion,
      this.status,
      this.samplesCount,
      this.reason,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.areaId,
      this.placeTypeId,
      this.materialTypeId,
      this.someTypeId,
      this.area});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    describtion = json['describtion'];
    status = json['status'];
    samplesCount = json['samples_count'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
    areaId = json['area_id'];
    placeTypeId = json['place_type_id'];
    materialTypeId = json['material_type_id'];
    someTypeId = json['some_type_id'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['describtion'] = this.describtion;
    data['status'] = this.status;
    data['samples_count'] = this.samplesCount;
    data['reason'] = this.reason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    data['area_id'] = this.areaId;
    data['place_type_id'] = this.placeTypeId;
    data['material_type_id'] = this.materialTypeId;
    data['some_type_id'] = this.someTypeId;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? status;
  String? startTime;
  Null? endTime;
  String? describtion;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? areaRegionId;
  int? districtId;
  Null? customerId;
  int? mineId;
  Mine? mine;

  Area(
      {this.id,
      this.name,
      this.status,
      this.startTime,
      this.endTime,
      this.describtion,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.areaRegionId,
      this.districtId,
      this.customerId,
      this.mineId,
      this.mine});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    describtion = json['describtion'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    areaRegionId = json['area_region_id'];
    districtId = json['district_id'];
    customerId = json['customer_id'];
    mineId = json['mine_id'];
    mine = json['mine'] != null ? new Mine.fromJson(json['mine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['describtion'] = this.describtion;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['area_region_id'] = this.areaRegionId;
    data['district_id'] = this.districtId;
    data['customer_id'] = this.customerId;
    data['mine_id'] = this.mineId;
    if (this.mine != null) {
      data['mine'] = this.mine!.toJson();
    }
    return data;
  }
}

class Mine {
  int? id;
  String? name;
  String? status;
  String? startTime;
  Null? endTime;
  String? describtion;
  int? regionId;
  int? districtId;
  Null? customerId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Mine(
      {this.id,
      this.name,
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
