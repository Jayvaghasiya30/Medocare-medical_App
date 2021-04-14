import 'package:flutter/material.dart';

class DiseaseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    double _safeAreaHorizontal = MediaQuery.of(context).padding.left +
        MediaQuery.of(context).padding.right;
    double _safeAreaVertical = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double b = (Width - _safeAreaHorizontal) / 100;
    double v = (Height - _safeAreaVertical) / 100;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            title: Text(
              "Disease Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(0),
                //   topRight: Radius.circular(0),
                //   bottomLeft: Radius.circular(20 * Width / 411),
                //   bottomRight: Radius.circular(20 * Width / 411),
                //),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff71e1de), Color(0x0071e1de)],
                ),
              ),
            ),
            bottom: TabBar(
                indicatorWeight: v * 0.66,
                indicatorColor: Color(0xff005F94),
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                labelColor: Color(0xff005F94),
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                //Color(0xff858A8F),
                tabs: [
                  Tab(
                    child: Text(
                      'Overview',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: b * 4.8,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Symptoms',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: b * 4.8,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Treatment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: b * 4.8,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Specialist',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: b * 4.8,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]),
          ),
          //backgroundColor: Colors.lightBlueAccent,
          //),
          body: TabBarView(
            children: [
              Overview(),
              Overview(),
              Overview(),
              Overview(),
            ],
          )),
    );
    //],
    // );
  }
}

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Container(
      width: 411 * Width,
      height: 731 * Height,
      color: Color(0xff5fb1df),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 411 * Width,
                height: 637 * Height,
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
              ),
            ),
          ),
          Positioned(
            top: 70,
            bottom: 60,
            right: 40,
            left: 40,
            child: Container(
              width: 368 * Width,
              height: 374 * Height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Color(0xffb9f6fc),
              ),
              child: Text('jhefgkj'),
            ),
          ),
        ],
      ),
    );
  }
}
