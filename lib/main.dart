import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:weight_tracker/pages/create_profile.dart';
import 'package:weight_tracker/pages/home_page.dart';
import 'package:weight_tracker/pages/main_page.dart';

Future<void> main() async {
  // initialize hive
  Hive.initFlutter();
  // open a hive box
  // await Hive.openBox("weight_database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
