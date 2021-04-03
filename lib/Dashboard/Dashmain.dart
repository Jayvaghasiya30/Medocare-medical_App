import 'package:flutter/material.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/screens/sigiin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Dashb extends StatefulWidget {
  Dashb({this.email,this.check});
  final  email;
  final check;
  @override
  _DashbState createState() => _DashbState();
}

class _DashbState extends State<Dashb> {
  @override

  void initState(){

    read(widget.email);

  }
  void read(em){
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("USERS").doc(em).get().then((value){
      print(value.data());
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          child: FlatButton(
            onPressed: () async {
              await Provider.of<Auth>(context,listen: false).signOutGoogle();
              await Provider.of<Auth>(context,listen: false).signOutemail();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Text(
              "SignOut",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff5fb1df),
          ),
        ),
      ),
    );
  }
}


