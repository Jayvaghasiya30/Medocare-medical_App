import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 411,
        height: 731,
        color: Color(0xff5fb1df),
        padding: const EdgeInsets.only(bottom: 94, ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Container(
              width: 411,
              height: 637,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(0), bottomLeft: Radius.circular(500), bottomRight: Radius.circular(0), ),
                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0xff71e1de), Color(0x0071e1de)], ),
              ),
              child: Stack(
                children:[
                  Positioned(
                    left: 12,
                    top: 14,
                    child: Container(
                      width: 46,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 38),
                    ),
                  ),
                  Positioned(
                    left: 54,
                    top: 45,
                    child: SizedBox(
                      width: 298,
                      height: 53,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 207,
                    child: Container(
                      width: 365,
                      height: 414,
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
                  ),
                  Positioned(
                    left: 43,
                    top: 225,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 135,
                    top: 104.42,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FlutterLogo(size: 140),
                    ),
                  ),
                  Positioned(
                    left: 106,
                    top: 273,
                    child: SizedBox(
                      width: 195,
                      height: 21,
                      child: Text(
                        "@user_name or @email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x70000000),
                          fontSize: 14,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 106,
                    top: 252,
                    child: SizedBox(
                      width: 195,
                      height: 21,
                      child: Text(
                        "Full Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 306,
                    child: Container(
                      width: 365,
                      height: 1,
                    ),
                  ),
                  Positioned(
                    left: 337,
                    top: 225,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
