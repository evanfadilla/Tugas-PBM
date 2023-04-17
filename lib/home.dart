import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double bmi = 0.0;
  String explanation = '';

  bool getBMI() {
    if (weight.text.isNotEmpty &&
        double.parse(weight.text) > 0 &&
        height.text.isNotEmpty &&
        double.parse(height.text) > 0) {
      setState(() {
        bmi = double.parse(weight.text) /
            (pow((double.parse(height.text) / 100), 2));
        if (bmi < 18.5) {
          explanation = "You are too skinny, please eat more foods!";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          explanation = "You are healthy, please keep it up!";
        } else {
          explanation = "You are overweight, please take some workout!";
        }
      });
      return true;
    } else {
      return false;
    }
  }

  final weight = TextEditingController();
  final height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color(0xFFF6F1F1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('Hi, $email',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff000000))),
            const SizedBox(
              height: 40,
            ),
            const Text('Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff000000))),
            const Text(
              'Body Mass Index',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xff000000)),
            ),
            const Text(
              'Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color(0xff000000)),
            ),
            const SizedBox(
              height: 40,
            ),
            if (explanation.isNotEmpty)
              const Text(
                'Your BMI result :',
                style: TextStyle(fontSize: 20, color: Color(0xff000000)),
                textAlign: TextAlign.end,
              ),
            if (explanation.isNotEmpty)
              Text(
                bmi.toStringAsFixed(2),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)),
                textAlign: TextAlign.end,
              ),
            const SizedBox(
              height: 30,
            ),
            if (explanation.isNotEmpty)
              const Text(
                "It means that...",
                style: TextStyle(fontSize: 20, color: Color(0xff000000)),
              ),
            if (explanation.isNotEmpty)
              Text(
                explanation,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)),
              ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: height,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "ex 180 cm",
                  labelText: "Height (cm)",
                  hintStyle: TextStyle(color: Color(0xff000000)),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: weight,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "ex 75 kg",
                  labelText: "Weight (kg)",
                  hintStyle: TextStyle(color: Color(0xff000000)),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                final explanation = getBMI();
                if (explanation == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill all required TextField')));
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xff146C94),
                    borderRadius: BorderRadius.circular(60)),
                width: double.infinity,
                child: Text(
                  'Get BMI',
                  style: const TextStyle(
                      color: Color(0xffF6F1F1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
