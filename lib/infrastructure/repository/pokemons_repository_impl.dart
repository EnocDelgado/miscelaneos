

import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasource/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({ PokemonsDatasource? datasource })
    : datasource = datasource ?? PokemonsDataSourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }

}