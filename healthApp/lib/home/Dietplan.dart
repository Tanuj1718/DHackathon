import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFD8EFF5),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                  ),
                  label: Text("Diet Name",
                      style: TextStyle(
                          color: Colors.black
                      )
                  ),
                  border: OutlineInputBorder(),
      
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                  ),
                  label: Text("Start Date",
                      style: TextStyle(
                          color: Colors.black
                      )
                  ),
                  border: OutlineInputBorder(),
      
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Scrollbar(
              thumbVisibility: true,
              radius: Radius.circular(8),
              thickness: 8,
              trackVisibility: true,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                  ),
                  label: Text("End Date",
                      style: TextStyle(
                          color: Colors.black
                      )
                  ),
                  border: OutlineInputBorder(),
      
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF35C5Cf))),
                  onPressed: () {},
                  child: const Text('Create Plan',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 1,color: Colors.black),
            ),
            Container(
                child: Column(
                  children: [
                    Text("Diet Name : "),
                    Text("Start Date : "),
                    Text("Description: "),
                    Text("End Date: "),
                    Text("End Date: "),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
