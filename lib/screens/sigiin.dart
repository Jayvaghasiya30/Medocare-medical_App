import 'package:flutter/material.dart';
import 'signup.dart';
import 'forgotpass.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
import 'package:amoc/screens/sidebar.dart';

class SignIn extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool chek = false;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: Width,
        height: Height,
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
              width: Width,
              height: 652 * Height / 731,
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
                      left: 84 * Width / 411,
                      top: 539 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 51 * Height / 731,
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
                      left: 233 * Width / 411,
                      top: 540 * Height / 731,
                      child: FlatButton(
                        onPressed: () {
                          //right way: use context in below level tree with MaterialApp
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
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
                      left: 63 * Width / 411,
                      top: 97 * Height / 731,
                      child: Container(
                        width: 285 * Width / 411,
                        height: 443 * Height / 731,
                        decoration: boxDecoration(Color(0xffb9f6fc)),
                      ),
                    ),
                    Positioned(
                      left: 84 * Width / 411,
                      top: 273 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 35 * Height / 731,
                        decoration: boxDecoration(Colors.white),
                        child: TextFormField(
                          obscuringCharacter: '*',
                          obscureText: true,
                          controller: _passwordController,
                          decoration: inputdecor("Enter Password"),
                          validator: (String value) {
                            if (value.length < 6) {
                              return 'Please enter atlaest 6 character';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 174 * Width / 411,
                      top: 138 * Height / 731,
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 84 * Width / 411,
                      top: 202 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 35,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: inputdecor("Enter Email"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(_emailController.text)) {
                              return 'Please Enter valid email';
                            }

                            return null;
                          },
                        ),
                        decoration: boxDecoration(Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 84 * Width / 411,
                      top: 402 * Height / 731,
                      child: Container(
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await Provider.of<Auth>(context, listen: false)
                                  .signInWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text)
                                  .then((result) {
                                print(result);
                                if (result == null)
                                  print("error");
                                else if (result ==
                                    'no user found for that email') {
                                  print('no user found for that email');
                                  //add dialog box for this
                                } else if (result ==
                                    'wrong password for that user') {
                                  //add dialog box for this message
                                  print('wrong password for that user');
                                } else {
                                  chek = false;
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Dashboard(
                                          email: result,
                                          check: chek,
                                        );
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
                        width: 243 * Width / 411,
                        height: 31 * Height / 731,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff5fb1df),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 84 * Width / 411,
                      top: 450 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 31 * Height / 731,
                        child: TextButton(
                          onPressed: () async {
                            await Provider.of<Auth>(context, listen: false)
                                .signInWithGoogle()
                                .then((result) {
                              print(result);
                              if (result == null)
                                print("error");
                              else {
                                chek = true;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Dashboard(
                                        email: result,
                                        check: chek,
                                      );
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
                      left: 95 * Width / 411,
                      top: 560 * Height / 731,
                      child: Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          color: Color(0x56000000),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 225 * Width / 411,
                      top: 326 * Height / 731,
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
