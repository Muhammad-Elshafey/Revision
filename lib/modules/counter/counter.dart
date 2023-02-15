import 'package:flutter/material.dart';

// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget

class Counterful extends StatefulWidget {
  Counterful({Key? key}) : super(key: key);

  @override
  State<Counterful> createState() => _CounterfulState();
}

class _CounterfulState extends State<Counterful> {
  int counter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  counter--;
                  print(counter);
                });
              },
              child: Text(
                'MINUS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                  print(counter);
                });
              },
              child: Text(
                'PLUS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
