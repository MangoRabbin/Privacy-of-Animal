import 'package:flutter/material.dart';
import 'package:privacy_of_animal/bloc_helpers/bloc_provider.dart';
import 'package:privacy_of_animal/logics/authentication/authentication.dart';
import 'package:privacy_of_animal/logics/validation/validation_bloc.dart';
import 'package:privacy_of_animal/resources/colors.dart';
import 'package:privacy_of_animal/resources/constants.dart';
import 'package:privacy_of_animal/resources/strings.dart';
import 'package:privacy_of_animal/widgets/focus_visible_maker.dart';
import 'package:privacy_of_animal/widgets/initial_button.dart';

class SignUpEmailPasswordForm extends StatefulWidget {
  @override
  _SignUpEmailPasswordFormState createState() => _SignUpEmailPasswordFormState();
}

class _SignUpEmailPasswordFormState extends State<SignUpEmailPasswordForm> {

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {

    final ValidationBloc _validationBloc = BlocProvider.of<ValidationBloc>(context);
    final AuthenticationBloc _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container(
      height: ScreenUtil.height/1.7,
      width: ScreenUtil.width/1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              '이메일',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0
              ),
            ),
          ),
          StreamBuilder<String>(
            stream: _validationBloc.email,
            initialData: signUpEmptyNameError,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              return EnsureVisibleWhenFocused(
                focusNode: _emailFocusNode,
                child: TextField(
                  decoration: InputDecoration(
                    errorText: snapshot.error,
                    hintText: signUpEmailHint
                  ),
                  onChanged: _validationBloc.onNameChanged,
                  keyboardType: TextInputType.text,
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                ),
              );
            },
          ),
          SizedBox(height: ScreenUtil.height/25),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              '비밀번호',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0
              ),
            ),
          ),
          StreamBuilder<String>(
            stream: _validationBloc.password,
            initialData: signUpEmptyAgeError,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              return EnsureVisibleWhenFocused(
                focusNode: _passwordFocusNode,
                child: TextField(
                  decoration: InputDecoration(
                    errorText: snapshot.error,
                    hintText: signUpPasswordHint
                  ),
                  onChanged: _validationBloc.onJobChanged,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                ),
              );
            },
          ),
          SizedBox(height: ScreenUtil.height/15),
          StreamBuilder<bool>(
            stream: _validationBloc.loginValid,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
              return InitialButton(
                text: '회원가입',
                color: introLoginButtonColor,
                callback: (snapshot.hasData && snapshot.data==true) 
                ? (){
                  _authenticationBloc.emitEvent(
                    AuthenticationEventSignUp(
                      email: _emailController.text, password: _passwordController.text
                    )
                  );
                } 
                : null,
              );
            },
          )
        ],
      ),
    );
  }
}