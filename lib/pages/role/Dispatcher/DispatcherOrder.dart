import 'package:flutter/material.dart';
import 'package:test/models/dispatcher/DispatcherOrders.dart';

class DispatcherOrder extends StatefulWidget {
  const DispatcherOrder({super.key});

  @override
  State<DispatcherOrder> createState() => _DispatcherOrderState();
}

class _DispatcherOrderState extends State<DispatcherOrder> {
  late Future<DispatcherOrderModel> fetchDispatcherOrder;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchDispatcherOrder = fectchDispatcherOrderFunc();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: fetchDispatcherOrder,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> orders = snapshot.data!.data as List<Data>;
              if (orders.isEmpty) {
                return const Center(
                  child: Text("Nothing to show!"),
                );
              }
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var order = orders[index];
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 223, 223, 223),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Buyurtma raqami"),
                              Text(
                                order.orderId.toString(),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Skvajina"),
                              Text(order.skvajina.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Buyurtmalar soni"),
                              Text(order.samplesCount.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Buyurtmachi"),
                              Text(order.orderMaker.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Status"),
                              Text(order.status.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kon nomi"),
                              Text(order.mine.toString())
                            ],
                          )
                        ],
                      ),
                    ),
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
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 59, 212, 184),
              ),
            );
          },
        ),
      ),
    );
  }
}
