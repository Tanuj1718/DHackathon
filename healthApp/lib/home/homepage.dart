import 'package:flutter/material.dart';
import 'package:healthapp/home/Dietplan.dart';
import 'package:healthapp/home/Exercises.dart';
import 'package:healthapp/home/Symptomstracker.dart';
import 'package:healthapp/home/drawer.dart';
import 'package:healthapp/home/mainhome.dart';
import 'package:healthapp/home/notificationpage.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int myindex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    HomeScreen(),
    SymptomTrackerScreen(),
    DietPlanScreen(),
    ExercisesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xFFD8EFF5),
          child: drawer()
        ),
        appBar: AppBar(
          actions: [Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.notification_add),
              onPressed: () {
                Navigator.of(context).push(_createRoute());
              },
            ),
          )],
          automaticallyImplyLeading: false,
          title:
          Row(
            children: [
              Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },icon: Icon(Icons.menu,color: Colors.white,size: 30,),
                    );
                  }
              ),
              SizedBox(
                width: 100,
              ),
              Text("HOME",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
            ],
          ),

          backgroundColor: Color(0xFF35C5Cf),
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
          children: _pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedIconTheme: IconThemeData(color: Colors.black),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              myindex = index;
              _pageController.animateToPage(
                myindex,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          currentIndex: myindex,
          backgroundColor: Color(0xFF35C5Cf),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: "Symptom \nTracker"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Diet Plan"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Exercises"
            ),
          ],
        )
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return House();
  }
}

class SymptomTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Symptoms();
  }
}

class DietPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Diet();
  }
}

class ExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Exercises();
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Notify(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}


