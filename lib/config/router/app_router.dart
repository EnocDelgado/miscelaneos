import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/screens/screens.dart';


final router = GoRouter(

  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen(),
    ),

    //! Sensors
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopeScreen(),
    ),

    GoRoute(
      path: '/acelerometer',
      builder: (context, state) => const AcelerometerScreen(),
    ),

    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),

    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen(),
    ),

    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),

    //! Pokemons
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) { 
            final id = state.pathParameters['id'] ?? '1';

            return PokemonScreen( pokemonId: id );
          },
        ),
      ]
    ),

    //! Biometrics
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen(),
    ),

    //! Location
    GoRoute(
      path: '/location',
      builder: (context, state) => const LocationScreen(),
    ),
    
    GoRoute(
      path: '/maps',
      builder: (context, state) => const MapScreen(),
    ),

    GoRoute(
      path: '/controlled-map',
      builder: (context, state) => const ControlledMapScreen(),
    ),

    //! Badge
    GoRoute(
      path: '/badge',
      builder: (context, state) => const BadgeScreen(),
    ),
  ]
);