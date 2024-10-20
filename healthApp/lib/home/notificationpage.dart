import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF35C5Cf),
        title: Text('Notification Panel'),
      ),
      body: Center(
        child: Text(
          'This is the Notification Panel',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}