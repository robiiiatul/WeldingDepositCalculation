import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:nov/src/screen/register.dart';
import 'package:nov/themes.dart';

import 'auth.dart';

//import 'package:google_sign_in_web/google_sign_in_web.dart';

//import 'package:nov/widget/primary_button.dart';
//import 'package:nov/widget/custom_checkbox.dart';
//import 'package:flutter/cupertino.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}


class _ResetScreenState extends State<ResetScreen> {
  bool passwordVisible = false;
  late String _email;
  final auth = FirebaseAuth.instance;

  

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
              Container(
                decoration: BoxDecoration(
                    color: textWhiteGrey,
                    borderRadius: BorderRadius.circular(14)),
                margin: EdgeInsets.all(10),
                
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'E-mail',
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
                  height: 2,
                ),
                Container(
                  width: 2000,
                  height: 45,
                  margin: EdgeInsets.all(15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                     auth.sendPasswordResetEmail(email: _email);
                     Navigator.of(context).pop();
                    },
                    child: Text(
                      "Send Request",
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
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
         
          
        ],
        

      ),
    );
  }

  
  

  
}


