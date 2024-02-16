import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<DispatcherOrderModel> fectchDispatcherOrderFunc() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(Dispatcher.orderDispatcher));

  return DispatcherOrderModel.fromJson(jsonDecode(response.body));
}

class DispatcherOrderModel {
  List<Data>? data;

  DispatcherOrderModel({this.data});

  DispatcherOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? orderId;
  String? skvajina;
  String? samplesCount;
  String? orderMaker;
  String? status;
  String? mine;

  Data(
      {this.id,
      this.orderId,
      this.skvajina,
      this.samplesCount,
      this.orderMaker,
      this.status,
      this.mine});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    skvajina = json['skvajina'];
    samplesCount = json['samples_count'];
    orderMaker = json['order_maker'];
    status = json['status'];
    mine = json['mine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['skvajina'] = this.skvajina;
    data['samples_count'] = this.samplesCount;
    data['order_maker'] = this.orderMaker;
    data['status'] = this.status;
    data['mine'] = this.mine;
    return data;
  }
}
