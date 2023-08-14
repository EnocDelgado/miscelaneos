

import 'package:miscelaneos/config/config.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {

  static registerActions() {

    const  QuickActions quickActions = const QuickActions();

    // init
    quickActions.initialize((shortcutType) {
      

      switch ( shortcutType ) {
        case 'biometric':
          router.push('/biometrics');
        break;

        case 'compass':
          router.push('/compass');
        break;

        case 'pokemon':
          router.push('/pokemons');
        break;

        case 'charmander':
          router.push('/pokemons/4');
        break;
      }
    });

    // set actions
    quickActions.setShortcutItems(<ShortcutItem>[
    const ShortcutItem(type: 'biometric', localizedTitle: 'biometric', icon: 'finger'),
    const ShortcutItem(type: 'compass', localizedTitle: 'compass', icon: 'compass'),
    const ShortcutItem(type: 'pokemon', localizedTitle: 'pokemon', icon: 'pokemons'),
    const ShortcutItem(type: 'charmander', localizedTitle: 'charmander', icon: 'charmander')
    ]);

  }


}