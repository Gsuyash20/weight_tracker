// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_entryy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightEntryAdapter extends TypeAdapter<WeightEntry> {
  @override
  final int typeId = 0;

  @override
  WeightEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightEntry(
      username: fields[0] as String,
      weight: fields[1] as double,
      time: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeightEntry obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
