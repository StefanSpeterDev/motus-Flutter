import 'package:flutter/material.dart';

import '../../../main.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  Icon _icon = Icon(Icons.dark_mode);

  @override
  Widget build(BuildContext context) {
    _icon = Icon(MyApp.themeNotifier.value == ThemeMode.light
        ? Icons.dark_mode
        : Icons.light_mode);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the AccueilPage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: _icon,
                onPressed: () {
                  setState(() {
                    MyApp.themeNotifier.value =
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  });
                })
          ],
        ),
        body: Container(
          child: Text('Accueil'),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
