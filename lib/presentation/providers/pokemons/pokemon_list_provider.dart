

import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonListProvider = StateProvider<List<int>>((ref) {
  return List.generate( 91, ( index)  => index + 1 );
});