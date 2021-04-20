import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:amoc/screens/Finalappoint.dart';

var Deccrep =[];
var docname = [];
var date = [];
var time = [];
var dis = [];
class AppointRecords extends StatefulWidget {
  @override
  _AppointRecordsState createState() => _AppointRecordsState();
}



class _AppointRecordsState extends State<AppointRecords> {

  void initState() {
    //read(widget.disname);
   // readinfos();
    // readinfoss();
  }



  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Scaffold(
      body:   Recod(),
    );
  }
}

class Recod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Container(
      width: 411 * Width,
      height: 731 * Height,
      color: Color(0xff5fb1df),
      padding: EdgeInsets.only(
        bottom: 34,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 411 * Width,
            height: 700 * Height,
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
            child: ListView.builder(
                itemCount: dis.length,
                itemBuilder: (context, index) {
                  return Column(

                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      AppointContainer(id: index,)
                    ],
                  );
                }

            ),
          ),
        ],
      ),
      // ),
    );
  }
}

class AppointContainer extends StatelessWidget {
  AppointContainer({this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Container(
      margin: EdgeInsets.only(
          left: 25 * Width, right: 20 * Width, bottom: 25 * Height),
      width: 320 * Width,
      height: 180 * Height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doctor : "+docname[id].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  "Description : "+Deccrep[id].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  "Diseases : "+dis[id].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  "Date : "+date[id].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  "Time : "+time[id].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          //Padding(padding: EdgeInsets.only(top: 100,left: 20),),

        ],
      ),

      // ),
    );
  }
}
