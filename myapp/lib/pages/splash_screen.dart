import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/pages/root_page.dart';
import 'package:myapp/services/auth.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: RootPage(
                auth: new Auth(),
              ),
            ),
            (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/virus-icon.png',
          height: 250,
        ),
      ),
    );
  }
}
