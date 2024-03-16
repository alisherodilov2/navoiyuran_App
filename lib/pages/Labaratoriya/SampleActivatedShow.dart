import 'package:flutter/material.dart';
import 'package:test/models/labaratory/Labatoy.dart';

class SampleActivated extends StatefulWidget {
  final id;
  const SampleActivated({super.key, required this.id});
  @override
  State<SampleActivated> createState() => _SampleActivatedState();
}

class _SampleActivatedState extends State<SampleActivated> {
  late Future<ActiveSample> fetchSampleNew;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      fetchSampleNew = fetchSampleActive(widget.id);
    });
    fetchSampleNew.then((value) => {
          value.data.group.forEach((element) {
            if (element.isCheck) {
              setState(() {
                isChecked = true;
              });
            }
          })
        });
    super.initState();
  }

  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: fetchSampleNew,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ActiveSample sample = snapshot.data as ActiveSample;
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Center(
                              child: Image(
                                width: 140,
                                image: AssetImage("assets/logo.png"),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Buyurtma raqami"),
                                Text(sample.data!.customId.toString() == 'null'
                                    ? sample.data!.orderId.toString()
                                    : sample.data!.customId.toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Geologik raqami"),
                                Text(sample.data!.geoNumber.toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Haltacha og'irligi"),
                                Text(sample.data!.sampleId!.packWeight
                                    .toString())
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Kon"),
                                Text(
                                  sample.data!.mine.toString(),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Chuqurligi dan"),
                                Text(
                                  sample.data!.sampleId!.depthFrom.toString(),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Chuqurligi gacha"),
                                Text(
                                  sample.data!.sampleId!.depthTo.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GridView.builder(
                              shrinkWrap:
                                  true, // Ensure the GridView doesn't try to expand infinitely
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: sample.data!.group!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var group = sample.data!.group![index];

                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: group.done ?? false
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  child: Center(
                                    child: Text(
                                      group.analiz.toString(),
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            isChecked
                                ? Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        print('salom');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Center(
                                          child: Text(
                                            "QABUL QILISH",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
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
        ),
      ),
    );
  }
}
