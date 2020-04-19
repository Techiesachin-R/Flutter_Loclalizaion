import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose language',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSwitchListTileMenuItem(
              context: context,
              title: 'English',
              locale: EasyLocalization.of(context).supportedLocales[0]),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: 'हिन्दी',
                locale: EasyLocalization.of(context).supportedLocales[6]),
            buildDivider(),
              buildSwitchListTileMenuItem(
                context: context,
                title: 'తెలుగు',
                locale: EasyLocalization.of(context).supportedLocales[5]),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: 'عربي',
                locale: EasyLocalization.of(context).supportedLocales[1]),
            buildDivider(),
       
            buildSwitchListTileMenuItem(
                context: context,
                title: 'Dutch',
                locale: EasyLocalization.of(context).supportedLocales[2]),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: 'Русский',
                locale: EasyLocalization.of(context).supportedLocales[3]),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: '中国人',
                locale: EasyLocalization.of(context).supportedLocales[4]),
            buildDivider(),

          ],
        ),
      ),
    );
  }

  Container buildDivider() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Divider(
          color: Colors.grey,
        ),
      );

  Container buildSwitchListTileMenuItem(
      {BuildContext context, String title, Locale locale}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18
            ),
          ),
          onTap: () {
            log(locale.toString(), name: toString());
            EasyLocalization.of(context).locale = locale;
            Navigator.pop(context);
          }),
    );
  }
}
