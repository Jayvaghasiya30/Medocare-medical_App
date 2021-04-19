import 'package:flutter/material.dart';
//import 'package:amoc/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:amoc/screens/appoint.dart';

//Crud crudObj = Crud();

class Overview extends StatefulWidget {
  Overview({this.disname});
  final String disname;
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  initState() {
    // getdata();
    read(widget.disname);
  }

  String overviewData = " ";

  // void getdata() async {
  //   await crudObj.GetDiseaseOverview();
  // }
  void read(em) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("info_disease").doc(em).get().then((value) {
      //print(value.data());
      print(value.data()["Overview"]);
      setState(() {
        overviewData = value.data()["Overview"];
        overviewData = overviewData +
            "hjhslgrs gshglksrg hh giowherg htioghw thow hghuhghogh 0ghoir hgi ih ihgiohgirhghiorhgio hiohri ghriogh oiri hgroghioh gdr hd hdh thth gh dghdgj dgn dgjfgj dgn dghj dgth dg tdj dg dg g jg fn gdn g j j dg ndg j dg dg n gd j dtj dg jd g  j gj d  g j tr jd g dg n dgj  j rt j gf ng f fjg j j  f j fg nfg j f j yj f gn jgfn";
      });
    });
  }

  // @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
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
            top: 40 * Height,
            bottom: 120 * Height,
            right: 40 * Width,
            left: 40 * Width,
            //width: 368 * Width,
            //height: 280 * Height,
            child: Container(
              // width: 368 * Width,
              // height: 300 * Height,
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
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 30),
                    child: Text(
                      overviewData,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
          ),
          Positioned(
            top: 525 * Height,
            right: 40 * Width,
            left: 40 * Width,
            child: Container(
              height: 58,
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
                        return Appoint(disname: widget.disname);
                      },
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    "Make an Appointment now!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
