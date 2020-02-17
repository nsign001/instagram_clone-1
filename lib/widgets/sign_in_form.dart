import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              Image.asset('assets/insta_text_logo.png'),
              Spacer(
                flex: 1,
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
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _pwController,
                decoration: getTextFieldDecor('비밀번호'),
                validator: (String value){
                  if(value.isEmpty || !value.contains("@")){
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
              Spacer(
                flex: 1,
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

                  }
                },
              ),
              Spacer(
                flex: 2,
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
              Spacer(
                flex: 2,
              ),
              FlatButton.icon(
                textColor: Colors.blue,
                onPressed: () {
                  simpleSnackbar(context, "facebook pressed");
                },
                icon: ImageIcon(AssetImage('assets/icon/facebook.png')),
                label: Text("페이스북으로 로그인"),
              ),
              Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      )
    );
  }

  void simpleSnackbar(BuildContext context, String txt){
    final snackBar = SnackBar(content: Text(txt),);
    Scaffold.of(context).showSnackBar(snackBar);
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
