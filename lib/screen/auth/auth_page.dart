import 'package:device_shop_app/screen/auth/login_page.dart';
import 'package:device_shop_app/screen/auth/sing_up_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;
  @override
  Widget build(BuildContext context) {
    return isLogged
          ? LoginPage(onClickSignUp: switchAuthPages)
          : SignUpPage(onClickedSignIn: switchAuthPages);
    
  }
  void switchAuthPages() => setState(() {
        isLogged = !isLogged;
      });
}