import 'package:hive/hive.dart';

class WeightEntry {
  final double weightInKg;
  final DateTime entryTime;

  WeightEntry({required this.weightInKg, required this.entryTime});
}
class WeightEntryAdapter extends TypeAdapter<WeightEntry> {
  @override
  final int typeId = 1; // You can choose any unique id

  @override
  WeightEntry read(BinaryReader reader) {
    final fields = reader.readMap();
    return WeightEntry(
      weightInKg: fields['weightInKg'] as double,
      entryTime: DateTime.parse(fields['entryTime'] as String),
    );
  }

  @override
  void write(BinaryWriter writer, WeightEntry obj) {
    writer.writeMap({
      'weightInKg': obj.weightInKg,
      'entryTime': obj.entryTime.toIso8601String(),
    });
  }
}