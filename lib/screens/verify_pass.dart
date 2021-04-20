import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amoc/screens/sigiin.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class verifypage extends StatelessWidget {
  verifypage(this.email, this.pass, this.username);
  final String email;
  final String pass;
  final String username;
  //String otp;
  final firestoreInstance = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _Controller1 = TextEditingController();
  final TextEditingController _Controller2 = TextEditingController();
  final TextEditingController _Controller3 = TextEditingController();
  final TextEditingController _Controller4 = TextEditingController();
  final TextEditingController _Controller5 = TextEditingController();
  final TextEditingController _Controller6 = TextEditingController();
  final FocusNode FocusNode1 = FocusNode();
  final FocusNode FocusNode2 = FocusNode();
  final FocusNode FocusNode3 = FocusNode();
  final FocusNode FocusNode4 = FocusNode();
  final FocusNode FocusNode5 = FocusNode();
  final FocusNode FocusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: 411 * Width / 411,
          height: 731 * Height / 731,
          color: Color(0xff5fb1df),
          padding: EdgeInsets.only(
            bottom: 9 * Height / 731,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
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
                        top: 285 * Height / 731,
                        left: 40 * Width / 411,
                        child: Container(
                          height: 25 * Height / 731,
                          width: 370 * Width / 411,
                          child: Row(
                            children: [
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  //maxLength: 1,
                                  controller: _Controller1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode1,
                                  onChanged: (_) {
                                    if (_Controller1.text.length == 1) {
                                      if (FocusNode2 != null)
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode2);
                                    }
                                  },
                                  onFieldSubmitted: (_) {
                                    if (FocusNode2 != null)
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode2);
                                  },
                                  // Only numbers can be entered
                                ),
                              ),
                              SizedBox(
                                width: Width * 11 / 411,
                              ),
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  controller: _Controller2,
                                  // maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode2,
                                  onChanged: (_) {
                                    if (_Controller2.text.length == 1) {
                                      if (FocusNode3 != null)
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode3);
                                    }
                                  },
                                  onFieldSubmitted: (_) {
                                    if (FocusNode3 != null)
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode3);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: Width * 11 / 411,
                              ),
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  controller: _Controller3,
                                  // maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode3,
                                  onChanged: (_) {
                                    if (_Controller3.text.length == 1) {
                                      if (FocusNode4 != null)
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode4);
                                    }
                                  },
                                  onFieldSubmitted: (_) {
                                    if (FocusNode4 != null)
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode4);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: Width * 11 / 411,
                              ),
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  controller: _Controller4,
                                  // maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode4,
                                  onChanged: (_) {
                                    if (_Controller4.text.length == 1) {
                                      if (FocusNode5 != null)
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode5);
                                    }
                                  },
                                  onFieldSubmitted: (_) {
                                    if (FocusNode5 != null)
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode5);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: Width * 11 / 411,
                              ),
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  controller: _Controller5,
                                  // maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode5,
                                  onChanged: (_) {
                                    if (_Controller5.text.length == 1) {
                                      if (FocusNode6 != null)
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode6);
                                    }
                                  },
                                  onFieldSubmitted: (_) {
                                    if (FocusNode6 != null)
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode6);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: Width * 11 / 411,
                              ),
                              Container(
                                width: 40 * Width / 411,
                                child: TextFormField(
                                  controller: _Controller6,
                                  //maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                    LengthLimitingTextInputFormatter(1),
                                  ],
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  focusNode: FocusNode6,
                                  // onChanged:  (_) {
                                  //   if (_Controller1.text.length == 1) {
                                  //     if (FocusNode3 != null)
                                  //       FocusScope.of(context).requestFocus(FocusNode3);
                                  //   }
                                  // },
                                ),
                              ),
                              //SizedBox(width: Width*11/411,),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 14 * Width / 411,
                      //   top: 14 * Height / 731,
                      //   child: Container(
                      //     width: 46 * Width / 411,
                      //     height: 38 * Height / 731,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: FlutterLogo(size: 38),
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 256 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 305 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 101 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 155 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      // Positioned(
                      //   left: 207 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      Positioned(
                        left: 37 * Width / 411,
                        top: 202 * Height / 731,
                        child: Text(
                          "Please check your email, we have sent a\nverification code to xyz@gmail.com",
                          style: TextStyle(
                            color: Color(0x99000000),
                            fontSize: 18 * Width / 411,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 37 * Width / 411,
                        top: 108 * Height / 731,
                        child: Container(
                          width: 299 * Width / 411,
                          height: 78 * Height / 731,
                          child: Text(
                            "Verify your email address",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28 * Width / 411,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 50 * Width / 411,
                      //   top: 346 * Height / 731,
                      //   child: Container(
                      //     width: 40 * Width / 411,
                      //     height: 1 * Height / 731,
                      //   ),
                      // ),
                      Positioned(
                        left: 37 * Width / 411,
                        top: 394 * Height / 731,
                        child: Container(
                          child: Text(
                            "Didn’t recieve any code? Resend Code",
                            style: TextStyle(
                              fontSize: 14 * Width / 411,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 76 * Width / 411,
                        top: 436 * Height / 731,
                        child: Container(
                          width: 243 * Width / 411,
                          height: 35 * Height / 731,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff5fb1df),
                          ),
                          child: FlatButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                String otp = _Controller1.text +
                                    _Controller2.text +
                                    _Controller3.text +
                                    _Controller4.text +
                                    _Controller5.text +
                                    _Controller6.text;
                                bool a = await verifyotp(email, otp);
                                if (a) {
                                  print(a);
                                  // if (_formKey.currentState.validate()) {
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .register(email, pass)
                                      .then((result) {
                                    print(result);
                                    if (result == null)
                                      print("error");
                                    else {
                                      var firebaseUser =
                                          FirebaseAuth.instance.currentUser;
                                      print(firebaseUser.uid);
                                      firestoreInstance
                                          .collection("USERS")
                                          .doc(result)
                                          .set({
                                        "Username": username,
                                        "email": result,
                                        "password": pass,
                                       // "Basic Info":{}
                                      }).then((_) {
                                        print("data instered success!");
                                      });
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Dashboard(
                                                email: result, check: false);
                                          },
                                        ),
                                      );
                                    }
                                  });
                                  // }
                                }
                              }
                            },
                            child: Text(
                              "Verify Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   left: 139 * Width / 411,
                      //   top: 442 * Height / 731,
                      //   child: Text(
                      //     "Verify Code",
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 69 * Height / 731),
              // Transform.rotate(
              //   angle: 1.57,
              //   child: Container(
              //     width: 35 * Width / 411,
              //     height: 1 * Height / 731,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
