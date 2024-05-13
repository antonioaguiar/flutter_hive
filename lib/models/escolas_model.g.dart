// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolas_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EscolasModelAdapter extends TypeAdapter<EscolasModel> {
  @override
  final int typeId = 0;

  @override
  EscolasModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EscolasModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EscolasModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.municipio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EscolasModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
