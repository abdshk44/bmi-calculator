import 'package:flutter/material.dart';
import 'package:bmicalculator/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180;
  int weight = 70;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff0955d9),
          title: Center(
              child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.5),
                      color: Color(0xff0955d9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.5),
                      color: Color(0xff0955d9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 189,
                width: 334,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.5),
                  color: Color(0xff0955d9),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT (cm)',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Slider(
                        value: height,
                        min: 180,
                        max: 250,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }),
                    Text(
                      height.toStringAsFixed(1),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff0955d9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.line_weight, size: 25, color: Colors.white),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Weight (kg)',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'Weight-',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.white,
                            ),
                            FloatingActionButton(
                              heroTag: 'Weight+',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 159,
                    width: 136,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff0955d9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cake,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Age (Years)',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$age',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age-',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.white,
                            ),
                            FloatingActionButton(
                              heroTag: 'age+',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: double.infinity,
                child: ElevatedButton(

                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onPressed: () {
                    double heightInMeters = height / 100;
                    double bmi = weight / (heightInMeters * heightInMeters);


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(bmiResult: bmi),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0955d9),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
