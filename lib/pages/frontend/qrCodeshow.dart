import 'package:flutter/material.dart';
import 'package:test/models/qrCodeShowModel.dart';

class QrCodeShow extends StatefulWidget {
  final data;
  const QrCodeShow({super.key, required this.data});

  @override
  State<QrCodeShow> createState() => _QrCodeShowState();
}

class _QrCodeShowState extends State<QrCodeShow> {
   late Future<List<qrCodeShow>> fetchOrder;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Text(widget.data.toString()),
          ),
        ],
      ),
    );
  }
}
