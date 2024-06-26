import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<ActiveSample> fetchSampleActive(id) async {
  print(id);
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(Labatory.activeSample + id));
  print(Labatory.activeSample + id);
  if (response.statusCode == 200) {
    return ActiveSample.fromJson(jsonDecode(response.body));
  } else {
    return throw Exception('Failed to load active sample');
  }
}

Future<int> sendActive(id, request) async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse('${Labatory.activeSampleActive}$id?group_id=$request'));
  print('${Labatory.activeSampleActive}$id?group_id=$request');
  print(response.body.toString());
  return response.statusCode;
}

class ActiveSample {
  Data? data;

  ActiveSample({this.data});

  ActiveSample.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? no;
  int? all;
  int? id;
  SampleId? sampleId;
  String? mine;
  int? orderId;
  String? customId;
  String? place;
  String? geoNumber;
  List<Group>? group;

  Data(
      {this.no,
      this.all,
      this.id,
      this.sampleId,
      this.mine,
      this.orderId,
      this.customId,
      this.place,
      this.geoNumber,
      this.group});

  Data.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    all = json['all'];
    id = json['id'];
    sampleId = json['sample_id'] != null
        ? new SampleId.fromJson(json['sample_id'])
        : null;
    mine = json['mine'];
    orderId = json['order_id'];
    customId = json['custom_id'];
    place = json['place'];
    geoNumber = json['geo_number'];
    if (json['group'] != null) {
      group = <Group>[];
      json['group'].forEach((v) {
        group!.add(new Group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['all'] = this.all;
    data['id'] = this.id;
    if (this.sampleId != null) {
      data['sample_id'] = this.sampleId!.toJson();
    }
    data['mine'] = this.mine;
    data['order_id'] = this.orderId;
    data['custom_id'] = this.customId;
    data['place'] = this.place;
    data['geo_number'] = this.geoNumber;
    if (this.group != null) {
      data['group'] = this.group!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SampleId {
  String? unicNumber;
  String? depthFrom;
  String? depthTo;
  String? power;
  String? weightFrom;
  String? weightTo;
  String? packWeight;

  SampleId(
      {this.unicNumber,
      this.depthFrom,
      this.depthTo,
      this.power,
      this.weightFrom,
      this.weightTo,
      this.packWeight});

  SampleId.fromJson(Map<String, dynamic> json) {
    unicNumber = json['unic_number'];
    depthFrom = json['depth_from'];
    depthTo = json['depth_to'];
    power = json['power'];
    weightFrom = json['weight_from'];
    weightTo = json['weight_to'];
    packWeight = json['pack_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unic_number'] = this.unicNumber;
    data['depth_from'] = this.depthFrom;
    data['depth_to'] = this.depthTo;
    data['power'] = this.power;
    data['weight_from'] = this.weightFrom;
    data['weight_to'] = this.weightTo;
    data['pack_weight'] = this.packWeight;
    return data;
  }
}

class Group {
  int? id;
  String? analiz;
  bool? done;
  bool? isCheck;

  Group({this.id, this.analiz, this.done, this.isCheck});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    analiz = json['analiz'];
    done = json['done'];
    isCheck = json['isCheck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['analiz'] = this.analiz;
    data['done'] = this.done;
    data['isCheck'] = this.isCheck;
    return data;
  }
}
