import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/pages/frontend/Lab/labatories.dart';
import 'package:test/pages/frontend/dashboardPage.dart';
import 'package:test/pages/frontend/orderPage.dart';
import 'package:test/pages/frontend/profilePage.dart';
import 'package:test/pages/permissions/permissions.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({super.key});

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  @override
  void initState() {
    super.initState();
    getRole();
    print("working");
  }

  late Future<String?> roleMain = getRole();
  Future<String?> getRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var role = localStorage.getString('role');
    print(role);
    return role;
  }

  // late String roleMain;
  // Future<void> getRole() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var role = localStorage.getString('role');
  //   print(roleMain);
  //   setState(() {
  //     roleMain = role!;
  //   });
  //   // Check if 'roles' property exists in userMap
  // }

  late List pages = [
    const LeadingPageMain(),
    const ProfilePage(),
    const Labatories(),
    const OrdersPage(),
  ];

  late dynamic pagemain = pages[0];
  late int selectedIndex = 0;
  void changePage(page) {
    print('working');
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
        appBar: AppBar(),
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color.fromARGB(255, 87, 245, 166)],
              ),
            ),
            child: FutureBuilder<String?>(
              future: roleMain,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  String? userRole = snapshot.data;
                  return ListView(
                    children: permissions[userRole]?.map((e) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, e['route'].toString());
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 35,
                                left: 25,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    e['icon'] as IconData,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    e['title'].toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList() ??
                        [
                          const Text(
                              'No permissions available for the user role'),
                        ],
                  );
                }
              },
            ),
          ),
        ),
        // backgroundColor: Color.fromARGB(244, 10, 224, 178),
        body: pagemain,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 91, 236, 210),
          onPressed: () {
            Navigator.pushNamed(context, 'qr_code');
          },
          child: const Icon(Icons.qr_code_2_outlined),
          shape: const CircleBorder(),
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
