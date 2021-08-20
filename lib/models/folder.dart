import 'package:flutter_todo/models/todo.dart';
import 'package:hive/hive.dart';

part 'folder.g.dart';

@HiveType(typeId: 0)
class Folder extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late List<Todo> todo;
}
