import 'package:flutter/material.dart';

class Dispatcher extends StatefulWidget {
  const Dispatcher({super.key});

  @override
  State<Dispatcher> createState() => _DispatcherState();
}

class _DispatcherState extends State<Dispatcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Dispatcher'),
      ),
    );
  }
}
