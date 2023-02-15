import 'package:flutter/material.dart';

Widget defaultButton ({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
            radius,
        ),
      ),
      child: MaterialButton(
        onPressed: (){
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
//-------------------------------------------------------
Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? onSubmitted,
  Function? showPass,
  Function? onTaap,
  required Function validate,
  bool onSecure = false,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: onSecure,
  onTap: onTaap as void Function()?,
  onFieldSubmitted: onSubmitted as void Function(String)?,
  validator: validate as String? Function(String?)?,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null? IconButton(
      onPressed: () {
        showPass!();
      },
      icon: Icon(
        suffix,
      ),
    ):null,
    border: OutlineInputBorder(),

  ),
);