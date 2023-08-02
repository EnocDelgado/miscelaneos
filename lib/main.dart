import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/app_state_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp() 
    )
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends ConsumerState<MainApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    // state observable
    WidgetsBinding.instance.addObserver( this );
  }

  @override
  void dispose() {
    
    WidgetsBinding.instance.removeObserver( this );
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState( AppLifecycleState state ) {
    // print('State: $state');
    /*
      resumed => from background to foreground
      inactive => app is not on foreground
      paused => app is on background
      detached => excluded
     */
    
    ref.read( appStateProvider.notifier ).state = state;

    super.didChangeAppLifecycleState( state );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: router  ,
    );
  }
}
