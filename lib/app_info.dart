import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_version.dart';
import 'generated/l10n.dart';

import 'package:DataUsageQS/app_info.dart';

class AppInfoRoute extends StatelessWidget {
  const AppInfoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: () { Navigator.of(context).pop(); }, icon: Icon(Icons.arrow_back_outlined)),
        title: Text(
          S.of(context).infoButton,
          style: TextStyle(fontFamily: 'NType82Regular', fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 65,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24)
                    ),
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.github,
                      size: 24,
                      color: Colors.grey.shade200,
                      weight: 100,
                    ),

                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).githubRepo,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24)
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.warning_amber_rounded,
                      size: 24,
                      color: Colors.grey.shade200,
                      weight: 100,
                    ),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).reportIssues,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    )),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: Text(
                  S.of(context).appVersion + AppVersion().appVersion,
                  style: TextStyle(
                    fontFamily: 'NType82Regular',
                    fontSize: 16,
                    color: Colors.grey.shade400
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24)
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 24,
                      color: Colors.grey.shade200,
                      weight: 100,
                    ),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).madeBy,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(28, 28, 28, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24)
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.public_outlined,
                      size: 24,
                      color: Colors.grey.shade200,
                      weight: 100,
                    ),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).personalWebsite,
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}