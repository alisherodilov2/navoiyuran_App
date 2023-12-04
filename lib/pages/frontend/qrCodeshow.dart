import 'package:flutter/material.dart';
import 'package:test/models/qrCodeShowModel.dart';

class QrCodeShow extends StatefulWidget {
  final data;
  const QrCodeShow({super.key, required this.data});

  @override
  State<QrCodeShow> createState() => _QrCodeShowState();
}

class _QrCodeShowState extends State<QrCodeShow> {
  late Future<List<qrCodeShow>> fetchOrder;
  @override
  void initState() {
    fetchOrder = fetchQrData(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchQrData(widget.data),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<qrCodeShow> qrCodeData =
                      snapshot.data as List<qrCodeShow>;
                  if (qrCodeData.isEmpty) {
                    return const Center(
                      child: Text("Nothing to show!"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: qrCodeData.length,
                    itemBuilder: (context, index) {
                      var qrcode = qrCodeData[index];
                      return Column(
                        children: [
                          Center(
                            child: Image(
                              width: 140,
                              image: AssetImage("assets/logo.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 205, 241, 233),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Order Raqami:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        qrcode.sampleGroup!.order!.orderNumber
                                            .toString(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Konomi:",
                                      ),
                                      Text(
                                        qrcode.sampleGroup!.order!.area!.name
                                            .toString(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Analiz turlari:"),
                                      Text(qrcode.sampleGroup!.analiz!.name
                                          .toString()),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 205, 241, 233),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Namunalar Soni:",
                                      ),
                                      Text(
                                        qrcode.sampleGroup!.order!.samplesCount
                                            .toString(),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Namunalar yaratilgan vaqt"),
                                      Text(qrcode.createAt.toString())
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Analiz Turi:",
                                      ),
                                      Text(
                                        qrcode.sampleGroup!.analizType
                                            .toString(),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 205, 241, 233),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: qrcode.sampleGroup!.order!.samples!
                                    .map((e) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(e.unicNumber.toString()),
                                          Text(e.depthFrom.toString())
                                        ],
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
