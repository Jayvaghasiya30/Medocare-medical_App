import 'package:flutter/material.dart';
import 'signup.dart';
import 'forgotpass.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/Dashboard/Dashmain.dart';

class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 411,
        height: 731,
        color: Color(0xff5fb1df),
        padding: const EdgeInsets.only(
          bottom: 79,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 411,
              height: 652,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff71e1de), Color(0x0071e1de)],
                ),
              ),
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Positioned(
                      left: 84,
                      top: 539,
                      child: Container(
                        width: 243,
                        height: 51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: Color(0xffb9f6fc),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 233,
                      top: 540,
                      child: FlatButton(
                        onPressed: () {
                          //right way: use context in below level tree with MaterialApp
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Signup()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 63,
                      top: 97,
                      child: Container(
                        width: 285,
                        height: 443,
                        decoration: boxDecoration(Color(0xffb9f6fc)),
                      ),
                    ),
                    Positioned(
                      left: 84,
                      top: 273,
                      child: Container(
                        width: 243,
                        height: 35,
                        decoration: boxDecoration(Colors.white),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: inputdecor("Enter Password"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 174,
                      top: 138,
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 84,
                      top: 202,
                      child: Container(
                        width: 243,
                        height: 35,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: inputdecor("Enter Email"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        decoration: boxDecoration(Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 84,
                      top: 402,
                      child: Container(
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await Provider.of<Auth>(context, listen: false).signInWithEmailAndPassword(_emailController.text,_passwordController.text)
                                  .then((result) {
                                print(result);
                                if(result==null)
                                  print("error");
                                else{
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Dashboard();
                                      },
                                    ),
                                  );
                                }
                              });
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        width: 243,
                        height: 31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff5fb1df),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 84,
                      top: 450,
                      child: Container(
                        width: 243,
                        height: 31,
                        child: FlatButton(
                          onPressed: () async {
                            await Provider.of<Auth>(context, listen: false)
                                .signInWithGoogle()
                                .then((result) {
                              print(result);
                              if(result==null)
                                print("error");
                              else{
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard();
                                    },
                                  ),
                                );
                              }
                            });
                          },
                          child: Text(
                            'Sign in with Google+',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff5fb1df),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95,
                      top: 560,
                      child: Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Color(0x56000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 225,
                      top: 326,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgotpasspage()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xce000000),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
