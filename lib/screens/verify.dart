import 'package:flutter/material.dart';
import 'package:amoc/Services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:amoc/Dashboard/Dashmain.dart';
class verifypage extends StatelessWidget {
   verifypage(this.email,this.pass);
  final String email ;
  final String pass;
  final TextEditingController _OPTController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 285,
                  height: 40,
                  decoration: boxDecoration(Colors.blue),
                  child: TextFormField(
                    controller: _OPTController,
                    decoration: inputdecor("OTP"),

                  ),
                ),
                Container(

                  child: FlatButton(
                    onPressed: () async {
                      bool a= await verifyotp(email,_OPTController.text);
                      if(a){
                        print(a);
                        if (_formKey.currentState.validate()) {
                          await Provider.of<Auth>(context, listen: false).register(email,pass)
                              .then((result) {
                            print(result);
                            if(result==null)
                              print("error");
                            else{
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Dashboard();
                                  },
                                ),
                              );
                            }
                          });
                        }
                      }

                    },
                    child: Text(
                      "Verify",
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

              ],
            ),
          ),
        )
    );
  }


}
// onPressed: () async {
//
// },

