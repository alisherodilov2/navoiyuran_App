import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<List<Orders>> fetchOrders() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
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
  String? describtion;
  String? status; // Changed to String
  String? skvajina;
  String? samplesCount; // Changed to String
  String? reason;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? mineId;
  String? placeTypeId;
  String? materialTypeId;
  String? someTypeId;
  Mine? mine;

  Orders({
    this.id,
    this.describtion,
    this.status,
    this.skvajina,
    this.samplesCount,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.mineId,
    this.placeTypeId,
    this.materialTypeId,
    this.someTypeId,
    this.mine,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    describtion = json['describtion'].toString();
    status = json['status'].toString(); // Convert to String
    skvajina = json['skvajina'].toString();
    samplesCount = json['samples_count'].toString(); // Convert to String
    reason = json['reason'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    userId = json['user_id'].toString(); // Convert to String
    mineId = json['mine_id'].toString(); // Convert to String
    placeTypeId = json['place_type_id'].toString(); // Convert to String
    materialTypeId = json['material_type_id'].toString(); // Convert to String
    someTypeId = json['some_type_id'].toString(); // Convert to String
    mine = json['mine'] != null ? Mine.fromJson(json['mine']) : null;
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

  Mine({
    this.id,
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
  });

  Mine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    kril = json['kril'].toString();
    ru = json['ru'].toString();
    status = json['status'].toString();
    startTime = json['start_time'].toString();
    endTime = json['end_time'].toString();
    describtion = json['describtion'].toString();
    regionId = json['region_id'].toString();
    districtId = json['district_id'].toString();
    customerId = json['customer_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
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

    return data;
  }
}
