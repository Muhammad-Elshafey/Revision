import 'package:flutter/material.dart';
import 'layout/layout_todo.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter.dart';
import 'modules/advanced_massenger/massenger2.dart';
import 'modules/basic_massenger/massenger_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout() ,
    );
  }
}




