// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appVersion": MessageLookupByLibrary.simpleMessage("App version: "),
    "cancelOption": MessageLookupByLibrary.simpleMessage("Cancel"),
    "continueOption": MessageLookupByLibrary.simpleMessage("Continue"),
    "githubRepo": MessageLookupByLibrary.simpleMessage("GitHub repository"),
    "grantPermButton": MessageLookupByLibrary.simpleMessage(
      "Grant usage statistics permission",
    ),
    "infoButton": MessageLookupByLibrary.simpleMessage("App info"),
    "madeBy": MessageLookupByLibrary.simpleMessage("Made by 2m6res"),
    "personalWebsite": MessageLookupByLibrary.simpleMessage("My website"),
    "privacyConcern": MessageLookupByLibrary.simpleMessage(
      " The app will not share, sell, save or publish your data under any circumstances. All your data stays on your device.",
    ),
    "reportIssues": MessageLookupByLibrary.simpleMessage("Report an issue"),
    "usagePermDenied": MessageLookupByLibrary.simpleMessage(
      " Usage Statistics permission is missing :(\nPlease grant it ↓ ",
    ),
    "usagePermGranted": MessageLookupByLibrary.simpleMessage(
      " Usage Statistics permission granted, enjoy :) ",
    ),
    "usageStatsAlertDialogDesc": MessageLookupByLibrary.simpleMessage(
      "In order for the app to get access to mobile data usage, it needs to be granted a special permission manually.\nFind DataUsageQS in the list that opens and enable the permission.",
    ),
    "usageStatsAlertDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Usage stats permission",
    ),
    "waitTimeInfo": MessageLookupByLibrary.simpleMessage(
      " You might have to wait a little bit for the tile to update after granting the permission.",
    ),
  };
}
