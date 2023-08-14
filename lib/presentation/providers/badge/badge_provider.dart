

import 'package:flutter_riverpod/flutter_riverpod.dart';

final badgeCounterProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});