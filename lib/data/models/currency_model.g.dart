// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 0;

  @override
  Currency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Currency(
      currencyCode: fields[0] as String?,
      currencyName: fields[1] as String?,
      countryName: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currencyCode)
      ..writeByte(1)
      ..write(obj.currencyName)
      ..writeByte(2)
      ..write(obj.countryName)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
