import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AcelerometerScreen extends ConsumerWidget {
  const AcelerometerScreen({super.key});

  @override
  Widget build( BuildContext context, WidgetRef ref ) {

    final acelerometer$ = ref.watch( acelerometerGravityProvider );
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Acelerometer'),
      ),

      body: Center(
        child: acelerometer$.when(
          data: ( value ) => Text(
            value.toString(),
            style:  const TextStyle( fontSize:  30 ),
          ), 
          error: ( error, stackTrace ) => Text('$error'), 
          loading: () => const CircularProgressIndicator()
        ),
      ),
    );
  }
}