import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:email_auth/email_auth.dart';
import 'dart:async';

class Auth extends ChangeNotifier {
  bool _success;
  String _userEmail;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final aath = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String user1 = null;
  String userEmail = null;
  //FirebaseUser user;
  StreamSubscription userAuthSub;
  User user;

  Future<dynamic> Authprovider() async {
    userAuthSub = FirebaseAuth.instance.authStateChanges().listen((newUser) {
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $newUser');
      user = newUser;
      notifyListeners();
    }, onError: (e) {
      print('AuthProvider - FirebaseAuth - onAuthStateChanged - $e');
    });
    return await auth.currentUser;

  }
  @override
  void dispose() {
    if (userAuthSub != null) {
      userAuthSub.cancel();
      userAuthSub = null;
    }
    super.dispose();
  }
  bool get isAuthenticated {
    return user != null;
  }

  Future<String> register(emaistring, passtring) async {
    final User user = (await auth.createUserWithEmailAndPassword(
      email: emaistring,
      password: passtring,
    ))
        .user;
    if (user != null) {
      _success = true;
      _userEmail = user.email;
    } else {
      _success = true;
    }
    notifyListeners();
    return _userEmail;
  }

  Future<String> signInWithEmailAndPassword(emaistring, passtring) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emaistring, password: passtring);
      final User user = userCredential.user;
      if (user != null) {
        _success = true;
        _userEmail = user.email;
      } else {
        _success = true;
      }
      return _userEmail;
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        return 'no user found for that email';
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        return 'wrong password for that user';
      }
    }
    notifyListeners();
    return null;
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;
    // print('$user');
    final user12 = await auth.currentUser;
    user1 = user12.displayName.toString();
    userEmail = user12.email.toString();
    notifyListeners();
    return userEmail;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
    print("Signed Out");
    notifyListeners();
  }

  Future<void> signOutemail() async {
    await auth.signOut();
    print("Signed Out");
    notifyListeners();
  }

  Future<bool> alreadyemailpresent(email, password) async {
    bool already;
    try {
      // await _auth.fet
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.currentUser.delete();
      already = false;
    } catch (signUpError) {
      //if (signUpError is PlatformException) {
      print(signUpError.code);
      //print(signUpError);
      if (signUpError.code == 'email-already-in-use') {
        /// `foo@bar.com` has alread been registered.
        already = true;
      }
      if (signUpError.code == 'invalid-email') {
        already = true;
      }

      //}
      already = true;
    }
    notifyListeners();
    return already;
  }
}

Future<bool> sendOtp(email) async {
  EmailAuth.sessionName = "test";
  var res = await EmailAuth.sendOtp(receiverMail: email);

  return res;
}

bool verifyotp(email, otp) {
  var res = EmailAuth.validate(receiverMail: email, userOTP: otp);
  return res;
}
