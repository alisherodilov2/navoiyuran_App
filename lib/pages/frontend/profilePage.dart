import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/models/data/profileData.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var user;
  var isLoading = true;
  @override
  void initState() {
    // TODO: implement initStat
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var mainUser = localStorage.getString('users');
    setState(() {
      user = jsonDecode(mainUser!);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/backgroundProfile.png"),
                              fit: BoxFit.cover,
                            ),
                            color: Color.fromARGB(244, 10, 224, 178),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(
                                    'assets/profile.jpg',
                                    height: 80.0,
                                    width: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      user['name'] ?? ' ',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "ID (${user['id'].toString() ?? ''})",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(244, 10, 224, 178),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: profileData.map((e) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          e['icon'] as IconData?,
                                          size: 18,
                                        ),
                                        Text(
                                          "${e['title']}",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        if (e['route'] != null)
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 18,
                                          )
                                        else
                                          SizedBox(),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    height: 0.5,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 219, 218, 218),
                                    ),
                                  )
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
  }
}
