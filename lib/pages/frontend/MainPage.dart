import 'package:flutter/material.dart';
import 'package:test/models/orderModels.dart';
import 'package:test/pages/frontend/Lab/labatories.dart';
import 'package:test/pages/frontend/LeadingPage.dart';
import 'package:test/pages/frontend/orderPage.dart';
import 'package:test/pages/frontend/profilePage.dart';
import 'package:test/pages/profile/myTasks.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  late Future<List<Orders>> fetchOrder;

  late List pages = [
    LeadingPageMain(),
    ProfilePage(),
    Labatories(),
    OrdersPage(),
  ];
  late dynamic pagemain = pages[0];
  late int selectedIndex = 0;
  void changePage(page) {
    setState(() {
      pagemain = pages[page];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/background1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // backgroundColor: Color.fromARGB(244, 10, 224, 178),
        body: pagemain,
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Color.fromARGB(255, 113, 232, 210),
          onPressed: () {
            Navigator.pushNamed(context, 'qr_code');
          },
          child: const Icon(Icons.qr_code_2_outlined), //icon inside button
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          // ignore: prefer_const_constructors

          child: BottomAppBar(
            //bottom navigation bar on scaffold
            color: Colors.white,
            shape: const CircularNotchedRectangle(), //shape of notch
            notchMargin: 6,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home_outlined,
                      color: selectedIndex == 0
                          ? const Color.fromARGB(255, 91, 91, 91)
                          : const Color.fromARGB(255, 91, 91, 91)),
                  onPressed: () {
                    changePage(0);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.all_inbox,
                      color: selectedIndex == 1
                          ? const Color.fromARGB(255, 91, 91, 91)
                          : const Color.fromARGB(255, 91, 91, 91)),
                  onPressed: () {
                    changePage(3);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(Icons.science_outlined,
                      color: selectedIndex == 2
                          ? const Color.fromARGB(255, 91, 91, 91)
                          : const Color.fromARGB(255, 91, 91, 91)),
                  onPressed: () {
                    changePage(2);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle_outlined,
                      color: selectedIndex == 3
                          ? const Color.fromARGB(255, 91, 91, 91)
                          : const Color.fromARGB(255, 91, 91, 91)),
                  onPressed: () {
                    changePage(1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
