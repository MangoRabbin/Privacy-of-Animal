import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(PrivacyOfAnimal());
}

class PrivacyOfAnimal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '동물의 사생활',
      home: Test(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

