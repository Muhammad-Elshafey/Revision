import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool onSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key:formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                        'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: emailController,
                      label: 'Email Address',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Email must not be empty';
                        }

                        return null;
                      },

                    ),
                      SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      label: 'Password',
                      onSecure: onSecure,
                      prefix: Icons.visibility,
                      type: TextInputType.visiblePassword,
                      suffix: onSecure? Icons.visibility:Icons.visibility_off,
                      showPass: (){
                        setState(() {
                          onSecure = !onSecure;
                        });
                      },
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Password must not be empty';
                        }

                        return null;
                      },

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      radius: 10.0,
                      text: 'login',
                      function: (){
                        if(formKey.currentState!.validate()){
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                       Text('Don\'t have an account?'),
                       TextButton(
                         onPressed: (){},
                         child: Text('Register Now'),
                       )
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ),
        ) ,
      );
  }
}
