import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_page.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SignInForm(),
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
          final route = MaterialPageRoute(builder: (context) => SignUpPage());
          Navigator.pushReplacement(context, route);
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "계정이 없나요?",
                style: TextStyle(
                  fontWeight: FontWeight.w300, color: Colors.black54)
              ),
              TextSpan(
                text: "    회원가입",
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
