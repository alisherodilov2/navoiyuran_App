import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test/pages/login.dart';

// ignore: must_be_immutable
class PasswordPage extends StatefulWidget {
  PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController pinCode = TextEditingController();

  FocusNode focusNode = FocusNode();

  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              const Center(
                child: Image(
                  width: 120,
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              PinCodeFields(
                length: 4,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 60.0,
                fieldWidth: 60.0,
                borderWidth: 1.0,
                activeBorderColor: Colors.green,
                activeBackgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                fieldBackgroundColor: Colors.black12,
                borderColor: Colors.black12,
                textStyle: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                onComplete: (String value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.clear();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                    onPressed: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.clear();
                    },
                    icon: const Icon(
                      Icons.fingerprint,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      var passwordmain = localStorage.getString("password");

                      if (passwordmain != null) {
                        if (passwordmain == password) {
                          Navigator.pushReplacementNamed(
                              context, 'home_screen');
                        } else {
                          const AlertDialog(
                            title: Text("My title"),
                            content: Text("This is my message."),
                          );
                        }
                      }
                      localStorage.setString("password", password);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Keyingi",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_right,
                              size: 35,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
