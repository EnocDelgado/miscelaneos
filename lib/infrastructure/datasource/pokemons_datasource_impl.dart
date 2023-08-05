import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/mappers/pokemon_mapper.dart';


class PokemonsDataSourceImpl implements PokemonsDatasource {

  final Dio dio;

  PokemonsDataSourceImpl(): dio = Dio( BaseOptions( baseUrl: 'https://pokeapi.co/api/v2') );

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async{
    
    try {

      final response = await dio.get('/pokemon/$id');

      final pokemon = PokemonMapper.pokeApiPokemonToEntity( response.data );

      return ( pokemon, 'Data obtained');

    } catch ( error ) {
      return ( null, 'Does not get pokemon $error');
    }
  }

}