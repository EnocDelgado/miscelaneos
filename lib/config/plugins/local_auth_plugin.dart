import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;


class LocalAuthPlugin {

  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {

    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  // is a wrapper that our method
  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  // implements authentication
  static Future<( bool, String )> authenticate({ bool biometricOnly = false }) async {

    try {

      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: AuthenticationOptions(
          biometricOnly: biometricOnly
        )
      );

      return (didAuthenticate, didAuthenticate ? 'Unlocked' : 'Cancelled by user');

    } on PlatformException catch ( error ) {
      
      if ( error.code == auth_error.notEnrolled ) return ( false, 'Does not biometrics enrolled');
      if ( error.code == auth_error.lockedOut ) return ( false, 'Many failed attempts');
      if ( error.code == auth_error.notAvailable ) return ( false, 'There are not biometrics');
      if ( error.code == auth_error.passcodeNotSet ) return ( false, 'There is not set a passcode');
      if ( error.code == auth_error.permanentlyLockedOut ) return ( false, 'Device unlock required ');

      return (false, error.toString());
    }
  }

}