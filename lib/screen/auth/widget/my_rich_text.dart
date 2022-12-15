import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRichText extends StatelessWidget {
  final VoidCallback onTap;

  MyRichText({super.key,
              required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
         text: TextSpan(
              style: TextStyle(color: Color(0xFFFBDF00), fontSize: 18),
              text: "Already have an account? ",
            children: [
              TextSpan(
                recognizer:  TapGestureRecognizer()
                  ..onTap = onTap,
                text: 'Sing In',
                style: TextStyle(color: Color(0xFFFBDF00), fontSize: 18),
              )
            ]
         ),
    );
  }
}