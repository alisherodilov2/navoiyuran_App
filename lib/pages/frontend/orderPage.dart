import 'package:flutter/material.dart';
import 'package:test/models/orderModels.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrdersPage> {
  late Future<List<Orders>> fetchOrder;
  var statusData = {
    '10': 'yangi',
    '20': 'namunalar tayyorlanmoqda',
    '30': 'markirovkalanmoqda',
    '40': 'buyurtma yuborishga tayyor',
    '50': 'Bosh geologga yuborildi',
    '60': 'Geolog rad etdi',
    '70': 'Geolog tasqidladi',
    '80': 'buyurtma yuborildi',
    '90': 'buyurtma qaytarildi',
    '100': 'buyurtma qabul qilindi',
    '110': 'buyurtma omborda',
    '120': 'buyurtma tadqiqotlarga chiqarildi',
    '130': 'taqiqotlarga qabul qilindi',
    '140': 'tadqiqotlar jarayonida',
    '150': 'laboratoriya boshlig`iga yuborildi',
    '155': 'lab boshlig`i laborantga qaytardi',
    '157': 'Laboratoriyalar boshlig`iga yuborildi',
    '159': 'Laboratoriyalar boshlig`i qaytardi',
    '160': 'natijalar buyurtmachiga yuborildi',
    '170': 'natijalarni buyurtmachi qabul qilmadi',
    '180': 'natijalarni buyurtmachi qabul qildi',
    '190': 'natijalar arxivga yuborildi',
    '200': 'arxivda saqlanyapti',
  };
  void initState() {
    // TODO: implement initState
    setState(() {
      fetchOrder = fetchOrders();
      print(statusData[0]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(244, 10, 224, 178),
              image: DecorationImage(
                image: AssetImage("assets/background1.png"),
                fit: BoxFit.cover,
              ),
              // color: Color.fromARGB(244, 10, 224, 178),
            ),
            child: const Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image(
                    width: 140,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Container(
              color: const Color.fromARGB(244, 10, 224, 178),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Buyurtmalar",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Barchasi",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: fetchOrder,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Orders> orders = snapshot.data as List<Orders>;
                if (orders.isEmpty) {
                  return const Center(
                    child: Text("Nothing to show!"),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    var order = orders[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  "${order.mine!.name} (${order.id.toString()})",
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Text(order.createdAt.toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(order.skvajina.toString()),
                              Text(
                                statusData[order.status.toString()]
                                            .toString()
                                            .length >
                                        20
                                    ? statusData[order.status.toString()]!
                                        .substring(0, 20)
                                    : statusData[order.status.toString()]
                                        .toString(),
                                style: const TextStyle(color: Colors.green),
                              )
                            ],
                          )
                        ],
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
        )
      ],
    );
  }
}
