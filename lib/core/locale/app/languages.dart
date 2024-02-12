import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class Languages {
  Map<String, String> getTranslationsEnglish();

  Map<String, String> getTranslationsArabic();

}
