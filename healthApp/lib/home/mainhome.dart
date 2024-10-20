import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart package

class House extends StatefulWidget {
  const House({super.key});

  @override
  State<House> createState() => _HouseState();
}

class _HouseState extends State<House> {

  final List<Task> _tasks = [
    Task(name: 'Water Intake'),
    Task(name: 'Exercise At Home or Gym'),
    Task(name: 'Balanced Diet'),
    Task(name: 'Minimum 7 - 8hrs Sleep'),
    Task(name: 'Meditate for 10 minutes'),
  ];

  int x = 0;

  void _updateCompletedTasks() {
    setState(() {
      x = _tasks.where((task) => task.isCompleted).length;
      print(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD8EFF5),
      child: Column(
          children : [
            SizedBox(height: 30,),
            Text("Hey Ritesh", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 30,),
            Text("Your Today's Goal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 30,),

            Container(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sections: _showingSections(),
                        centerSpaceRadius: 0,
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(right: 10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [ Text("Completed Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),),
                       Text("Incompleted Task",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),],
                   ),
                 )
                ],
              ),
            ),
            SizedBox(height: 30,),

            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: _tasks[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _tasks[index].isCompleted = value ?? false;
                        _updateCompletedTasks();
                      });
                    },
                  );
                },
              ),
            ),
          ],
      ),
    );
  }
  List<PieChartSectionData> _showingSections() {
    int totalTasks = _tasks.length;
    double completedPercentage = (x / totalTasks) * 100;
    double remainingPercentage = 100 - completedPercentage;

    return [
      PieChartSectionData(
        color: Colors.green,
        value: completedPercentage,
        title: '${completedPercentage.toInt()}%',
        radius: 100,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: remainingPercentage,
        title: '${remainingPercentage.toInt()}%',
        radius: 90,
        titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  TaskTile({required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListTile(
        title: Text(
          task.name,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontSize: 18.0,
          ),
        ),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: onChanged,
          activeColor: Color(0xFF35C5Cf),
        ),
      ),
    );
  }
}
