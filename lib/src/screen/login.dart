import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:nov/src/screen/register.dart';
import 'package:nov/src/screen/welding0.dart';
import 'package:nov/src/screen/welding1.dart';
import 'package:nov/themes.dart';

import 'auth.dart';
import 'home.dart';
import 'reset.dart';

//import 'package:google_sign_in_web/google_sign_in_web.dart';

//import 'package:nov/widget/primary_button.dart';
//import 'package:nov/widget/custom_checkbox.dart';
//import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  late User user;

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // final Widget suffixIcon;
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Column(
        children: [
          new Image.asset(
            'assets/images/logo.png',
            width: 600,
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'National Oilwell Varco\n',
            style: heading2.copyWith(color: textBlack),
          ),
          Form(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\r\r\rLets Sign you in\n',
                    style: heading2.copyWith(color: textBlack),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintStyle: heading6.copyWith(color: textGrey),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: !passwordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintStyle: heading6.copyWith(color: textGrey),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    suffixIcon: IconButton(
                      color: textGrey,
                      splashRadius: 1,
                      icon: Icon(passwordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: togglePassword,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextField(
          //     obscureText: true,
          //     decoration: InputDecoration(hintText: 'Password'),
          //     onChanged: (value) {
          //       setState(() {
          //         _password = value.trim();
          //       });
          //     },
          //   ),
          // ),
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text('Forgot password?'),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ResetScreen())),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 2000,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _signIn(_email, _password),
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                // RaisedButton(
                //     color: primaryBlue,
                //     child: Text('SignIn'),
                //     textColor: Colors.white,
                //     onPressed: () {
                //       auth.signInWithEmailAndPassword(
                //           email: _email, password: _password);
                //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                //           builder: (context) => HomeScreen()));
                //     }),
                // TextButton(
                //     style: TextButton.styleFrom(
                //         backgroundColor: Color.fromARGB(255, 0, 37, 250)),
                //     child: Text('SignUp'),
                //     onPressed: () {
                //       auth.createUserWithEmailAndPassword(
                //           email: _email, password: _password);
                //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                //           builder: (context) => HomeScreen()));
                //     }),

                // CustomPrimaryButton(
                //   buttonColor: colorLight,
                //   textValue: 'Login with Google',
                //   textColor: textBlack,
                // ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text('\n\n\n\nDon’t have an account ? Register Now'),
                // onPressed: () => Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => ResetScreen())),
              )
            ],
          )
        ],
      ),
    );
  }

  _signIn(String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      user = auth.currentUser!;
      if (user.emailVerified) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CalculatorScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => VerifyScreen()));
      }
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }
}
