import 'package:flutter/material.dart';
import 'package:test/models/dispatcher/qrPageShow.dart';
import 'package:test/models/qrCodeShowModel.dart';

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
    // TODO: implement initState
    fetchNakladnokData = fetchNakladnok(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: fetchNakladnokData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                qrPageShow delivery = snapshot.data as qrPageShow;
                List<Orders> ordersData = delivery.data!.orders as List<Orders>;
                print(ordersData);
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: ordersData.length,
                  itemBuilder: (context, index) {
                    var nakorder = ordersData[index];
                    return Container(
                      child: Text(nakorder.mine.toString()),
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
      ),
    );
  }
}
