// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final weightController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.network(
                    "https://www.towngatepractice.net/wp-content/uploads/sites/508/2022/05/BMI-CALCULATOR.png"),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 100.0, bottom: 10.0),
                  child: Text("Weight"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 100.0, bottom: 10.0),
                  child: Text("Age"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 10.0, bottom: 50.0),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your weight in KG',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 10.0, bottom: 50.0),
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your age in years',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 200.0, right: 200.0),
                  child: ElevatedButton(
                      onPressed: () {
                        calculateBMI(
                          double.parse(weightController.text),
                          double.parse(ageController.text),
                        );
                      },
                      child: Text("Calculate")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void calculateBMI(double weight, double age) {
    print("Weight: $weight KG");
    print("Age: $age years");
  }
}
