import 'package:flutter/material.dart';

class VerifyPass extends StatelessWidget {
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
                              child: TextField(),
                            ),
                            SizedBox(
                              width: Width * 11 / 411,
                            ),
                            Container(
                              width: 40 * Width / 411,
                              child: TextField(),
                            ),
                            SizedBox(
                              width: Width * 11 / 411,
                            ),
                            Container(
                              width: 40 * Width / 411,
                              child: TextField(),
                            ),
                            SizedBox(
                              width: Width * 11 / 411,
                            ),
                            Container(
                              width: 40 * Width / 411,
                              child: TextField(),
                            ),
                            SizedBox(
                              width: Width * 11 / 411,
                            ),
                            Container(
                              width: 40 * Width / 411,
                              child: TextField(),
                            ),
                            SizedBox(
                              width: Width * 11 / 411,
                            ),
                            Container(
                              width: 40 * Width / 411,
                              child: TextField(),
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
                        child: Center(
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
