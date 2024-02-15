import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test/models/dispatcher/qrPageShow.dart';
import 'package:test/models/qrCodeShowModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

class ActivePageShow extends StatefulWidget {
  final id;
  const ActivePageShow({super.key, required this.id});

  @override
  State<ActivePageShow> createState() => _ActivePageShowState();
}

class _ActivePageShowState extends State<ActivePageShow> {
  late Future<qrPageShow> fetchNakladnokData;
  @override
  void initState() {
    fetchNakladnokData = fetchNakladnok(widget.id);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getModal(context, widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FutureBuilder(
                future: fetchNakladnokData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    qrPageShow mainData = snapshot.data as qrPageShow;
                    var delivery = snapshot.data!.data;
                    List<Orders> ordersData =
                        mainData.data!.orders as List<Orders>;
                    print(ordersData);
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Nakladnoy naqami:"),
                                    Text(delivery!.id.toString())
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mashina raqami:"),
                                    Text(delivery.carNumber.toString())
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Haydovchi ismi"),
                                    Text(delivery.driverName.toString())
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Qayerdan"),
                                    Text(delivery.from.toString())
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Qayerga"),
                                    Text(delivery.to.toString())
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Yaratilgan vaqt"),
                                    Text(delivery.createdAt.toString())
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                  child: Text(
                                    'Buyurtmalar royxati',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: ordersData.length,
                            itemBuilder: (context, index) {
                              var orderData = ordersData[index];
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Buyurtma raqami'),
                                        Text(orderData.orderId.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Skvajina'),
                                        Text(orderData.skvajina.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Namunalar soni'),
                                        Text(orderData.samplesCount.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Buyurtmachi"),
                                        Text(orderData.orderMaker.toString())
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kon"),
                                        Text(orderData.mine.toString())
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return const Center(
                      child: Text('Something went wrong!'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 59, 212, 184),
                    ),
                  );
                },
              ),
              Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        getModal(context, widget.id);
                      },
                      child: Text('Tasdiqlash'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void getModal(context, id) {
  var subtext;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Text('Habar'),
        // ignore: unnecessary_null_comparison
        content: subtext == null
            ? Text('Buyurtmani qabul qilmoqchimisz')
            : Text(subtext),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Rad Etish',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () async {
              SharedPreferences localStorage =
                  await SharedPreferences.getInstance();
              var token = localStorage.getString("token");
              var getData = await http
                  .get(Uri.parse(Dispatcher.qrConfirmation + id), headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              });
              subtext = jsonDecode(getData.body)['notification'];
              Navigator.of(context).pop();
            },
            child: Text(
              'Qabul qilish',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
