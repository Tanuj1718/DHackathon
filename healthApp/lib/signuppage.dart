import 'package:flutter/material.dart';
import 'package:healthapp/home/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterPage();
}

class RegisterPage extends State<Register> {
  bool _isPasswordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  Future<void> __signup() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String age = ageController.text;
    String address = addressController.text;
    String city = cityController.text;

    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp emailRegex = RegExp(emailPattern);
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid email address")));
      return;
    }

    String passwordPattern =
        r'^[?=.A-Z]+[?=.a-z]+[?=.0-9]+[?=.!@#$%^&*()_+]{8,}$';
    RegExp passwordRegex = RegExp(passwordPattern);
    // if (!passwordRegex.hasMatch(password)) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //           "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character."),
    //     ),
    //   );
    //   return;
    // }

    String agePattern = r'^[0-9]{1,3}$';
    RegExp ageRegex = RegExp(agePattern);
    if (!ageRegex.hasMatch(age)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid age")),
      );
      return;
    }

    if (name.isEmpty || email.isEmpty || password.isEmpty  || age.isEmpty || address.isEmpty || city.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please fill in all fields")));
      return;
    }

    // Now proceed with the API call if all validations are correct.
    var url = Uri.parse('https://d-hackathon-ten.vercel.app/?vercelToolbarCode=p8pA_3Qvw0xLZJV/user/signup'); // Replace with your API endpoint

    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json", // Set headers if necessary
        },
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,
          "age": age,
          "address": address,
          "city": city,
          "gender":"m",
        }),
      );

      if (response.statusCode == 200) {
        // Success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration successful")),
        );
        // Handle successful response (e.g., navigate to another screen)
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.body}")),
        );
      }
    } catch (e) {
      // Handle network error or other exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffededf1),
        appBar: AppBar(
          backgroundColor: const Color(0xffD8EFF5),
          title: const Text('Create An Account'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Colors.amber,
                    height: 180,width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/paris.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Full Name
                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Email Address
                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: emailController,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: "Age",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.child_care, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),

                  // Address
                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.home, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    margin: const EdgeInsets.only(
                        bottom: 16),
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon:
                        Icon(Icons.location_city, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xFF35C5Cf), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Registration successful")),
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));

                                });
                                print(nameController.text);
                                print(emailController.text);
                                print(passwordController.text);
                                print(ageController.text);
                                print(addressController.text);
                                print(cityController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF35C5Cf)),
                              child: Text(
                                "SIGNUP",
                                style: TextStyle(color: Color(0xffededf1)),
                              ))))
                ],
              ),
            ),
          ),
        ));
  }
}