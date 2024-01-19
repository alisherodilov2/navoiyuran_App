import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/pages/frontend/MainPage.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Future<void> initState() async {
    super.initState();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.getString("lang") != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LeadingPage()));
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Ilovani tili \ntanlang!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                GestureDetector(
                  onTap: () async {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.setString('lang', 'uz');
                  },
                  child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://i.pinimg.com/originals/31/59/7f/31597f5024d357ed5cbac66f4bd61d3b.png",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Убекча")
                          ],
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.setString('lang', 'ru');
                  },
                  child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://avatars.mds.yandex.net/i?id=d829f71aeca7792dda16303e580284f27ebe3d72-10310841-images-thumbs&n=13",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Russcha")
                          ],
                        ),
                        Icon(
                          Icons.arrow_right_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
