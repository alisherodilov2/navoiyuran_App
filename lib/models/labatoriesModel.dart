import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<List<Labatory>> fetchLab() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  print("token$token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(SubApi.labaratory));
  return (jsonDecode(response.body) as List)
      .map((e) => Labatory.fromJson(e))
      .toList();
}

class Labatory {
  int? id;
  String? name;
  List<Analisses>? analisses;

  Labatory({this.id, this.name, this.analisses});

  Labatory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['analisses'] != null) {
      analisses = <Analisses>[];
      json['analisses'].forEach((v) {
        analisses!.add(new Analisses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.analisses != null) {
      data['analisses'] = this.analisses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Analisses {
  int? id;
  String? name;
  int? groups;

  Analisses({this.id, this.name, this.groups});

  Analisses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    groups = json['groups'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['groups'] = this.groups;
    return data;
  }
}
