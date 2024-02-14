import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<qrPageShow> fetchNakladnok(id) async {
  print(Dispatcher.qrPageLoading + id.toString());
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(Dispatcher.qrPageLoading + id.toString()));

  return qrPageShow.fromJson(jsonDecode(response.body));
}

class qrPageShow {
  Data? data;

  qrPageShow({this.data});

  qrPageShow.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? carNumber;
  String? driverName;
  String? from;
  String? to;
  String? createdAt;
  List<Orders>? orders;

  Data(
      {this.id,
      this.carNumber,
      this.driverName,
      this.from,
      this.to,
      this.createdAt,
      this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carNumber = json['car_number'];
    driverName = json['driver_name'];
    from = json['from'];
    to = json['to'];
    createdAt = json['created_at'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['car_number'] = this.carNumber;
    data['driver_name'] = this.driverName;
    data['from'] = this.from;
    data['to'] = this.to;
    data['created_at'] = this.createdAt;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? orderId;
  String? skvajina;
  String? samplesCount;
  String? orderMaker;
  String? mine;

  Orders(
      {this.id,
      this.orderId,
      this.skvajina,
      this.samplesCount,
      this.orderMaker,
      this.mine});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    skvajina = json['skvajina'];
    samplesCount = json['samples_count'];
    orderMaker = json['order_maker'];
    mine = json['mine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['skvajina'] = this.skvajina;
    data['samples_count'] = this.samplesCount;
    data['order_maker'] = this.orderMaker;
    data['mine'] = this.mine;
    return data;
  }
}
