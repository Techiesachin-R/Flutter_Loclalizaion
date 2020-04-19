
import 'package:flutter/material.dart';

import 'dart:developer';
import 'dart:ui';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'lang_view.dart';


void main() => runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'DZ'),
      Locale('de', 'DE'),
      Locale('ru', 'RU'),
      Locale('zh', 'HK'),
      Locale('te', 'TE'),
      Locale('hi', 'HI')
    ],
    path: 'assets',
  ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(EasyLocalization.of(context).locale.toString(),
        name: '${this} # locale');
    log('title'.tr().toString(), name: '${this} # locale');

      return MaterialApp(
      title: 'title'.tr(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Easy localization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
        appBar: AppBar(
          title: Text('title').tr(),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.language, color: Colors.white,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LanguageView()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('content', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),).tr(),
              Text('pushTimes').tr(),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }
}
