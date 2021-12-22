import 'package:flutter/material.dart';
import 'package:healthmon/home.dart';
import 'package:healthmon/selected_pokemon.dart';
import 'package:healthmon/strings.dart';
import 'package:healthmon/util.dart';

class SelectionView extends StatefulWidget {
  @override
  State<SelectionView> createState() => SelectionViewState();
}

class SelectionViewState extends State<SelectionView> {
  final String pikachuFile = "images/pikachu.png";
  final String pairiFile = "images/pairi.png";
  final String kkobugiFile = "images/kkobugi.png";
  final String yisanghaessiFile = "images/yisanghaessi.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF303030),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 1200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(pikachuFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(SelectedPokemon.pikachu);
                  },
                ),
                IconButton(
                  icon: Image.asset(pairiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(SelectedPokemon.pairi);
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Image.asset(kkobugiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(SelectedPokemon.kkobugi);
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Image.asset(yisanghaessiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(SelectedPokemon.yisanghaessi);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onSelected(SelectedPokemon selected) async {
    setStringSharedPreference(
      selectedPokemonKey,
      selected.getString(),
    );
    String selectedPokemonString = await getStringSharedPreference(selectedPokemonKey);
    print(getSelectedPokemonFromString(selectedPokemonString).getString());

    setBoolSharedPreference(isBeginnerKey, false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }
}
