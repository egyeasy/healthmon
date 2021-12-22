import 'package:flutter/material.dart';
import 'package:healthmon/selected_pokemon.dart';
import 'package:healthmon/strings.dart';
import 'package:healthmon/util.dart';
import 'package:healthmon/welcome_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final String clockFile = "images/clock.png";
  final String footprintFile = "images/footprint.png";

  bool isBeginner = true;
  String pokemonFile = "";
  int stepCount = 2000;
  int hourCount = 47;

  Future<bool> _initState() async {
    isBeginner = (await getBoolSharedPreference(isBeginnerKey)) ?? true;
    String selectedPokemonString = await getStringSharedPreference(selectedPokemonKey);
    print("ISBEGINNER: " + isBeginner.toString());
    print("SELECTED: " + selectedPokemonString);
    pokemonFile = "images/" + getSelectedPokemonFromString(selectedPokemonString).getString() + ".png";

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initState(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Error: ${snapshot.error}',
              style: getTextStyle(25, const Color(0xFFDFDFDF)),
            ),
          );
        } else {
          return isBeginner
              ? WelcomeView()
              : Scaffold(
                  backgroundColor: const Color(0xFF303030),
                  body: Center(
                    child: _getPokemonWidget(),
                  ),
                );
        }
      },
    );
  }

  Widget _getPokemonWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          width: 300,
          image: AssetImage(pokemonFile),
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
    );
  }
}
