class TasksModels {
  int? id;
  String? start;
  String? analizName;
  String? orderId;
  String? status;
  int? countPart;
  String? sampleType;
  String? orderMaker;
  String? mine;

  TasksModels(
      {this.id,
      this.start,
      this.analizName,
      this.orderId,
      this.status,
      this.countPart,
      this.sampleType,
      this.orderMaker,
      this.mine});

  TasksModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    analizName = json['analizName'];
    orderId = json['orderId'];
    status = json['status'];
    countPart = json['countPart'];
    sampleType = json['sampleType'];
    orderMaker = json['orderMaker'];
    mine = json['mine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start'] = this.start;
    data['analizName'] = this.analizName;
    data['orderId'] = this.orderId;
    data['status'] = this.status;
    data['countPart'] = this.countPart;
    data['sampleType'] = this.sampleType;
    data['orderMaker'] = this.orderMaker;
    data['mine'] = this.mine;
    return data;
  }
}