import 'package:flutter/material.dart';

class forgotpasspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 411,
        height: 731,
        color: Color(0xff5fb1df),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 411,
              height: 637,
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
              padding: const EdgeInsets.only(
                left: 14,
                right: 43,
                top: 14,
                bottom: 42,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 46,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterLogo(size: 38),
                  ),
                  SizedBox(height: 12.17),
                  SizedBox(
                    width: 180,
                    height: 24,
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.17),
                  Container(
                    width: 285,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.17),

                  SizedBox(height: 12.17),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12.17),
                  Container(
                    width: 285,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12.17),

                  SizedBox(height: 12.17),
                  Container(
                    width: 243,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff5fb1df),
                    ),
                  ),
                  SizedBox(height: 12.17),

                  SizedBox(height: 12.17),
                  Text(
                    "Enter verification code sent to your email",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),



                  SizedBox(height: 12.17),
                  Text(
                    "Didn’t recieve any code? Resend Code",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 12.17),
                  Container(
                    width: 243,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff5fb1df),
                    ),
                  ),
                  SizedBox(height: 12.17),

                ],
              ),
            ),
            SizedBox(width: 27),
            Container(
              width: 365,
              height: 578,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Color(0xffb9f6fc),
              ),
            ),
            SizedBox(width: 27),
            Transform.rotate(
              angle: 1.57,
              child: Container(
                width: 35,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
