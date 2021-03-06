import 'package:flutter/material.dart';
import 'package:healthmon/base_pokemon.dart';
import 'package:healthmon/naming_view.dart';
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
                    _onSelected(BasePokemon.pikachu);
                  },
                ),
                IconButton(
                  icon: Image.asset(pairiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(BasePokemon.pairi);
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Image.asset(kkobugiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(BasePokemon.kkobugi);
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: Image.asset(yisanghaessiFile),
                  iconSize: 250,
                  onPressed: () {
                    _onSelected(BasePokemon.yisanghaessi);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onSelected(BasePokemon selected) {
    setStringSharedPreference(
      basePokemonKey,
      selected.getBasePokemonString(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NamingView()),
    );
  }
}
