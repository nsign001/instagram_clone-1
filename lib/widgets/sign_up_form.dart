import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/size.dart';
import 'package:instagram_clone/main_page.dart';
import 'package:instagram_clone/utils/simple_snack_bar.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
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
                height: 100,
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
                decoration: getTextFieldDecor('비밀번호'),
                validator: (String value){
                  if(value.isEmpty){
                    return '비밀번호를 입력해 주세요.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _cpwController,
                decoration: getTextFieldDecor('비밀번호 확인'),
                validator: (String value){
                  if(value.isEmpty || value != _pwController.text){
                    return '비밀번호가 일치하지 않습니다..';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              FlatButton(
                child: Text(
                  "회원가입",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                disabledColor: Colors.blue[100],
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    final route = MaterialPageRoute(builder: (context) => MainPage());
                    Navigator.pushReplacement(context, route);
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
