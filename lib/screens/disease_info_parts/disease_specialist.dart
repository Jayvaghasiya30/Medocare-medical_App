//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:amoc/screens/appoint.dart';
import 'package:amoc/screens/Diseaseinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/screens/specialist_info.dart';

class DiseaseSpecialist extends StatefulWidget {
  var specials = [];
  DiseaseSpecialist({this.disname});
  final disname;
  @override
  _DiseaseSpecialistState createState() => _DiseaseSpecialistState();
}

class _DiseaseSpecialistState extends State<DiseaseSpecialist> {
  void initState() {
    //read(widget.disname);
    //readinfos();
    readinfoss();
  }

  void readinfoss() {
    //Set<String> specials = {};
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection("info_disease")
        .doc(widget.disname)
        .get()
        .then((querysnapshot) {
      setState(() {
        widget.specials = querysnapshot.data()["Specialists"];
        //print(widget.specials.length);
        if (widget.specials == null)
          widget.specials = querysnapshot.data()["Specialist"];
        if (widget.specials == null)
          widget.specials = querysnapshot.data()["Speciallist"];
        // for(i=0;i<specials.length;i++)
        //   specialss.add(specials[i]);
      });
    });
    // });
    //print(specials);
    //});
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return
        // Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       )),
        //   title: Text(
        //     'Specilaist',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // body: SafeArea(
        //   child:
        Container(
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
                    ...widget.specials.map(
                      (i) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          diseaseContainer(
                            // width: 120,
                            // height: 110,
                            mssg: i,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // child: ListView(
                //   children: [
                //     Padding(padding: EdgeInsets.only(top: 20)),
                //     ...specials.map(
                //       (i) => Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           diseaseContainer(mssg: i),
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
          // ),
        ],
      ),
      // ),
      // ),
    );
  }
}

class diseaseContainer extends StatelessWidget {
  diseaseContainer({this.mssg});
  final String mssg;
  // final double width;
  // final double height;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Container(
      margin: EdgeInsets.only(
          left: 25 * Width, right: 20 * Width, bottom: 10 * Height),
      width: 140 * Width,
      height: 110 * Height,
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
                return SpecilaistInfo(
                  disname: mssg,
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
