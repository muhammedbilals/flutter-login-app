import 'package:flutter/material.dart';
import 'package:flutter_login/screens/home.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  bool _isdataMatched = true;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Username'),
                  validator: (value) {
                    // if (_isdataMatched) {
                    //   return null;
                    // } else {
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'password'),
                  validator: (value) {
                    // if (_isdataMatched) {
                    //   return null;
                    // } else {
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isdataMatched,
                      child: Text(
                        'Username and password doesnot match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checklogin(context);
                          } else {
                            print('data empty');
                          }
                        },
                        child: Text('login')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) {
    final username = _usernamecontroller.text;
    final password = _passwordcontroller.text;

    if (username == password) {
      // go to home
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      //show text
      setState(() {
        _isdataMatched = false;
      });
    }
  }
}
