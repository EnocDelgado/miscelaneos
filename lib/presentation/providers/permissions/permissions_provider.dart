import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionNotifier extends StateNotifier<PermissionsState> {

  PermissionNotifier(): super( PermissionsState() ){
    // todo: checkPermissions()
  }

  Future<void> checkPermissions() async {
    // verify status
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,

      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera : permissionsArray[0],
      photoLibrary : permissionsArray[1],
      sensonrs : permissionsArray[2],

      location : permissionsArray[3],
      locationAlways : permissionsArray[4],
      locationWhenInUse  : permissionsArray[5],
    );
  }

  // request permissions
  requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith( camera: status );

    if ( status == PermissionStatus.permanentlyDenied ) {
      openAppSettings();
      
    }
  }
}


class PermissionsState {

  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensonrs;

  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState({
    this.camera = PermissionStatus.denied, 
    this.photoLibrary = PermissionStatus.denied, 
    this.sensonrs = PermissionStatus.denied, 
    this.location = PermissionStatus.denied, 
    this.locationAlways = PermissionStatus.denied, 
    this.locationWhenInUse  = PermissionStatus.denied
  });

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }
  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }
  get sensonrsGranted {
    return sensonrs == PermissionStatus.granted;
  }
  get locationGranted {
    return location == PermissionStatus.granted;
  }
  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }
  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensonrs,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse
  }) => PermissionsState(
    camera: camera ?? this.camera,
    photoLibrary: photoLibrary ?? this.photoLibrary,
    sensonrs: sensonrs ?? this.sensonrs,
    location: location ?? this.location,
    locationAlways: locationAlways ?? this.locationAlways,
    locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse
  );

}