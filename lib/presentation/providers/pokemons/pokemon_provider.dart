


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/repository/pokemons_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>( ( ref ) {

  return PokemonsRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>( ( ref, id ) async {

  // create instance and save it
  final pokemonRepository = ref.watch( pokemonRepositoryProvider );

  final ( pokemon, error ) = await pokemonRepository.getPokemon(id);

  // validation
  if ( pokemon != null ) return pokemon;

  throw error;
  
});