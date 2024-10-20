import 'package:flutter/material.dart';

class airesult extends StatefulWidget {
  const airesult({super.key});

  @override
  State<airesult> createState() => _MynewState();
}

class _MynewState extends State<airesult> {
  // Define a string with the text you want to display
  String myText = "This is the existing text that will appear in the container.\n\n"
      "You can add more lines here to see how the scrolling works.\n"
      "Just keep adding text to make it longer.\n"
      "Make sure to test the scrolling functionality!\n\n"
      "More text...\n"
      "More text...\n"
      "More text...\n"
      "More text...\n";

  // ScrollController for the scrolling behavior
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
              height: 300, // Set a fixed height for the container
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1), // Add border
                borderRadius: BorderRadius.circular(8), // Make the corners rounded
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Add padding inside the container
                child: Scrollbar(
                  thumbVisibility: true, // Always show scrollbar
                  controller: _scrollController, // Attach the scroll controller
                  radius: Radius.circular(8), // Custom radius for the scrollbar
                  thickness: 8, // Adjust the thickness of the scrollbar
                  child: SingleChildScrollView(
                    controller: _scrollController, // Attach the scroll controller to the SingleChildScrollView
                    child: Text(
                      myText,
                      style: TextStyle(fontSize: 16), // Set the text style
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150, // Set the desired width
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF35C5Cf)),
                    ),
                    onPressed: () {
                      // Your onPressed function here
                    },
                    child: Text('Diet Plans',style: TextStyle(color: Colors.white,fontSize: 17)),
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  height: 50,
                  width: 150, // Set the desired width
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF35C5Cf)),
                    ),
                    onPressed: () {
                      // Your onPressed function here
                    },
                    child: Text('Exercises',style: TextStyle(color: Colors.white,fontSize: 17)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }
}