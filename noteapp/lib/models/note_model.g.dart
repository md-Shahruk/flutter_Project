// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'note_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class NoteAdapter extends TypeAdapter<Note> {
//   @override
//   final  typeId = 0;

//   @override
//   Note read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Note(
//       title: fields[0] as String,
//       addnote: fields[1] as String,
//       color: fields[2] as InvalidType,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Note obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.addnote)
//       ..writeByte(2)
//       ..write(obj.color);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is NoteAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 0;

  @override
  Note read(BinaryReader reader) {
    final title = reader.readString();
    final addnote = reader.readString();
    final colorValue = reader.readInt();
    return Note(
      title: title,
      addnote: addnote,
      color: Color(colorValue),
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.addnote);
    writer.writeInt(obj.color.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
