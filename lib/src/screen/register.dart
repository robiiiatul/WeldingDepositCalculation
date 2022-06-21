import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nov/src/screen/home.dart';
import 'package:nov/src/screen/login.dart';
import 'package:nov/themes.dart';

import 'auth.dart';
//import 'package:nov/widget/primary_button.dart';
//import 'package:nov/widget/custom_checkbox.dart';
//import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Widget suffixIcon;
    return Scaffold(
      backgroundColor: Colors.white,
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
                    '\r\r\rLets Register Account\n',
                    style: heading2.copyWith(color: textBlack),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
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
            height: 22,
          ),
          Form(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: const EdgeInsets.all(10),
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
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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

                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 2000,
                  height: 45,
                  margin: EdgeInsets.all(10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _signUp(_email, _password),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('\n\n\n\nAlready  have an account ? Login  '),
                // onPressed: () => Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => ResetScreen())),
              )
            ],
          )
        ],
      ),
    );
  }

  _signUp(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => VerifyScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
          msg: error.message.toString(), gravity: ToastGravity.TOP);
    }
  }
}
