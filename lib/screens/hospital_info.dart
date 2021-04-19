import 'package:amoc/screens/hospital_info_parts/hospital_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:amoc/screens/disease_info_parts/overview.dart';
import 'package:amoc/screens/disease_info_parts/symptoms.dart';
import 'package:amoc/screens/disease_info_parts/treatment.dart';
import 'package:amoc/screens/specialist_info_parts/doctors_spec.dart';

class HospitalInfo extends StatelessWidget {
  HospitalInfo({this.hospitalname});
  final String hospitalname;
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
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            title: Text(
              hospitalname,
              //if(disname==null){}
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
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
                      'Doctors',
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
              Overview(
                disname: "Asthma",
                //disname,
              ),
              HospitalDoctors(
                hospitalname: hospitalname,
              )
            ],
          )),
    );
    //],
    // );
  }
}

// class Overview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double Width = MediaQuery.of(context).size.width;
//     double Height = MediaQuery.of(context).size.height;
//     return Container(
//       width: 411 * Width,
//       height: 731 * Height,
//       color: Color(0xff5fb1df),
//       child: Container(
//         width: 411 * Width,
//         height: 637 * Height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(0),
//             topRight: Radius.circular(0),
//             bottomLeft: Radius.circular(500),
//             bottomRight: Radius.circular(0),
//           ),
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [Color(0xff71e1de), Color(0x0071e1de)],
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 30 * Height),
//             ),
//             Container(
//               width: 340 * Width,
//               height: 420 * Height,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0x3f000000),
//                     blurRadius: 4,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//                 color: Color(0xffb9f6fc),
//               ),
//               child: Text('jhefgkj'),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 30),
//             ),
//             Container(
//               width: 200 * Width,
//               height: 40,
//               child: TextButton(
//                 child: Center(
//                   child: Text(
//                     'Consult Now!',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontFamily: "Raleway",
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30), color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
