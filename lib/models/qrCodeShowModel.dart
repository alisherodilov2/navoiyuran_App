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
  print(SubApi.orderShow + id);
  print('working');
  return (jsonDecode(response.body) as List)
      .map((e) => qrCodeShow.fromJson(e))
      .toList();
}

class qrCodeShow {
  int? samplePart;
  String? geoNumber;
  SampleGroup? sampleGroup;
  String? createAt;

  qrCodeShow(
      {this.samplePart, this.geoNumber, this.sampleGroup, this.createAt});

  qrCodeShow.fromJson(Map<String, dynamic> json) {
    samplePart = json['samplePart'];
    geoNumber = json['geoNumber'];
    sampleGroup = json['sampleGroup'] != null
        ? new SampleGroup.fromJson(json['sampleGroup'])
        : null;
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samplePart'] = this.samplePart;
    data['geoNumber'] = this.geoNumber;
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
  String? analiz;

  SampleGroup({this.status, this.order, this.analiz});

  SampleGroup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    analiz = json['analiz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['analiz'] = this.analiz;
    return data;
  }
}

class Order {
  int? order;
  String? orderNumber;
  String? someType;
  String? area;
  String? samplesCount;
  String? user;
  String? place;
  List<Samples>? samples;

  Order(
      {this.order,
      this.orderNumber,
      this.someType,
      this.area,
      this.samplesCount,
      this.user,
      this.place,
      this.samples});

  Order.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    orderNumber = json['orderNumber'];
    someType = json['someType'];
    area = json['area'];
    samplesCount = json['samplesCount'];
    user = json['user'];
    place = json['place'];
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
    data['someType'] = this.someType;
    data['area'] = this.area;
    data['samplesCount'] = this.samplesCount;
    data['user'] = this.user;
    data['place'] = this.place;
    if (this.samples != null) {
      data['samples'] = this.samples!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Samples {
  String? number;
  String? unicNumber;
  String? depthFrom;
  String? depthTo;
  String? power;
  String? weightFrom;

  Samples(
      {this.number,
      this.unicNumber,
      this.depthFrom,
      this.depthTo,
      this.power,
      this.weightFrom});

  Samples.fromJson(Map<String, dynamic> json) {
    number = json['number'].toString();
    unicNumber = json['unic_number'];
    depthFrom = json['depth_from'];
    depthTo = json['depth_to'];
    power = json['power'];
    weightFrom = json['weight_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unic_number'] = this.unicNumber;
    data['depth_from'] = this.depthFrom;
    data['depth_to'] = this.depthTo;
    data['power'] = this.power;
    data['weight_from'] = this.weightFrom;
    return data;
  }
}
