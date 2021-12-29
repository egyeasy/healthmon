import 'package:flutter/material.dart';
import 'package:healthmon/colors.dart';
import 'package:healthmon/selected_pokemon.dart';
import 'package:healthmon/strings.dart';
import 'package:healthmon/util.dart';
import 'package:healthmon/welcome_view.dart';
import 'package:pedometer/pedometer.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final String clockFile = "images/clock.png";
  final String footprintFile = "images/footprint.png";

  bool isBeginner = true;
  String pokemonFile = "";
  String pokemonName = "";
  int stepCount = 0;
  int todayStepCount = 0;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _stepStatus = "";

  Future<bool> _initState() async {
    isBeginner = (await getBoolSharedPreference(isBeginnerKey)) ?? true;
    String selectedPokemonString = await getStringSharedPreference(selectedPokemonKey);
    pokemonFile = "images/" + getSelectedPokemonFromString(selectedPokemonString).getString() + ".png";
    pokemonName = await getStringSharedPreference(pokemonNameKey);
    stepCount = await getIntSharedPreference(stepCountKey);

    initStepCountPlatformState();

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
              style: getTextStyle(25, whiteColor),
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
        const SizedBox(height: 30),
        Text(
          pokemonName,
          style: getTextStyle(25, whiteColor),
        ),
        const SizedBox(height: 30),
        _getStepCountWidget(),
      ],
    );
  }

  Widget _getStepCountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 50,
          image: AssetImage(footprintFile),
        ),
        const SizedBox(width: 10),
        Text(
          stepCount.toString(),
          style: getTextStyle(25, whiteColor),
        ),
      ],
    );
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      int currentStepCount = event.steps;
      int stepCountDiff = currentStepCount > todayStepCount ? currentStepCount - todayStepCount : currentStepCount;
      todayStepCount = currentStepCount;
      stepCount += stepCountDiff;
      setIntSharedPreference(stepCountKey, stepCount);

      print("STEP: " + event.steps.toString());
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _stepStatus = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _stepStatus = 'Pedestrian Status not available';
    });
    print(_stepStatus);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      // _step = 'Step Count not available';
    });
  }

  void initStepCountPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
}
