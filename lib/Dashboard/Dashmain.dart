import 'package:flutter/material.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/screens/sigiin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/screens/drawer.dart';


class Dashboard extends StatefulWidget {
  Dashboard({this.email, this.check});
  final email;
  final check;
  final Diseases = [
    'Asthma',
    'Common Flu',
    'Conjunctivitis',
    'Depression',
    'Diarrhoea',
    'See all \n Dieaases',
  ];
  final Secialist = ['Pediatrician', 'Neurologist', 'See all\nCategories'];
  final LabATests = [
    'MRI',
    'CT SCAN',
    'ECG',
    'X-Ray',
    'THYROID',
    'See all \n Tests'
  ];
  final Hospitals = ['ABC', 'XYZ', 'See all Top\n Hospitals'];

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    read(widget.email);
    readinfos();
  }

  void read(em) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("USERS").doc(em).get().then((value) {
      print(value.data());
    });
  }

  void readinfos() {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("info_disease").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        //print(result.data());
        widget.Diseases.add(result.id.toString());
        print(widget.Diseases);
      });
    });
  }

  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Username \n Location",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(20 * Width / 411),
              bottomRight: Radius.circular(20 * Width / 411),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xff71e1de), Color(0x0071e1de)],
            ),
          ),
        ),
        backgroundColor: Color(0xff5eb0df),
      ),
      drawer: Sidebar(),
      body: Container(
        width: 411 * Width / 411,
        height: 731 * Height / 411,
        color: Color(0xff5eb0df),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: SizedBox(
                            width: 215,
                            height: 29,
                            child: Text(
                              "Common Dieases",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: GridView.count(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // padding: EdgeInsets.only(bottom: 30,left: 30),
                            crossAxisCount: 3,
                            children: [
                              ...widget.Diseases.map(
                                    (i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Smallboxes(
                                      width: 55,
                                      height: 55,
                                      mssg: i,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: SizedBox(
                            width: 215,
                            height: 29,
                            child: Text(
                              "Top Specialists",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: GridView.count(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // padding: EdgeInsets.only(bottom: 30,left: 30),
                            crossAxisCount: 3,
                            children: [
                              ...widget.Secialist.map(
                                    (i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Smallboxes(
                                      width: 55,
                                      height: 55,
                                      mssg: i,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            "Make a Lab Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: GridView.count(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // padding: EdgeInsets.only(bottom: 30,left: 30),
                            crossAxisCount: 3,
                            children: [
                              ...widget.LabATests.map(
                                    (i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Smallboxes(
                                      width: 55,
                                      height: 55,
                                      mssg: i,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            "Top Hospitals",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: GridView.count(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // padding: EdgeInsets.only(bottom: 30,left: 30),
                            crossAxisCount: 3,
                            children: [
                              ...widget.Hospitals.map(
                                    (i) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Smallboxes(
                                      width: 55,
                                      height: 55,
                                      mssg: i,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            "Health Feed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20, top: 5)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Smallboxes(
                                width: 216,
                                height: 129,
                                mssg: "YOGA",
                              ),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Smallboxes(
                                width: 216,
                                height: 129,
                                mssg: "YOGA",
                              ),
                              Padding(padding: EdgeInsets.only(left: 20)),
                              Smallboxes(
                                width: 216,
                                height: 129,
                                mssg: "YOGA",
                              ),
                              Padding(padding: EdgeInsets.only(left: 20)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 411,
        height: 80,
        decoration: BoxDecoration(

          color: Color(0xff5eb0df),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff71e1de),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
            elevation: 10,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 41,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_add,
                  size: 41,
                ),
                label: 'Make Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.description,
                  size: 41,
                ),
                label: 'Lab Records',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Smallboxes extends StatelessWidget {
  Smallboxes({this.width, this.height, this.mssg});
  final double width;
  final double height;
  final mssg;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(left: 10),
          width: width,
          height: height,
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
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Text(
          mssg,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }
}