import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthapp/login.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash>
with SingleTickerProviderStateMixin
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 2),()  {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage())
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
    Column(
      children: [
        Center(child: Lottie.asset("assets/Lottie/Animation - 1729322434611.json"),)
      ],
    )
        , nextScreen: LoginPage(),backgroundColor: Color(0xFFD8EFF5),splashIconSize: 400,
    );
  }
}