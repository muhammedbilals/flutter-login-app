import 'package:flutter/material.dart';
import 'package:flutter_login/main.dart';
import 'package:flutter_login/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined),
                      border: OutlineInputBorder(), hintText: 'Username'),
                  validator: (value) {
                    // if (_isdataMatched) {
                    //   return null;
                    // } else {
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'username is empty';
                    } else if (value != 'user') {
                      return 'Wrong username';
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
                      prefixIcon: Icon(Icons.password_rounded),
                      border: OutlineInputBorder(),
                       hintText: 'password'),
                  validator: (value) {
                    // if (_isdataMatched) {
                    //   return null;
                    // } else {
                    //   return 'ERROR';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'password is empty';
                    } else if (value != 'password') {
                      return 'Wrong password';
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !_isdataMatched,
                      child: Text(
                        'Username and password doesnot match',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 420,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                checklogin(context);
                              } else {
                                print('data empty');
                              }
                            },
                            child: Text('login')),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklogin(BuildContext ctx) async {
    final username = _usernamecontroller.text;
    final password = _passwordcontroller.text;

    if (username == 'user' && password == 'password') {
      // go to home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

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
