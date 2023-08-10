import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build( BuildContext context, ref ) {

    // final watchUserLocation = ref.watch( watchLocationProvider );
    final userInitialLocation = ref.watch( userLocationProvider );

    return Scaffold(
      body: userInitialLocation.when(
              data: ( data ) => MapsAndControls( latitude: data.$1, longitude: data.$2 ), 
              error: (error, stackTrace) => Text('Error $error'), 
              loading: () => const Center( child: Text('Locating user'),)
            ),
    );
  }
}

class MapsAndControls extends ConsumerWidget {

  final double latitude;
  final double longitude;

  const MapsAndControls({
    super.key, 
    required this.latitude, 
    required this.longitude
  });

  @override
  Widget build(BuildContext context, ref ) {

    final mapControllerState = ref.watch( mapControllerProvider );

    return Stack(
      children: [

        _MapView(initialLat: latitude, initialLng: longitude ),

        //! Bottom to logout
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              context.pop();
            }, 
            icon: const Icon( Icons.arrow_back ) 
          )
        ),

        //! Go to current position
        Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){

              ref.read( mapControllerProvider.notifier )
                .goToLocation( latitude, longitude );
            }, 
            icon: const Icon( Icons.location_searching ) 
          )
        ),

        //! Follow user
        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              ref.read( mapControllerProvider.notifier )
                .toggleFollowUser();
            }, 
            icon: Icon( 
              mapControllerState.followUser
              ? Icons.directions_run
              : Icons.accessibility_new_outlined 
            ) 
          )
        ),

        //! Crate a mark
        Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: (){
              ref.read( mapControllerProvider.notifier )
                .addMarkerCurrentPosition();
            }, 
            icon: const Icon( Icons.pin_drop ) 
          )
        ),

      ],
    );
  }
}


class _MapView extends ConsumerStatefulWidget {

  final double initialLat;
  final double initialLng;

  const _MapView({
    required this.initialLat, 
    required this.initialLng 
  });

  @override
  __MapViewState createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {

    final mapController = ref.watch( mapControllerProvider );

    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: LatLng( widget.initialLat, widget.initialLng),
        zoom: 12
      ),
      myLocationEnabled: true,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
        ref.read( mapControllerProvider.notifier )
          .setMapController( controller );
      },
      onLongPress: ( latLng ) {
        ref.read( mapControllerProvider.notifier )
          .addMarker( latLng.latitude, latLng.longitude, 'Custom Marker');
      },
    );
  }
}