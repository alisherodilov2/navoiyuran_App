import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<List<qrCodeShow>> fetchQrData(id) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");

  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(SubApi.orderShow + id));
  return (jsonDecode(response.body) as List)
      .map((e) => qrCodeShow.fromJson(e))
      .toList();
}

class qrCodeShow {
  int? samplePart;
  SampleGroup? sampleGroup;
  String? createAt;

  qrCodeShow({this.samplePart, this.sampleGroup, this.createAt});

  qrCodeShow.fromJson(Map<String, dynamic> json) {
    samplePart = json['samplePart'];
    sampleGroup = json['sampleGroup'] != null
        ? new SampleGroup.fromJson(json['sampleGroup'])
        : null;
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samplePart'] = this.samplePart;
    if (this.sampleGroup != null) {
      data['sampleGroup'] = this.sampleGroup!.toJson();
    }
    data['createAt'] = this.createAt;
    return data;
  }
}

class SampleGroup {
  String? status;
  Order? order;
  Analiz? analiz;
  String? analizType;

  SampleGroup({this.status, this.order, this.analiz, this.analizType});

  SampleGroup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    analiz =
        json['analiz'] != null ? new Analiz.fromJson(json['analiz']) : null;
    analizType = json['analiz_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.analiz != null) {
      data['analiz'] = this.analiz!.toJson();
    }
    data['analiz_type'] = this.analizType;
    return data;
  }
}

class Order {
  int? order;
  String? orderNumber;
  SomeType? someType;
  Area? area;
  String? samplesCount;
  List<Samples>? samples;

  Order(
      {this.order,
      this.orderNumber,
      this.someType,
      this.area,
      this.samplesCount,
      this.samples});

  Order.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    orderNumber = json['orderNumber'];
    someType = json['someType'] != null
        ? new SomeType.fromJson(json['someType'])
        : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    samplesCount = json['samplesCount'];
    if (json['samples'] != null) {
      samples = <Samples>[];
      json['samples'].forEach((v) {
        samples!.add(new Samples.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['orderNumber'] = this.orderNumber;
    if (this.someType != null) {
      data['someType'] = this.someType!.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['samplesCount'] = this.samplesCount;
    if (this.samples != null) {
      data['samples'] = this.samples!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SomeType {
  int? id;
  String? name;
  Null? idCopy;
  Null? deletedAt;
  Null? createdAt;
  Null? updatedAt;

  SomeType(
      {this.id,
      this.name,
      this.idCopy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  SomeType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    idCopy = json['id_copy'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['id_copy'] = this.idCopy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
      this.mineId});

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
    return data;
  }
}

class Samples {
  int? id;
  Null? idCopy;
  Null? status;
  String? unicNumber;
  String? depthFrom;
  String? depthTo;
  String? power;
  String? weightFrom;
  String? weightTo;
  int? materialTypeId;
  int? breedId;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Samples(
      {this.id,
      this.idCopy,
      this.status,
      this.unicNumber,
      this.depthFrom,
      this.depthTo,
      this.power,
      this.weightFrom,
      this.weightTo,
      this.materialTypeId,
      this.breedId,
      this.orderId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Samples.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCopy = json['id_copy'];
    status = json['status'];
    unicNumber = json['unic_number'];
    depthFrom = json['depth_from'];
    depthTo = json['depth_to'];
    power = json['power'];
    weightFrom = json['weight_from'];
    weightTo = json['weight_to'];
    materialTypeId = json['material_type_id'];
    breedId = json['breed_id'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_copy'] = this.idCopy;
    data['status'] = this.status;
    data['unic_number'] = this.unicNumber;
    data['depth_from'] = this.depthFrom;
    data['depth_to'] = this.depthTo;
    data['power'] = this.power;
    data['weight_from'] = this.weightFrom;
    data['weight_to'] = this.weightTo;
    data['material_type_id'] = this.materialTypeId;
    data['breed_id'] = this.breedId;
    data['order_id'] = this.orderId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Analiz {
  int? id;
  String? describtion;
  Null? narxi;
  String? shortName;
  String? type;
  int? duration;
  String? name;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;
  int? laborotoryId;

  Analiz(
      {this.id,
      this.describtion,
      this.narxi,
      this.shortName,
      this.type,
      this.duration,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.laborotoryId});

  Analiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    describtion = json['describtion'];
    narxi = json['narxi'];
    shortName = json['short_name'];
    type = json['type'];
    duration = json['duration'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    laborotoryId = json['laborotory_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['describtion'] = this.describtion;
    data['narxi'] = this.narxi;
    data['short_name'] = this.shortName;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['laborotory_id'] = this.laborotoryId;
    return data;
  }
}
