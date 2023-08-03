import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';


class AcelerometerXYZ {
  final double x;
  final double y;
  final double z;

  AcelerometerXYZ( this.x, this.y, this.z );

  // get information in an easy way
  @override
  String toString() {
    return '''
      x: $x,
      y: $y,
      z: $z,
    ''';
  }

}

final acelerometerGravityProvider = StreamProvider.autoDispose<AcelerometerXYZ>((ref) async* {
  
  await for ( final event in accelerometerEvents ){

    final x = double.parse( (event.x.toStringAsFixed( 2 ) ) );
    final y = double.parse( (event.y.toStringAsFixed( 2 ) ) );
    final z = double.parse( (event.z.toStringAsFixed( 2 ) ) );

    yield AcelerometerXYZ(x, y, z);
  }
  
});

final acelerometerUserProvider = StreamProvider.autoDispose<AcelerometerXYZ>((ref) async* {
  
  await for ( final event in userAccelerometerEvents ){

    final x = double.parse( (event.x.toStringAsFixed( 2 ) ) );
    final y = double.parse( (event.y.toStringAsFixed( 2 ) ) );
    final z = double.parse( (event.z.toStringAsFixed( 2 ) ) );

    yield AcelerometerXYZ(x, y, z);
  }
  
});