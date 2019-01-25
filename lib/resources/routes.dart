import 'package:flutter/widgets.dart';
import 'package:privacy_of_animal/decision/login_decision.dart';
import 'package:privacy_of_animal/screen/screen.dart';

Map<String, WidgetBuilder> routes =  {
  '/intro': (BuildContext context) => IntroScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/signUpProfile': (BuildContext context) => SignUpProfileScreen(),
  '/signUpEmailPassword': (BuildContext context) => SignUpEmailPasswordScreen(),
  '/decision': (BuildContext context) => LoginDecision()
};