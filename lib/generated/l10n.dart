// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `There was an error`
  String get defaultError {
    return Intl.message(
      'There was an error',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `Kalkulator otoczka wypukła`
  String get appTitle {
    return Intl.message(
      'Kalkulator otoczka wypukła',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `punkt`
  String get point {
    return Intl.message(
      'punkt',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `Punkt`
  String get shapeDot {
    return Intl.message(
      'Punkt',
      name: 'shapeDot',
      desc: '',
      args: [],
    );
  }

  /// `Linia`
  String get shapeLine {
    return Intl.message(
      'Linia',
      name: 'shapeLine',
      desc: '',
      args: [],
    );
  }

  /// `Trójkąt`
  String get shapeTriangle {
    return Intl.message(
      'Trójkąt',
      name: 'shapeTriangle',
      desc: '',
      args: [],
    );
  }

  /// `Czworokąt`
  String get shapeQuadrangle {
    return Intl.message(
      'Czworokąt',
      name: 'shapeQuadrangle',
      desc: '',
      args: [],
    );
  }

  /// `Kształt to:`
  String get shapeIs {
    return Intl.message(
      'Kształt to:',
      name: 'shapeIs',
      desc: '',
      args: [],
    );
  }

  /// `X`
  String get calculatorPointX {
    return Intl.message(
      'X',
      name: 'calculatorPointX',
      desc: '',
      args: [],
    );
  }

  /// `Y`
  String get calculatorPointY {
    return Intl.message(
      'Y',
      name: 'calculatorPointY',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
