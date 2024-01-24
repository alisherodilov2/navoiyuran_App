import 'package:flutter/material.dart';
import 'package:test/models/labatoriesModel.dart';

class Labatories extends StatefulWidget {
  const Labatories({super.key});

  @override
  State<Labatories> createState() => _LabatoriesState();
}

class _LabatoriesState extends State<Labatories> {
  late Future<List<Labatory>> fetchLabData;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      fetchLabData = fetchLab();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 90,
              child: FutureBuilder(
                future: fetchLab(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Labatory> labData = snapshot.data as List<Labatory>;
                    if (labData.isEmpty) {
                      return const Center(
                        child: Text("Nothing to show!"),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: labData.length,
                      itemBuilder: (context, index) {
                        var lab = labData[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color.fromARGB(45, 185, 183, 183),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(18),
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                195, 179, 223, 185),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              lab.name.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tekshiruv turlari",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "Soni",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: lab.analisses!.map((e) {
                                            return Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(e.name!.length < 20
                                                          ? e.name.toString()
                                                          : "${e.name!.substring(0, 30)}..."),
                                                      Text(e.groups.toString())
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
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
          ],
        ),
      ],
    );
  }
}
