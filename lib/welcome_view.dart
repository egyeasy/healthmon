import 'package:flutter/material.dart';
import 'package:healthmon/util.dart';

class WelcomeView extends StatefulWidget {
  @override
  State<WelcomeView> createState() => WelcomeViewState();
}

class WelcomeViewState extends State<WelcomeView> {
  final String welcomeString = "환영합니다!\n당신의 포켓몬을\n선택하세요";
  bool showWelcomeText = true;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() async {
    await timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      body: Center(
        child: showWelcomeText
            ? _welcomeText()
            : Text(
                "가나다",
                style: getTextStyle(25, const Color(0xFFDFDFDF)),
              ),
      ),
    );
  }

  timer() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    setState(() {
      showWelcomeText = false;
    });
  }

  Widget _welcomeText() {
    return Text(
      welcomeString,
      textAlign: TextAlign.center,
      style: getTextStyle(25, const Color(0xFFDFDFDF)),
    );
  }
}