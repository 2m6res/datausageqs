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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ` Usage Statistics permission granted, enjoy :) `
  String get usagePermGranted {
    return Intl.message(
      ' Usage Statistics permission granted, enjoy :) ',
      name: 'usagePermGranted',
      desc: '',
      args: [],
    );
  }

  /// ` Usage Statistics permission is missing :(\nPlease grant it ↓ `
  String get usagePermDenied {
    return Intl.message(
      ' Usage Statistics permission is missing :(\nPlease grant it ↓ ',
      name: 'usagePermDenied',
      desc: '',
      args: [],
    );
  }

  /// `Usage stats permission`
  String get usageStatsAlertDialogTitle {
    return Intl.message(
      'Usage stats permission',
      name: 'usageStatsAlertDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `In order for the app to get access to mobile data usage, it needs to be granted a special permission manually.\nFind DataUsageQS in the list that opens and enable the permission.`
  String get usageStatsAlertDialogDesc {
    return Intl.message(
      'In order for the app to get access to mobile data usage, it needs to be granted a special permission manually.\nFind DataUsageQS in the list that opens and enable the permission.',
      name: 'usageStatsAlertDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelOption {
    return Intl.message('Cancel', name: 'cancelOption', desc: '', args: []);
  }

  /// `Continue`
  String get continueOption {
    return Intl.message('Continue', name: 'continueOption', desc: '', args: []);
  }

  /// `Grant usage statistics permission`
  String get grantPermButton {
    return Intl.message(
      'Grant usage statistics permission',
      name: 'grantPermButton',
      desc: '',
      args: [],
    );
  }

  /// ` You might have to wait a little bit for the tile to update after granting the permission.`
  String get waitTimeInfo {
    return Intl.message(
      ' You might have to wait a little bit for the tile to update after granting the permission.',
      name: 'waitTimeInfo',
      desc: '',
      args: [],
    );
  }

  /// ` The app will not share, sell, save or publish your data under any circumstances. All your data stays on your device.`
  String get privacyConcern {
    return Intl.message(
      ' The app will not share, sell, save or publish your data under any circumstances. All your data stays on your device.',
      name: 'privacyConcern',
      desc: '',
      args: [],
    );
  }

  /// `App info`
  String get infoButton {
    return Intl.message('App info', name: 'infoButton', desc: '', args: []);
  }

  /// `GitHub repository`
  String get githubRepo {
    return Intl.message(
      'GitHub repository',
      name: 'githubRepo',
      desc: '',
      args: [],
    );
  }

  /// `Report an issue`
  String get reportIssues {
    return Intl.message(
      'Report an issue',
      name: 'reportIssues',
      desc: '',
      args: [],
    );
  }

  /// `App version: `
  String get appVersion {
    return Intl.message(
      'App version: ',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Made by 2m6res`
  String get madeBy {
    return Intl.message('Made by 2m6res', name: 'madeBy', desc: '', args: []);
  }

  /// `My website`
  String get personalWebsite {
    return Intl.message(
      'My website',
      name: 'personalWebsite',
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
      Locale.fromSubtags(languageCode: 'sk'),
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
