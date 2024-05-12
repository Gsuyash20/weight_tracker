import 'package:hive/hive.dart';
part 'weight_entryy.g.dart';

@HiveType(typeId: 0)
class WeightEntry {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final double weight;

  @HiveField(2)
  final DateTime time;

  WeightEntry({required this.username, required this.weight, required this.time});
}