import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/main_page.dart';
import 'package:instagram_clone/utils/simple_snack_bar.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
        key: _formKey,
          child: ListView(
            /*mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,*/
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Image.asset('assets/insta_text_logo.png'),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _emailController,
                decoration: getTextFieldDecor('이메일'),
                validator: (String value){
                  if(value.isEmpty || !value.contains("@")){
                    return '이메일 주소를 입력해 주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _pwController,
                obscureText: true,
                decoration: getTextFieldDecor('비밀번호'),
                validator: (String value){
                  if(value.isEmpty){
                    return '비밀번호를 입력해 주세요.';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "비밀번호를 잊어버리셨나요?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: common_s_gap,
              ),
              FlatButton(
                child: Text(
                  "로그인",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                disabledColor: Colors.blue[100],
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    /*final route = MaterialPageRoute(builder: (context) => MainPage());
                    Navigator.pushReplacement(context, route);*/
                    _login;
                  }
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    right: 0,
                    left:0,
                    height: 1,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.grey[50],
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: common_s_gap,
              ),
              FlatButton.icon(
                textColor: Colors.blue,
                onPressed: () {
                  simpleSnackbar(context, "facebook pressed");
                },
                icon: ImageIcon(AssetImage('assets/icon/facebook.png')),
                label: Text("페이스북으로 로그인"),
              ),
              SizedBox(
                height: common_s_gap,
              ),
              SizedBox(
                height: common_l_gap,
              ),
            ],
          ),
        ),
      )
    );
  }

  get _login async{
    final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _pwController.text
    );

    final FirebaseUser user = result.user;

    if(user == null){
      simpleSnackbar(context, 'Please try again later!');
    }
  }

  InputDecoration getTextFieldDecor(String hint){
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.grey[100],
      filled: true,

    );
  }
}
