import 'dart:math';
import 'package:flutter/material.dart';
import '../bmi_result/bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children:
        [
          // section one
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                          setState(() {
                            isMale = true;
                          });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isMale? Colors.blue : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image(
                                image: AssetImage('assets/images/male.png'),
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                            color: isMale? Colors.grey[400]: Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Image(
                              image: AssetImage('assets/images/female.png') ,
                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // section two
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // section three
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                heroTag: '3',
                                mini: true,
                                child: Icon(
                                  Icons.remove
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      weight ++;
                                    });
                                  },
                                heroTag: '4',
                                mini: true,
                                child: Icon(
                                  Icons.add
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                heroTag: '1',
                                mini: true,
                                child: Icon(
                                  Icons.remove
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed:(){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                heroTag: '2',
                                mini: true,
                                child: Icon(
                                  Icons.add
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // button
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
                onPressed: (){
                  double result = weight / pow(height / 100, 2);
                  print(result.round());
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                          builder:(context) => BmiResult(
                            age: age,
                            isMale:   isMale,
                            result: result.round(),
                          ),
                      ),
                  );
                },
                height: 50 ,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
