import 'dart:async';
import 'dart:ui';

import 'package:DataUsageQS/app_info.dart';
import 'package:DataUsageQS/generated/l10n.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:usage_stats/usage_stats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final userSelectedLocale = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Your logic here
      supportedLocales: AppLocalizationDelegate().supportedLocales,
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      color: Colors.black,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          background: Colors.black,             // scaffold background
          surface: const Color(0xFF121212),     // cards/dialogs
          onBackground: Colors.white,
          primary: Colors.grey[300]!,           // subtle highlights
          secondary: Colors.grey[500]!,         // for accents if needed
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(title: 'DataUsageQS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late Future<bool?> _hasUsagePermission;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _hasUsagePermission = UsageStats.checkUsagePermission(); // Call once
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    setState(() {}); // force rebuild to pick up new system locale
  }

  void _refreshUsagePermission() async {
    final hasPermission = await UsageStats.checkUsagePermission();

    setState(() {
      _hasUsagePermission = Future.value(hasPermission);
    });
  }

  void openUsageSettings() async {
    const intent = AndroidIntent(
      action: 'android.settings.USAGE_ACCESS_SETTINGS',
    );

    try {
      await intent.launch();
    } catch (e) {
      debugPrint('Failed to open settings: $e');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshUsagePermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 32,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: FutureBuilder<bool?>(
                  future: _hasUsagePermission,
                  builder: (context, snapshot) {
                    final bool granted = snapshot.data == true;

                    return RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'NType82Regular',
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(
                              granted
                                  ? Icons.verified_outlined
                                  : Icons.highlight_off_outlined,
                              size: 32,
                              color: granted ? Colors.lightGreenAccent : Colors.redAccent,
                            ),
                            alignment: PlaceholderAlignment.middle,
                            baseline: TextBaseline.alphabetic,
                          ),
                          TextSpan(
                            text: granted
                                ? S.of(context).usagePermGranted
                                : S.of(context).usagePermDenied,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                  ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            buttonPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                            titlePadding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                            actionsPadding: EdgeInsets.fromLTRB(16, 0, 16, 6),
                            contentPadding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 0,
                            title: Text(
                              S.of(context).usageStatsAlertDialogTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'NType82Regular'
                              ),
                            ),
                            content: Text(
                              S.of(context).usageStatsAlertDialogDesc,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () { Navigator.of(context).pop(); },

                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                ),
                                child: Text(
                                S.of(context).cancelOption,
                                style: TextStyle(fontFamily: 'NType82Regular', fontSize: 16),
                              ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  openUsageSettings();
                                },

                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                ),
                                child: Text(
                                  S.of(context).continueOption,
                                  style: TextStyle(fontFamily: 'NType82Regular', fontSize: 16),
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    },
                    icon: Icon(
                      Icons.verified_user_outlined,
                      size: 24,
                      color: Colors.white,
                      weight: 100,
                    ),
                    label: Text(
                      S.of(context).grantPermButton,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.help_outline_outlined, size: 16, color: Colors.grey.shade600,), alignment: PlaceholderAlignment.middle),
                              TextSpan(text: S.of(context).waitTimeInfo, style: TextStyle(fontSize: 16, color: Colors.grey.shade600,))
                            ]
                        )
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            children: [
                              WidgetSpan(child: Icon(Icons.lock_outlined, size: 16, color: Colors.grey.shade600,), alignment: PlaceholderAlignment.middle),
                              TextSpan(text: S.of(context).privacyConcern, style: TextStyle(fontSize: 16, color: Colors.grey.shade600,))
                            ]
                        )
                    ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 65,
                child: TextButton.icon(

                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 0)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        /*
                        PageRouteAnimator(
                          child: const AppInfoRoute(),
                          routeAnimation: RouteAnimation.bottomToTopJoined,
                          currentChild: const MyHomePage(title: "DataUsageQS"),
                          curve: Curves.easeInOutExpo,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500)
                        )*/
                        MaterialPageRoute(
                          builder: (context) => const AppInfoRoute(),
                        )
                      );
                    },
                    icon: Icon(
                      Icons.info_outlined,
                      size: 24,
                      color: Colors.white,
                      weight: 100,
                    ),
                    label: Text(
                      S.of(context).infoButton,
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                    )),
              ),
            ],
          ),
        ),
      )
    );
  }
}