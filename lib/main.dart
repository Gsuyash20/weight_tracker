import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weight_tracker/pages/create_profile.dart';
import 'model/weight_entryy.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await Hive.initFlutter();
  Hive.registerAdapter(WeightEntryAdapter());
  if (!Hive.isBoxOpen('Weight_Database')) {
    await Hive.openBox<WeightEntry>(
      "Weight_Database",
    ); // Open the box with the specific type
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
