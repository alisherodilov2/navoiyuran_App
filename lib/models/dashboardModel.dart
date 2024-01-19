import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

Future<Dashboard> fetchDashboard() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString("token");
  var response = await http.get(headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  }, Uri.parse(Auth.dashboard));

  return Dashboard.fromJson(jsonDecode(response.body));
}

class Dashboard {
  List<Lab>? lab;
  Orders? orders;
  List<Analiz>? analiz;

  Dashboard({this.lab, this.orders, this.analiz});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['lab'] != null) {
      lab = <Lab>[];
      json['lab'].forEach((v) {
        lab!.add(new Lab.fromJson(v));
      });
    }
    orders =
        json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
    if (json['analiz'] != null) {
      analiz = <Analiz>[];
      json['analiz'].forEach((v) {
        analiz!.add(new Analiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lab != null) {
      data['lab'] = this.lab!.map((v) => v.toJson()).toList();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    if (this.analiz != null) {
      data['analiz'] = this.analiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lab {
  String? name;
  int? tasks;
  int? taskDone;

  Lab({this.name, this.tasks, this.taskDone});

  Lab.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tasks = json['tasks'];
    taskDone = json['taskDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tasks'] = this.tasks;
    data['taskDone'] = this.taskDone;
    return data;
  }
}

class Orders {
  int? orderNumber;
  int? orderDone;
  int? tasks;
  int? taskDone;

  Orders({this.orderNumber, this.orderDone});

  Orders.fromJson(Map<String, dynamic> json) {
    orderNumber = json['orderNumber'];
    orderDone = json['orderDone'];
    tasks = json['group'];
    taskDone = json['groupDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderNumber'] = this.orderNumber;
    data['orderDone'] = this.orderDone;
    data['group'] = this.tasks;
    data['groupDone'] = this.taskDone;
    return data;
  }
}

class Analiz {
  int? id;
  String? name;
  int? tasksCount;
  int? tasksCountDone;

  Analiz({this.id, this.name, this.tasksCount, this.tasksCountDone});

  Analiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tasksCount = json['tasksCount'];
    tasksCountDone = json['tasksCountDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tasksCount'] = this.tasksCount;
    data['tasksCountDone'] = this.tasksCountDone;
    return data;
  }
}
