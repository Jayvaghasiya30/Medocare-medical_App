import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 411,
        height: 731,
        color: Color(0xff5fb1df),
        child: Stack(
          children:[
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 317,
                  height: 731,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(40), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff70ddde), Color(0x0070ddde)], ),
                  ),
                  child: Stack(
                    children:[
                      Positioned(
                        left: 260,
                        top: 14,
                        child: Container(
                          width: 41,
                          height: 51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 41),
                        ),
                      ),
                      Positioned(
                        left: 112,
                        top: 17,
                        child: SizedBox(
                          width: 101,
                          height: 64,
                          child: Text(
                            "USERNAME\nLOCATION",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 18,
                        child: Container(
                          width: 46,
                          height: 43,
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 42.17,
                                height: 39.42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 39.416664123535156),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 440,
                        child: SizedBox(
                          width: 95,
                          height: 35,
                          child: Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 494,
                        child: SizedBox(
                          width: 121,
                          height: 35,
                          child: Text(
                            "About Us",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 220,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Manage Lab Reports",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 58,
                        top: 282,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Get Tested",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 58,
                        top: 333,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Invoices",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 58,
                        top: 387,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Bookmarks",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 160,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Buy Medicines",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 103,
                        child: SizedBox(
                          width: 246,
                          height: 35,
                          child: Text(
                            "Consult Now!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 438,
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
                        left: 19,
                        top: 220,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 30),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 105,
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
                        left: 19,
                        top: 162,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 30),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 491,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 30),
                        ),
                      ),
                      Positioned(
                        left: 19,
                        top: 277,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 30),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 333,
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
                        left: 17,
                        top: 386,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 81,
              child: Container(
                width: 317.01,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
