import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:provider/provider.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
import 'package:amoc/screens/verify_pass.dart';

class Signup extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _username = TextEditingController();
  bool chek = false;

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: 411 * Width / 411,
        height: 731 * Height / 731,
        color: Color(0xff5fb1df),
        padding: EdgeInsets.only(
          bottom: 79 * Height / 731,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 411 * Width / 411,
              height: 652 * Height / 731,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(500 * Width / 411),
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
                      left: 43 * Width / 411,
                      top: 576 * Height / 731,
                      child: Container(
                        width: 320 * Width / 411,
                        height: 57 * Height / 731,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(20 * Width / 411),
                            bottomRight: Radius.circular(20 * Width / 411),
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
                      left: 246 * Width / 411,
                      top: 594 * Height / 731,
                      child: SizedBox(
                        width: 61 * Width / 411,
                        height: 25 * Height / 731,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20 * Width / 411,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 365 * Width / 411,
                          height: 498.71 * Height / 731,
                          decoration: boxDecoration(Color(0xffb9f6fc)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 63 * Width / 411,
                      top: 347 * Height / 731,
                      child: Container(
                        width: 285 * Width / 411,
                        height: 40 * Height / 731,
                        decoration: boxDecoration(Colors.white),
                        child: textbox("Confirm Password"),
                      ),
                    ),
                    Positioned(
                      left: 63 * Width / 411,
                      top: 286 * Height / 731,
                      child: Container(
                        width: 285 * Width / 411,
                        height: 40 * Height / 731,
                        decoration: boxDecoration(Colors.white),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: inputdecor("Enter Password"),
                          validator: (String value) {
                            if (value.length < 6) {
                              return 'Please enter atleast 6 character password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 63 * Width / 411,
                      top: 225 * Height / 731,
                      child: Container(
                        width: 285 * Width / 411,
                        height: 40 * Height / 731,
                        decoration: boxDecoration(Colors.white),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: inputdecor("Enter Email"),
                          enableSuggestions: true,
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
                      left: 168 * Width / 411,
                      top: 116 * Height / 731,
                      child: SizedBox(
                        width: 78 * Width / 411,
                        height: 24 * Height / 731,
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18 * Width / 411,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 63 * Width / 411,
                      top: 164 * Height / 731,
                      child: Container(
                        width: 285 * Width / 411,
                        height: 40 * Height / 731,
                        decoration: boxDecoration(Colors.white),
                        child: TextFormField(
                          controller: _username,
                          decoration: inputdecor("Enter Username"),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 85 * Width / 411,
                      top: 421 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 35 * Height / 731,
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await Provider.of<Auth>(context, listen: false)
                                  .alreadyemailpresent(_emailController.text,
                                      _passwordController.text)
                                  .then((result) async {
                                print(result);
                                if (result == true) {
                                  print('Email already exits');
                                } else {
                                  bool a = await sendOtp(_emailController.text);
                                  print(a);
                                  if (a) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return verifypage(
                                              _emailController.text,
                                              _passwordController.text,
                                              _username.text);
                                        },
                                      ),
                                    );
                                  }
                                }

                                //
                              });
                              //   await Provider.of<Auth>(context, listen: false).register(_emailController.text,_passwordController.text)
                              //       .then((result) {
                              //     print(result);
                              //     if(result==null)
                              //       print("error");
                              //     else{
                              //       Navigator.of(context).push(
                              //         MaterialPageRoute(
                              //           builder: (context) {
                              //             return Dashboard();
                              //           },
                              //         ),
                              //       );
                              //     }
                              //   });
                              // }
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18 * Width / 411,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * Width / 411),
                          color: Color(0xff5fb1df),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 85 * Width / 411,
                      top: 475 * Height / 731,
                      child: Container(
                        width: 243 * Width / 411,
                        height: 35 * Height / 731,
                        child: FlatButton(
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
                                      return Dashb(
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
                            "Sign Up with Google+",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18 * Width / 411,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * Width / 411),
                          color: Color(0xff5fb1df),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 76 * Width / 411,
                      top: 596 * Height / 731,
                      child: Container(
                        width: 165 * Width / 411,
                        height: 18 * Height / 731,
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Color(0x56000000),
                            fontSize: 14 * Width / 411,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 14 * Width / 411,
                      top: 14 * Height / 731,
                      child: Container(
                        width: 46 * Width / 411,
                        height: 38 * Height / 731,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            //await Provider.of<Auth>(context,listen: false).signOutGoogle();
                            await Provider.of<Auth>(context, listen: false)
                                .signOutemail();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10 * Width / 411,
                            ),
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
