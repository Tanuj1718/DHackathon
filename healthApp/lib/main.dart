import'package:flutter/material.dart';
import 'package:healthapp/splash.dart';

void main(){
  runApp(
    const Health()
  );
}
class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
