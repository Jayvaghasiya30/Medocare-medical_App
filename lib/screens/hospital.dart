//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:amoc/screens/appoint.dart';
import 'package:amoc/screens/Diseaseinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/screens/hospital_info.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  var hospital = [];
  void initState() {
    //read(widget.disname);
    //readinfos();
    readinfoss();
  }

  void readinfoss() {
    //Set<String> specials = {};
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Hospitals").get().then((querysnapshot) {
      querysnapshot.docs.forEach((element) {
        if (element != null) {
          setState(() {
            hospital.add(element.data()["name"]);
          });
        }
      });
      //print(specials);
    });
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Top Hospitals',
          style: TextStyle(color: Colors.black),
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
      ),
      body: SafeArea(
        child: Container(
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
                    child: GridView.count(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      // padding: EdgeInsets.only(bottom: 30,left: 30),
                      crossAxisCount: 2,
                      children: [
                        ...hospital.map(
                          (i) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 20)),
                              diseaseContainer(
                                width: 120,
                                height: 110,
                                mssg: i,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // ListView(
                    //   children: [
                    //     Padding(padding: EdgeInsets.only(top: 20)),
                    //     ...Diss.map(
                    //       (i) => Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           diseaseContainer(i),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    //   // children: [
                    //   //   // TextField(
                    //   //   //   decoration: InputDecoration(
                    //   //   //     border:
                    //   //   //   ),),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   //   diseaseContainer(),
                    //   // ],
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class diseaseContainer extends StatelessWidget {
  diseaseContainer({this.mssg, this.width, this.height});
  final String mssg;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Container(
      margin: EdgeInsets.only(
          left: 25 * Width, right: 20 * Width, bottom: 25 * Height),
      width: width * Width,
      height: height * Height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Color(0xffb9f6fc),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return HospitalInfo(
                  hospitalname: mssg,
                );
              },
            ),
          );
        },
        child: Center(
          child: Text(
            mssg,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
