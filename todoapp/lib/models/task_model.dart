import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String time;
  @HiveField(3)
  Color color;
  @HiveField(4)
  bool isDone;

  Task(
      {required this.title,
      required this.subtitle,
      required this.time,
      required this.color,
      this.isDone = false});
}
