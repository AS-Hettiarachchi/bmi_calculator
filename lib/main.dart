// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  double? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.network(
                      "https://www.towngatepractice.net/wp-content/uploads/sites/508/2022/05/BMI-CALCULATOR.png"),
                ),
              ],
            ),
            Row(
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
                    child: Text("Height"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, right: 10.0, top: 10.0, bottom: 50.0),
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
                        left: 10.0, right: 20.0, top: 10.0, bottom: 50.0),
                    child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter your height in Meters',
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
                    padding: EdgeInsets.only(left: 120.0, right: 120.0),
                    child: ElevatedButton(
                      onPressed: () {
                        calculateBMI(
                          double.parse(weightController.text),
                          double.parse(heightController.text),
                        );
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (bmi != null) // Show BMI only if it's calculated
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Your BMI is: ${bmiToString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        gotoInfo();
                      },
                      child: Text(
                        "More info",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  String bmiToString() {
    return bmi!.toStringAsFixed(1);
  }

  void gotoInfo() {
    Get.to(ResultPage(bmi: bmi!));
  }

  void calculateBMI(double weight, double height) {
    print("Weight: $weight KG");
    print("Height: $height Meters");

    double calculatedBMI = weight / (height * height);
    print(calculatedBMI);

    setState(() {
      bmi = calculatedBMI;
    });
  }
}

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage({required this.bmi});

  String getBmiCategory(double bmi) {
    if (bmi < 16) {
      return "Severe undernourishment";
    } else if (bmi >= 16 && bmi < 17) {
      return "Medium undernourishment";
    } else if (bmi >= 17 && bmi < 18.5) {
      return "Slight undernourishment";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal nutrition state";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else if (bmi >= 30 && bmi < 40) {
      return "Obesity";
    } else {
      return "Extreme obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = getBmiCategory(bmi);
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI is: ${bmi.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              "BMI Category: $category",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
