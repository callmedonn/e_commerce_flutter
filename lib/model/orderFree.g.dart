// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderFree.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderFreeAdapter extends TypeAdapter<OrderFree> {
  @override
  final int typeId = 4;

  @override
  OrderFree read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderFree(
      id: fields[0] as String,
      total: fields[1] as String,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderFree obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.total)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderFreeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
