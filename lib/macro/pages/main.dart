import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:appoint/macro/controllers/data_controller.dart';
import 'package:appoint/macro/controllers/theme_controller.dart';
import 'package:appoint/macro/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('data');
  await Hive.openBox('theme');
  runApp(MyAppcro());
}

class MyAppcro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: Consumer<ThemeController>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Macro Calculator',
            home: HomePage(),
            theme: ThemeData(
              primaryColor: Colors.red,
              accentColor: Colors.redAccent,
              brightness: theme.brightness,
            ),
          );
        },
      ),
    );
  }
}
