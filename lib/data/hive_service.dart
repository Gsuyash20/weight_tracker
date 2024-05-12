import 'package:hive_flutter/hive_flutter.dart';
import '../model/weight_entry.dart';

class HiveService {
  final _box = Hive.box<WeightEntry>('Weight_Database');

  Future<void> addWeight(String username, double weight, DateTime time) async {
    // final box = Hive.box<WeightEntry>(_boxName);
    await _box.add(WeightEntry(username: username, weight: weight, time: time));
  }

  Future<List> getWeights() async {
    // final box =  Hive.box<WeightEntry>(_boxName);
    return _box.values.toList();
  }

  void submitWeight(double weight, DateTime time) async {
    List weights = await getWeights();
    if (weights.isNotEmpty) {
      String username =
          weights.first.username; // Retrieve username from the first entry
      await addWeight(username, weight, time);
    }
  }

  Future<String?> getUsername() async {
    // final box =  Hive.box<WeightEntry>(_boxName);
    final weights = _box.values.toList();
    if (weights.isNotEmpty) {
      return weights.first.username;
    }
    return 'User does not exist'; // Return, if no weight entries exist in the database
  }

  Future<void> deleteAllUserData() async {
    // final box =  Hive.box(_boxName);
    await _box.clear(); // Clear all data in the box
  }

  Future<List<WeightEntry>> getWeightEntries() async {
    List<WeightEntry> entries = _box.values.toList();
    return entries;
  }
}
