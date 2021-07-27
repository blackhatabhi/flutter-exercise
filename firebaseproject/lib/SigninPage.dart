import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email, _password;

  // checkAuth() async {
  //   _auth.onAuthStateChanged.listen((user) async {
  //     if (user != null) {
  //       Navigator.pushReplacementNamed(context, "/");
  //     }
  //   });
  // }

  navigateToSignup() {
    Navigator.pushReplacementNamed(context, "/SignupPage");
  }

  @override
  void initState() {
    super.initState();
    // this.checkAuth();
  }

void signin() async {
  if(_formkey.currentState.validate()){

    _formkey.currentState.save();
  }

try {
FirebaseUser user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);

} catch (e) {
showError(e.message);
}

}
  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                child: Image(
                  image: AssetImage(
                    "images/logo.png"
                    
                  ),
                  width: 100.0,
                  height: 100.0,
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}
