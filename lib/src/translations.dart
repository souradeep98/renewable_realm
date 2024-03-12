import 'dart:ui';

import 'package:flutter/foundation.dart';

abstract mixin class Translations {
  static const Locale _english = Locale("en", "UK");
  static final Set<Locale> _supportedLocales = {
    _english,
  };

  static final Map<String, Map<Locale, String>> _translations = {
    "test_tranlation": {
      _english: "This text is in english",
    },
  };

  String getTranslation(
    String id,
    Locale locale, {
    bool debug = kDebugMode,
  }) {
    if (debug) {
      try {
        return _translations[id]![locale]!;
      } catch (_) {
        throw "Translation for id: $id and locale: $locale not found";
      }
    }

    return _translations[id]?[locale] ?? id;
  }
}
