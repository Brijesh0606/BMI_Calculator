import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIScore extends StatefulWidget {

  final int age;
  final int weight;
  final int feet;
  final int inch;
  final bool isMale;
  final bool isFemale;

  const BMIScore({
    super.key,
    required this.age,
    required this.weight,
    required this.feet,
    required this.inch,
    required this.isMale,
    required this.isFemale,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BMIScoreState createState() {
    return _BMIScoreState();
  }

}

class BMIScoreState extends State<BMIScore> {
  BMIScoreState({required this.title});

  final String title;

  State<BMIScore> createState() => _BMIScoreState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Score',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

}

class _BMIScoreState extends State<BMIScore> {

  double heightMeter = 0;
  double bmiScore = 0;
  String bodyStatus = "";
  Color bodyStatusColor = Colors.black;

  @override
  void initState() {
    super.initState();

    heightMeter = (double.parse(widget.feet.toString())*0.3048)+(double.parse(widget.inch.toString())*0.0254);
    bmiScore = (double.parse(widget.weight.toString()))/pow(heightMeter,2);

    if(bmiScore < 18.5) {
      bodyStatus = "Underweight";
      bodyStatusColor = Colors.lightBlue;
    } else if(18.5 <= bmiScore && bmiScore < 25) {
      bodyStatus = "Normal";
      bodyStatusColor = Colors.lightGreen;
    }else if(25 <= bmiScore && bmiScore < 30) {
      bodyStatus = "Overweight";
      bodyStatusColor = Colors.yellow;
    }else {
      bodyStatus = "Obese";
      bodyStatusColor = Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BMI Score", style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: "You are "),
                        TextSpan(
                          text: bodyStatus,
                          style: TextStyle(color: bodyStatusColor), // Set a different color
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: "BMI Score "),
                        TextSpan(
                          text: bmiScore.toStringAsFixed(2),
                          style: TextStyle(color: bodyStatusColor), // Set a different color
                        ),
                        const TextSpan(text: " is "),
                        TextSpan(
                          text: "$bodyStatus BMI",
                          style: TextStyle(color: bodyStatusColor), // Set a different color
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 50,
                          interval: 5,
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 0, endValue: 18.5, color: Colors.lightBlue,),
                            GaugeRange(startValue: 18.5, endValue: 25, color: Colors.lightGreen,),
                            GaugeRange(startValue: 25, endValue: 30, color: Colors.yellow,),
                            GaugeRange(startValue: 30, endValue: 50, color: Colors.red,),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: bmiScore,
                              enableAnimation: true,
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Text(bmiScore.toStringAsFixed(2),style: TextStyle(color: bodyStatusColor,fontSize: 35,fontWeight: FontWeight.bold),),
                              positionFactor: 0.75,
                              angle: 90,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

}