import 'package:flutter/material.dart';
//import 'package:amoc/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

//Crud crudObj = Crud();

class Treatment extends StatefulWidget {
  Treatment({this.disname});
  final disname;
//  Map<dynamic, dynamic>
  var overviewData;
  var first = [];
  var second = [];
  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  @override
  initState() {
    // getdata();
    read(widget.disname);
  }

  // void getdata() async {
  //   await crudObj.GetDiseaseOverview();
  // }
  void read(em) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("info_disease").doc(em).get().then((value) {
      //print(value.data());
      print(value.data()["Treatments"]);
      setState(() {
        widget.overviewData = value.data()["Treatments"];
        for (MapEntry e in widget.overviewData.entries) {
          //print("Key ${e.key}, Value ${e.value}");
          widget.first.add(e.key);
          widget.second.add(e.value);
        }
        //overviewData = overviewData +
        //"hjhslgrs gshglksrg hh giowherg htioghw thow hghuhghogh 0ghoir hgi ih ihgiohgirhghiorhgio hiohri ghriogh oiri hgroghioh gdr hd hdh thth gh dghdgj dgn dgjfgj dgn dghj dgth dg tdj dg dg g jg fn gdn g j j dg ndg j dg dg n gd j dtj dg jd g  j gj d  g j tr jd g dg n dgj  j rt j gf ng f fjg j j  f j fg nfg j f j yj f gn jgfn";
      });
      print(widget.overviewData["Medications"]);
      print(widget.overviewData.length);
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
              //child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
                child:
                    //ListView(
                    ListView.builder(
                        itemCount: widget.first.length,
                        itemBuilder: (context, index) {
                          return Roww(
                            mssg: widget.first[index],
                            mssg1: widget.second[index],
                          );
                        }
                        //children: [
                        // for (int i = 0; i < widget.overviewData.length; i++)
                        //   {
                        //     Roww(widget.overviewData[i]),
                        //   }
                        // widget.overviewData.map.ForEach(key,value)
                        //    => Roww(
                        //     mssg: {key, value},
                        //   ),
                        //),

                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        // Roww(),
                        //],
                        ),
              ),
            ),
            //  ),
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
                onPressed: () {},
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

class Roww extends StatelessWidget {
  Roww({this.mssg, this.mssg1});
  // final double width;
  // final double height;
  final mssg;
  final mssg1;
  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        // padding: EdgeInsets.all(10),
        // child:
        Card(
      child: ListTile(
        // leading: Container(
        //   height: 10.0,
        //   width: 10.0,
        //   child: Text(mssg),
        //   // decoration: BoxDecoration(
        //   //   color: Colors.black,
        //   //   shape: BoxShape.circle,
        //   // ),
        // ),
        title: Text(mssg),
        trailing: Text(mssg1),
      ),
    );
    //     Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         width: 20,
    //       ),
    //       Container(
    //         height: 20.0,
    //         width: 20.0,
    //         decoration: BoxDecoration(
    //           color: Colors.black,
    //           shape: BoxShape.circle,
    //         ),
    //       ),
    //       SizedBox(
    //         width: 20,
    //       ),
    //       Text(
    //         "jhfjhy kgui hbouy uyo l",
    //         style: TextStyle(
    //           fontSize: 20,
    //           color: Colors.black,
    //         ),
    //       )
    //     ],
    //     //),
    //   ),
    // );
  }
}
