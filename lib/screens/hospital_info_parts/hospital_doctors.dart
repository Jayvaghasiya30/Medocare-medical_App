import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:amoc/screens/Finalappoint.dart';

class HospitalDoctors extends StatefulWidget {
  HospitalDoctors({this.hospitalname});
  final String hospitalname;
  var di = [];
  //List<Map<String, dynamic>> users;
  @override
  _HospitalDoctorsState createState() => _HospitalDoctorsState();
}

class _HospitalDoctorsState extends State<HospitalDoctors> {
  void initState() {
    //read(widget.disname);
    readinfos();
    // readinfoss();
  }

  void read(em) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("info_disease").doc(em).get().then((value) {
      print(value.get('Treatments'));
      setState(() {
        // widget.di = value.get("Treatments");
      });
      print(widget.di);
    });
  }

  void readinfos() {
    print("Erro");
    final firestoreInstance = FirebaseFirestore.instance;
    FirebaseFirestore.instance
        .collection("doctors_all")
        .where("Current Hospital", isEqualTo: widget.hospitalname)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result != null) {
          setState(() {
            widget.di.add(result.data()["Name"]);
          });
          print(result.data()['Name']);
          print(result.data()['Current Hospital']);
        } else
          print("Erro");
      });
    });
  }

  void insert() {
    final firestoreInstance = FirebaseFirestore.instance;
    // int a=1;
    print(a);
    if (a >= 14) {
      firestoreInstance
          .collection("info_disease")
          .doc("Urinary Incontinence")
          .set({
        // "Current Hospital": "Hospital A",
        // "Name": "Dr. Mahesh Pandey ",
        // "Qualifications": "M.B.B.S,M.S.,M.Ch.",
        "Specialist": ["Gynecologist "],
        "Treatments": {
          "Medications": 'Bronchodilator',
          'Self-care': 'Quitting smoking'
        }
      }).then((_) {
        print("data instered success!");
        setState(() {
          a++;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return
        //Scaffold(
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
        //     'Make Appointment',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        // body:
        Container(
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
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                ...widget.di.map(
                  (i) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DoctorContainer(doctor: i),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //),
    );
  }
}

class DoctorContainer extends StatelessWidget {
  DoctorContainer({this.doctor});
  final String doctor;
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
        ],
        color: Color(0xffb9f6fc),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Name : $doctor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          //Padding(padding: EdgeInsets.only(top: 100,left: 20),),
          Container(
            //padding: EdgeInsets.only(top: 10,left: 20),
            margin: EdgeInsets.only(top: 100 * Height, left: 160 * Width),
            width: 160 * Width,
            height: 40 * Height,
            child: TextButton(
              onPressed: () {
                //  insert();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddAppointment(disname: "Asthama");
                      //widget.disname);
                    },
                  ),
                );
              },
              child: Text(
                'Consult Now!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18 * Width,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.red),
          ),
        ],
      ),

      // ),
    );
  }
}
