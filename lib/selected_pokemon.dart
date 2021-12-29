enum SelectedPokemon {
  none,
  pikachu,
  pairi,
  kkobugi,
  yisanghaessi,
}

extension StringExtension on SelectedPokemon {
  String getString() {
    String pokemonString = "";
    switch (this) {
      case SelectedPokemon.pikachu:
        pokemonString = "pikachu";
        break;
      case SelectedPokemon.pairi:
        pokemonString = "pairi";
        break;
      case SelectedPokemon.kkobugi:
        pokemonString = "kkobugi";
        break;
      case SelectedPokemon.yisanghaessi:
        pokemonString = "yisanghaessi";
        break;
      default:
    }
    return pokemonString;
  }
}

SelectedPokemon getSelectedPokemonFromString(String selectedPokemon) {
  selectedPokemon = 'SelectedPokemon.$selectedPokemon';
  return SelectedPokemon.values.firstWhere((f) => f.toString() == selectedPokemon, orElse: () => SelectedPokemon.none);
}
