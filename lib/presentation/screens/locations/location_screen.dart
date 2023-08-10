import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build( BuildContext context, ref ) {

    final userLocationAsync = ref.watch( userLocationProvider );
    final watchLocationAsync = ref.watch( userLocationProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ! Current Location
            const Text('Current Location'),
            userLocationAsync.when(
              data: ( data ) => Text('$data'), 
              error: (error, stackTrace) => Text('Error $error'), 
              loading: () => const CircularProgressIndicator()
            ),

            const SizedBox( height: 15 ),

            // ! Current Location
            const Text('Second Location'),
            watchLocationAsync.when(
              data: ( data ) => Text('$data'), 
              error: (error, stackTrace) => Text('Error $error'), 
              loading: () => const CircularProgressIndicator()
            ),

          ],
        ),
      )
    );
  }
}