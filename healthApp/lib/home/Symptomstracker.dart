import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:healthapp/home/airesult.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _MynewState();
}

class _MynewState extends State<Symptoms> {
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8EFF5),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Chat Bot',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 10,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  radius: Radius.circular(8),
                  thickness: 8,
                  trackVisibility: true,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: TextField(
                        controller: _controller,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Type your message here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xFF35C5Cf))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return airesult();
                      },));
                    },
                    child: const Text('Submit response',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
