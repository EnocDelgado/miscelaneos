import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';


class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build( BuildContext context, ref ) {

    final badgeCounter = ref.watch( badgeCounterProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Badge'),
      ),

      body: Center(
        child: Column(
          children: [

            Badge(
              alignment: Alignment.lerp( Alignment.topRight, Alignment.bottomRight, 0.2 ),
              child: Text('$badgeCounter', style: const TextStyle( fontSize:  150 ) ),
            ),


            FilledButton.tonal(
              onPressed: (){
                ref.invalidate( badgeCounterProvider );
              }, 
              child: const Text('Delete Badge')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ref.read( badgeCounterProvider.notifier ).update((state) => state + 1 );
        },
        child: const Icon( Icons.plus_one ),
      ),
    );
  }
}