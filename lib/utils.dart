import 'package:flutter/foundation.dart';

String path(str) {
  return (kIsWeb) ? str : 'assets/$str';
}
