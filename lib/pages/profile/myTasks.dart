import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test/Api/BaseApi.dart';
import 'package:test/models/taskModels.dart';

class myTasks extends StatefulWidget {
  const myTasks({super.key});

  @override
  State<myTasks> createState() => _myTasksState();
}

class _myTasksState extends State<myTasks> {
  late Future<List<TasksModels>> taskData;
  Future<List<TasksModels>> getTasks() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString("token");

    var response = await http.get(headers: {
      'Authorization': 'Bearer $token',
    }, Uri.parse(Auth.tasks));
    return (jsonDecode(response.body) as List)
        .map((e) => TasksModels.fromJson(e))
        .toList();
  }

  Future<List<TasksModels>> getByStatus(id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString("token");

    var response = await http.get(headers: {
      'Authorization': 'Bearer $token',
    }, Uri.parse('${Auth.tasksStatus}?status=$id'));
    return (jsonDecode(response.body) as List)
        .map((e) => TasksModels.fromJson(e))
        .toList();
  }

  var status = {
    "0": "Yangi",
    "1": "Tayorlanmoqda",
    "2": "Ko`rib Chiqilmoqda",
    "3": "Rad Etildi",
    "4": "Tayor",
    "7": "Buyurtmachi Rad Etdi",
    "9": "Buyurtmachi tasdiqladi",
  };
  @override
  void initState() {
    taskData = getTasks();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        taskData = getByStatus(0);
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          const Text(
                            "YANGI",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 212, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        taskData = getByStatus(2);
                        print(taskData);
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          const Text(
                            "JARAYONDA",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 212, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        taskData = getByStatus(4);
                      });
                    },
                    child: Container(
                      child: Column(
                        children: [
                          const Text(
                            "TAYOR",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 212, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 80,
              child: FutureBuilder(
                future: taskData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TasksModels> tasks =
                        snapshot.data as List<TasksModels>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        var task = tasks[index];
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 212, 184),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Buyurtma Raqami",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      task.orderId.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Tahlil turi",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      task.analizName.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Holati",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      status[task.status].toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
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
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
