import 'package:flutter/material.dart';
import 'package:healthmon/colors.dart';
import 'package:healthmon/strings.dart';
import 'package:healthmon/util.dart';

class NamingView extends StatefulWidget {
  @override
  State<NamingView> createState() => NamingViewState();
}

class NamingViewState extends State<NamingView> {
  final String namingTitle = "이름을 지어주세요!";
  final String nameLabel = "이름";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            namingTitle,
            textAlign: TextAlign.center,
            style: getTextStyle(25, whiteColor),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: TextField(
              onSubmitted: (inputText) {
                _onSubmitted(inputText);
              },
              style: getTextStyle(25, whiteColor),
              decoration: InputDecoration(
                labelText: nameLabel,
                labelStyle: getTextStyle(25, whiteColor),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: whiteColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(width: 1, color: whiteColor),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onSubmitted(String inputText) {
    setStringSharedPreference(pokemonNameKey, inputText);
    setBoolSharedPreference(isBeginnerKey, false);
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
