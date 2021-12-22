import 'package:flutter/material.dart';
import 'package:healthmon/util.dart';
import 'package:healthmon/welcome_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final String isBeginnerKey = "IS_BEGINNER";
  bool isBeginner = true;

  final String kkobugiFile = "images/kkobugi.png";
  final String clockFile = "images/clock.png";
  final String footprintFile = "images/footprint.png";

  int stepCount = 2000;
  int hourCount = 47;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() async {
    isBeginner = (await getBoolSharedPreference(isBeginnerKey)) ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return isBeginner
        ? WelcomeView()
        : Scaffold(
            backgroundColor: const Color(0xFF303030),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    width: 300,
                    image: AssetImage(kkobugiFile),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 50,
                        image: AssetImage(footprintFile),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        stepCount.toString(),
                        style: getTextStyle(25, const Color(0xFFDFDFDF)),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 50,
                        image: AssetImage(clockFile),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        hourCount.toString() + "시간",
                        style: getTextStyle(25, const Color(0xFFDFDFDF)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
