import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:amoc/screens/sigiin.dart';
import 'Services/auth_services.dart';
import 'package:amoc/Dashboard/Dashmain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(dashboard());
}

class dashboard extends StatelessWidget {
  void initState() {
  print(Auth().Authprovider());


  }
  // Provider.of<Auth>(context, listen: false).auth
   //
   //  auth.onAuthStateChanged.listen((user) {
   //    if (user != null) {
   //      print("user is logged in");
   //      //navigate to home page using Navigator Widget
   //    } else {
   //      print("user is not logged in");
   //      //navigate to sign in page using Navigator Widget
   //    }
   //  });


  @override

  Widget build(BuildContext context) {
    Widget body;
    // if(Auth().Authprovider()==null) {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return SignIn();
    //       },
    //     ),
    //   );
    // }
    // else{
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return Dashboard();
    //       },
    //     ),
    //   );
    // }

    return ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SignIn(),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
