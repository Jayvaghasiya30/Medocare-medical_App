import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/sigiin.dart';
import 'Services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(dashboard());
}




class dashboard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        home: Scaffold(
          body: SignIn(),
           // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

