import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test/models/dashboardModel.dart';

class LeadingPageMain extends StatefulWidget {
  const LeadingPageMain({super.key});

  @override
  State<LeadingPageMain> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPageMain> {
  late Future<Dashboard> fetchDashboardData;
  @override
  void initState() {
    fetchDashboardData = fetchDashboard();

    super.initState();
  }

  var colors = [
    const Color.fromARGB(255, 92, 255, 225),
    const Color.fromARGB(255, 68, 190, 217),
    const Color.fromARGB(255, 79, 201, 156),
    const Color.fromARGB(255, 7, 118, 221),
    const Color.fromARGB(0, 201, 92, 108),
    const Color.fromARGB(255, 237, 182, 72),
    const Color.fromARGB(255, 233, 57, 57),
    const Color.fromARGB(255, 49, 39, 98),
  ];
  var random = Random();
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return FutureBuilder(
      future: fetchDashboardData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Dashboard? dashboard = snapshot.data as Dashboard;
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_lab.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Buyurtmalar",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: LineChart(
                                LineChartData(
                                  titlesData: FlTitlesData(
                                    show: false,
                                    topTitles: SideTitles(),
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  gridData: FlGridData(show: true),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: dashboard.lab!
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        final double x = entry.key.toDouble();
                                        final double y =
                                            entry.value.tasks!.toDouble();
                                        return FlSpot(x, y);
                                      }).toList(),
                                      isCurved: true,
                                      dotData: FlDotData(show: true),
                                      colors: [Colors.blue],
                                      barWidth: 5,
                                    ),
                                    LineChartBarData(
                                      spots: dashboard.lab!
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        final double x = entry.key.toDouble();
                                        final double y =
                                            entry.value.taskDone!.toDouble();
                                        return FlSpot(x, y);
                                      }).toList(),
                                      isCurved: true,
                                      dotData: FlDotData(show: true),
                                      colors: [Colors.red],
                                      barWidth: 5,
                                    ),
                                    // Add more LineChartBarData as needed
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: dashboard.lab!.map((e) {
                                return Container(
                                  child: Text(e.name.toString()),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Barcha buyurtmalar")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text("Barajilgan Buyurtmalar")
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // chart end
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 120, // Adjust the width as needed
                            height: 150, // Adjust the height as needed
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: [
                                  PieChartSectionData(
                                    color: const Color.fromARGB(
                                        255, 226, 226, 226),
                                    value: dashboard.orders!.orderNumber
                                            ?.toDouble() ??
                                        0.0,
                                    title: '',
                                    radius: 15,
                                    titleStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    showTitle: true,
                                  ),
                                  PieChartSectionData(
                                    color:
                                        const Color.fromARGB(255, 42, 124, 149),
                                    value: 6,
                                    title: '',
                                    radius: 15,
                                    titleStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    showTitle: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dashboard.orders!.orderNumber.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  "Buyurtmalar",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 120, // Adjust the width as needed
                            height: 150, // Adjust the height as needed
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 0,
                                centerSpaceRadius: 30,
                                sections: [
                                  PieChartSectionData(
                                    color: const Color.fromARGB(
                                        255, 226, 226, 226),
                                    value: 3,
                                    title: '',
                                    radius: 15,
                                    titleStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    showTitle: true,
                                  ),
                                  PieChartSectionData(
                                    color:
                                        const Color.fromARGB(255, 42, 124, 149),
                                    value: dashboard.orders!.taskDone
                                            ?.toDouble() ??
                                        0.0,
                                    title: '',
                                    radius: 15,
                                    titleStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    showTitle: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dashboard.orders!.tasks.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  "Namunalar",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // radiaPid
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Tahlilar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: PieChart(
                                  PieChartData(
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 0,
                                    sections: dashboard.analiz!.map((e) {
                                      return PieChartSectionData(
                                        color: colors[
                                            random.nextInt(colors.length)],
                                        value: e.tasksCount!.toDouble(),
                                        title: e.name,
                                        titleStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        radius: 80,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: dashboard.analiz!.map((e) {
                                      return Text(
                                        e.name ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: dashboard.analiz!.map((e) {
                              return Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Text(
                                        e.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: LinearProgressIndicator(
                                        value:
                                            e.tasksCountDone!.toDouble() / 10,
                                        minHeight: 10,
                                        borderRadius: BorderRadius.circular(10),
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 11, 96, 165),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: Container(
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(12.0),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey.withOpacity(0.5),
                      //           spreadRadius: 5,
                      //           blurRadius: 7,
                      //           offset:
                      //               Offset(0, 3), // changes position of shadow
                      //         ),
                      //       ],
                      //     ),
                      //     child: const BarChartExample(),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
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
    );
  }
}
