import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_provider.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonsView(),
    );
  }
}

class PokemonsView extends ConsumerStatefulWidget {
  const PokemonsView({super.key});

  @override
  PokemonsViewState createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<PokemonsView> {

  final scrollController = ScrollController();

  // infinite scroll
  void infinitScroll() {
    final currentPokemons = ref.read( pokemonProvider );
    //validation
    if ( currentPokemons.length > 400 ) {
      scrollController.removeListener( infinitScroll );
      return;
    }

    if ( ( scrollController.position.pixels + 200 ) > scrollController.position.maxScrollExtent ) {
      ref.read( pokemonProvider.notifier ).update((state) => [
        ...state,
        ...List.generate( 91, ( index)  => state.length + index + 1 )
      ]);
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener( infinitScroll );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity( 0.8 ),
        ),

        const _PokemonGrid()
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid({super.key});

  @override
  Widget build( BuildContext context, WidgetRef ref ) {

    final pokemonId = ref.watch( pokemonProvider );

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2
      ),
      itemCount: pokemonId.length,
      itemBuilder: (context, index) {
        
        return GestureDetector(
          // onTap: ,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}