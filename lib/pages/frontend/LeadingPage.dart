import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:test/layouts/barchart.dart';

class LeadingPageMain extends StatefulWidget {
  const LeadingPageMain({super.key});

  @override
  State<LeadingPageMain> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPageMain> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              show: false,
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ), // Set show to false to hide the border
                            gridData: FlGridData(show: true),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  const FlSpot(0, 34),
                                  const FlSpot(2, 3),
                                  const FlSpot(4, 30),
                                  const FlSpot(8, 20),
                                  const FlSpot(17, 10),
                                  const FlSpot(20, 2),
                                  const FlSpot(25, 4),
                                ],
                                isCurved: true,
                                dotData: FlDotData(show: true),
                                colors: [Colors.blue],
                                barWidth: 5,
                              ),
                              LineChartBarData(
                                spots: [
                                  const FlSpot(0, 34),
                                  const FlSpot(4, 3),
                                  const FlSpot(9, 20),
                                  const FlSpot(12, 20),
                                  const FlSpot(20, 10),
                                  const FlSpot(21, 2),
                                  const FlSpot(29, 4),
                                ],
                                isCurved: true,
                                dotData: FlDotData(show: true),
                                colors: [Colors.red],
                                barWidth: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                              color: const Color.fromARGB(255, 226, 226, 226),
                              value: 10,
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
                              color: const Color.fromARGB(255, 42, 124, 149),
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
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "6129",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
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
                              color: const Color.fromARGB(255, 226, 226, 226),
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
                              color: const Color.fromARGB(255, 42, 124, 149),
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
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5182",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
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
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tahlilar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: PolarChart(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "GSA",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "RSA",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "INNA",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Co2",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "SORT-92",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
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
                    ),
                    child: Column(
                      children: [
                        // ignore: prefer_const_constructors
                        // progress bar
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: const Text(
                                  "RSA",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: LinearProgressIndicator(
                                  value: 0.8,
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
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: BarChartExample(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PolarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections: [
          PieChartSectionData(
            color: const Color.fromARGB(255, 79, 201, 156),
            value: 1,
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            title: '20%',
            radius: 80, // Increase the radius as needed
          ),
          PieChartSectionData(
            color: const Color.fromARGB(255, 237, 182, 72),
            value: 2,
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            title: '30%',
            radius: 80, // Increase the radius as needed
          ),
          PieChartSectionData(
            color: const Color.fromARGB(255, 68, 190, 217),
            value: 2,
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            title: '34%',
            radius: 80, // Increase the radius as needed
          ),
          PieChartSectionData(
            color: const Color.fromARGB(255, 120, 93, 208),
            value: 2,
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            title: '40%',
            radius: 80, // Increase the radius as needed
          ),
          PieChartSectionData(
            color: const Color.fromARGB(255, 201, 92, 108),
            value: 2,
            titleStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            title: '40%',
            radius: 80, // Increase the radius as needed
          ),
        ],
      ),
    );
  }
}
