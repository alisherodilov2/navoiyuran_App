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

class ActiveSample {
  Data data;

  ActiveSample({required this.data});

  factory ActiveSample.fromJson(Map<String, dynamic> json) {
    return ActiveSample(
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int id;
  SampleId sampleId;
  String mine;
  String orderId;
  dynamic customId;
  String place;
  String geoNumber;
  List<Group> group;

  Data({
    required this.id,
    required this.sampleId,
    required this.mine,
    required this.orderId,
    required this.customId,
    required this.place,
    required this.geoNumber,
    required this.group,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      sampleId: SampleId.fromJson(json['sample_id']),
      mine: json['mine'],
      orderId: json['order_id'],
      customId: json['custom_id'],
      place: json['place'],
      geoNumber: json['geo_number'],
      group: List<Group>.from(json['group'].map((x) => Group.fromJson(x))),
    );
  }
}

class SampleId {
  String unicNumber;
  String depthFrom;
  String depthTo;
  String power;
  String weightFrom;
  String weightTo;
  String packWeight;

  SampleId({
    required this.unicNumber,
    required this.depthFrom,
    required this.depthTo,
    required this.power,
    required this.weightFrom,
    required this.weightTo,
    required this.packWeight,
  });

  factory SampleId.fromJson(Map<String, dynamic> json) {
    return SampleId(
      unicNumber: json['unic_number'],
      depthFrom: json['depth_from'],
      depthTo: json['depth_to'],
      power: json['power'],
      weightFrom: json['weight_from'],
      weightTo: json['weight_to'],
      packWeight: json['pack_weight'],
    );
  }
}

class Group {
  int id;
  String analiz;
  bool done;
  bool isCheck;

  Group({
    required this.id,
    required this.analiz,
    required this.done,
    required this.isCheck,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      analiz: json['analiz'],
      done: json['done'],
      isCheck: json['isCheck'],
    );
  }
}
