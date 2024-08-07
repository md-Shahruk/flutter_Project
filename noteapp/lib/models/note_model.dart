import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String addnote;

  @HiveField(2)
  final Color color;

  Note({
    required this.title,
    required this.addnote,
    required this.color,
  });
}
