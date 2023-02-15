import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'No done tasks',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
