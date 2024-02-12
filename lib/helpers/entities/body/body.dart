import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class Body {
  const Body();
  Map<String, dynamic> getBody();
}
