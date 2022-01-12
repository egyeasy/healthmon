import 'package:healthmon/strings.dart';
import 'package:healthmon/util.dart';

enum BasePokemon {
  none,
  pikachu,
  pairi,
  kkobugi,
  yisanghaessi,
}

enum PokemonPhase {
  none,
  firstPhase,
  secondPhase,
  thirdPhase,
}

extension StringExtension on BasePokemon {
  String getBasePokemonString() {
    String pokemonString = "";
    switch (this) {
      case BasePokemon.pikachu:
        pokemonString = "pikachu";
        break;
      case BasePokemon.pairi:
        pokemonString = "pairi";
        break;
      case BasePokemon.kkobugi:
        pokemonString = "kkobugi";
        break;
      case BasePokemon.yisanghaessi:
        pokemonString = "yisanghaessi";
        break;
      default:
    }
    return pokemonString;
  }

  Future<String> getCurrentPokemonString() async {
    PokemonPhase phase = await _getPokemonPhase();

    String pokemonString = "";
    switch (this) {
      case BasePokemon.pikachu:
        pokemonString = _getPokemonFromPhase(phase, "pikachu", "raichu", "");
        break;
      case BasePokemon.pairi:
        pokemonString = _getPokemonFromPhase(phase, "pairi", "lizard", "lizamong");
        break;
      case BasePokemon.kkobugi:
        pokemonString = _getPokemonFromPhase(phase, "kkobugi", "eonibugi", "turtleking");
        break;
      case BasePokemon.yisanghaessi:
        pokemonString = _getPokemonFromPhase(phase, "pikachu", "yisanghaepul", "yisanghaekkot");
        break;
    }

    return pokemonString;
  }
}

Future<PokemonPhase> _getPokemonPhase() async {
  int firstEvolutionStepCount = await getIntSharedPreference(firstEvolutionStepCountKey);
  int secondEvolutionStepCount = await getIntSharedPreference(secondEvolutionStepCountKey);
  int totalStepCount = await getIntSharedPreference(totalStepCountKey);

  if (totalStepCount < firstEvolutionStepCount) {
    return PokemonPhase.firstPhase;
  } else if (totalStepCount < secondEvolutionStepCount) {
    return PokemonPhase.secondPhase;
  } else {
    return PokemonPhase.thirdPhase;
  }
}

String _getPokemonFromPhase(PokemonPhase currentPhase, String firstPhase, String secondPhase, String thirdPhase) {
  String pokemonString = "";

  switch (currentPhase) {
    case PokemonPhase.firstPhase:
      pokemonString = firstPhase;
      break;
    case PokemonPhase.secondPhase:
      pokemonString = secondPhase;
      break;
    case PokemonPhase.thirdPhase:
      pokemonString = thirdPhase;
      break;
    default:
  }

  return pokemonString;
}

BasePokemon getBasePokemonFromString(String basePokemonString) {
  basePokemonString = 'BasePokemon.$basePokemonString';
  return BasePokemon.values.firstWhere((f) => f.toString() == basePokemonString, orElse: () => BasePokemon.none);
}
