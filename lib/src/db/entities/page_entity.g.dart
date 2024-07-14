// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageEntityAdapter extends TypeAdapter<PageEntity> {
  @override
  final int typeId = 0;

  @override
  PageEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageEntity(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PageEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pageKey)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
