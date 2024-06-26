import 'package:flutter/material.dart';
import 'package:test/layouts/alerts.dart';
import 'package:test/models/labaratory/Labatoy.dart';

class SampleActivated extends StatefulWidget {
  final id;
  const SampleActivated({super.key, required this.id});
  @override
  State<SampleActivated> createState() => _SampleActivatedState();
}

class _SampleActivatedState extends State<SampleActivated> {
  late Future<ActiveSample> fetchSampleNew;
  var isChecked = false;
  var isLoading = false;
  void initState() {
    // TODO: implement initState
    setState(() {
      print(widget.id);
      fetchSampleNew = fetchSampleActive(widget.id);
    });

    fetchSampleNew.then((value) => {
          print("salom"),
          value.data!.group!.forEach((element) {
            if (element.isCheck == true) {
              setState(() {
                isChecked = true;
              });
            }
          })
        });
    super.initState();
  }

  void alert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Iltimos analiz turini tanlang'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void alertSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Namuna ishga qabul qilindi'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void alertNot(Param) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(Param.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  var groupId;
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
                                const Text("No"),
                                Text(sample.data!.no.toString())
                              ],
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
                                Text(sample.data!.geoNumber.toString() ?? '')
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
                                crossAxisCount: 5,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              itemCount: sample.data!.group!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var group = sample.data!.group![index];
                                if (group.done.toString() == 'true') {
                                  return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          group.analiz.toString(),
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        groupId = group.id;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: groupId == group.id
                                            ? const Color.fromARGB(
                                                255, 223, 223, 223)
                                            : Colors.grey,
                                      ),
                                      child: Center(
                                        child: Text(
                                          group.analiz.toString(),
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            isChecked
                                ? Center(
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (groupId == null) {
                                          alert();
                                        } else {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          var data = await sendActive(
                                              sample.data!.id, groupId);
                                          if (data == 200) {
                                            alertSuccess();
                                            setState(() {
                                              isLoading = false;
                                            });
                                          } else {
                                            alertNot(
                                                'Bu namuna ushbu analiz uchun tanlanmagan');
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        }
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
                                        child: Center(
                                          child: !isLoading
                                              ? const Text(
                                                  "QABUL QILISH",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              : const CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
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
                  child: Text('Something went 123'),
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
