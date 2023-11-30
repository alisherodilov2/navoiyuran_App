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
    '0': 'yangi',
    '1': 'namunalar tayyorlanmoqda',
    '2': 'markirovkalanmoqda',
    '3': 'buyurtma shakillantirishda',
    '4': 'buyurtma yuborishga tayyor',
    '20': 'Raxbar',
    '21': 'Rad Etildi',
    '22': 'Tasqidlandi',
    '5': 'buyurtma yuborildi',
    '6': 'buyurtma qaytarildi',
    '7': 'buyurtma qabul qilindi',
    '8': 'buyurtma omborda',
    '9': 'buyurtma tadqiqotlarga chiqarildi',
    '10': 'tadqiqotlarga chiqarildi',
    '11': 'taqiqotlarga qabul qilindi',
    '12': 'tadqiqotlar jarayonida',
    '13': 'tadqiqotlar natijalari',
    '14': 'natijalarni buyurtmachiga yuborish',
    '15': 'natijalarni buyurtmachi qabul qildi',
    '17': 'natijalarni buyurtmachi qabul qilmadi',
    '18': 'natijalar arxivga yuborildi',
    '19': 'arxivda saqlanyapti',
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
              image: DecorationImage(
                image: AssetImage("assets/background1.png"),
                fit: BoxFit.cover,
              ),
              color: Color.fromARGB(244, 10, 224, 178),
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
                              Text(
                                "${order.area!.mine!.name} (${order.orderNumber.toString()})",
                              ),
                              Text(order.createdAt.toString())
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(order.area!.name.toString()),
                              Text(
                                statusData[order.status.toString()].toString(),
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
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ],
    );
  }
}
