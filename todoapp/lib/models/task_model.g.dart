// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      title: reader.readString(),
      subtitle: reader.readString(),
      time: reader.readString(),
      color: Color(reader.readInt()),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.subtitle);
    writer.writeString(obj.time);
    writer.writeInt(obj.color.value);
  }
}
