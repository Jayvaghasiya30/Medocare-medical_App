import 'package:flutter/material.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/screens/sigiin.dart';
class Dashboard extends StatelessWidget {
  @override
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

