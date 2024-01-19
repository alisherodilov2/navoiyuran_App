import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/Api/BaseApi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    authCheck();
    super.initState();
  }

  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> authCheck() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString("token") != null) {
      Navigator.pushNamed(context, 'password_page');
    }
  }

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottomOpacity: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height - 80,
            child: Column(
              children: [
                const Center(
                  child: Image(
                    width: 140,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    right: 16,
                    left: 16,
                  ),
                  child: TextFormField(
                    controller: login,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please your login';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      fillColor: Colors.white,
                      // suffixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                      labelText: 'Login',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    right: 16,
                    left: 16,
                  ),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      suffix: Icon(Icons.remove_red_eye),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Parolni esdan chiqardizmi?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        var responce = await http.post(
                          Uri.parse(Auth.login),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(
                            {"login": login.text, "password": password.text},
                          ),
                        );

                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        var data = jsonDecode(responce.body);
                        localStorage.setString("token", data['token']);
                        localStorage.setString(
                          "users",
                          jsonEncode(
                            data['user'],
                          ),
                        );
                        print(localStorage.getString('users'));
                        Navigator.pushReplacementNamed(
                            context, 'password_page');
                        setState(() {
                          isLoading = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Kirish",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
