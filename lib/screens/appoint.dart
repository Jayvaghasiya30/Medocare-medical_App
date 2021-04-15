import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/utilis/constants.dart';
class Appoint extends StatefulWidget {
  Appoint(this.disname);
  final disname;
  @override
  _AppointState createState() => _AppointState();
}


class _AppointState extends State<Appoint> {
  void initState() {
    read(widget.disname);
    readinfos();


  }

  void read(em) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("info_disease").doc(em).get().then((value) {
      print(value.data()['Specialists']);
    });
  }
  void readinfos() {
    print("Erro");
    final firestoreInstance = FirebaseFirestore.instance;
    FirebaseFirestore.instance
        .collection('doctors_all')
        .where('Specialist', isEqualTo: 'pediatrician')
        .get()
        .then((querySnapshot){
      querySnapshot.docs.forEach((result){
        if(result!=null)
        {print(result.data()['Name']);
        print(result.data()['Current Hospital']);}
        else
          print("Erro");

      });

    });

  }
  void insert(){
    final firestoreInstance = FirebaseFirestore.instance;
    // int a=1;
    print(a);
    if(a>=14){
    firestoreInstance
        .collection("info_disease")
        .doc("Urinary Incontinence")
        .set({
      // "Current Hospital": "Hospital A",
      // "Name": "Dr. Mahesh Pandey ",
      // "Qualifications": "M.B.B.S,M.S.,M.Ch.",
      "Specialist":[ "Gynecologist "],

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
          'Make Appointments',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: 411 * Width,
        height: 731 * Height,
        color: Color(0xff5fb1df),
        padding: const EdgeInsets.only(
          bottom: 94,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              child: TextButton(
                onPressed: (){
                  readinfos();
                  //insert();
                  //Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return Appoint();
                  //     },
                  //   ),
                  // );
                },
                child: Center(
                  child: Text(
                    widget.disname,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
