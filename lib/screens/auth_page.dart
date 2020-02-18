import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';
import 'package:instagram_clone/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  Widget currentWidget = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              AnimatedSwitcher(
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(child: child, opacity: animation);
                  },
                  duration: Duration(milliseconds: 500),
                  child: currentWidget
              ),
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
          setState(() {
            if(currentWidget is SignInForm){
              currentWidget = SignUpForm();
            }else{
              currentWidget = SignInForm();
            }
          });
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: (currentWidget is SignInForm) ? "계정이 없으신가요?" : "이미 계정이 있으신가요?",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.black54)
                ),
                TextSpan(
                    text: (currentWidget is SignInForm) ? "    회원가입" : "    로그인",
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
