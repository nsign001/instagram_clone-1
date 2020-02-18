import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signin_page.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';
import 'package:instagram_clone/widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              SignUpForm(),
              _goToSignUpPageBtn(context),
            ],
          )
      ),
    );
  }

  Positioned _goToSignUpPageBtn(BuildContext context){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 40,
      child: FlatButton(
        shape: Border(top: BorderSide(color: Colors.grey[300])),
        onPressed: (){
          final route = MaterialPageRoute(builder: (context) => SignInPage());
          Navigator.pushReplacement(context, route);
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: "이미 계정이 있으신가요?",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black54)
                ),
                TextSpan(
                    text: "    로그인",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[600])
                ),
              ]
          ),
        ),
      ),
    );
  }
}
