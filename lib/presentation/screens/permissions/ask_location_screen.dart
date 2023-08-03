import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';

class AskPermissionView extends ConsumerWidget {
  const AskPermissionView({super.key});

  @override
  Widget build( BuildContext context, ref ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Required Permission'),
      ),

      body: Center(
        child: FilledButton(
          child: const Text('Need Location'),
          onPressed: () {

            ref.read( permissionsProvider.notifier ).requestGaleryAccess();
          },
        ),
      ),
    );
  }
}