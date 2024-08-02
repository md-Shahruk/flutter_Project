import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/screen/add_task.dart';
import '../models/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Box<Task> taskbox;

  @override
  void initState() {
    super.initState();
    taskbox = Hive.box<Task>('tasks');
  }

  void _deleteTask(int index) {
    setState(() {
      taskbox.deleteAt(index);
    });
  }

  void _toggleCheckbox(int i) {
    setState(() {
      Task task = taskbox.getAt(i)!;
      task.isDone = !task.isDone;
      task.save(); // Save the updated task to Hive
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(),
        body: ValueListenableBuilder(
          valueListenable: taskbox.listenable(),
          builder: (context, Box<Task> box, _) {
            if (box.isEmpty) {
              return nodataEmoji();
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final task = box.getAt(index);
                  return Card(
                    color: task!.color,
                    child: ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (bool? value) {
                          _toggleCheckbox(index);
                        },
                      ),
                      title: task.isDone
                          ? Text(
                              task.title,
                              style: GoogleFonts.robotoMono(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : Text(
                              task.title,
                              style: GoogleFonts.robotoMono(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.subtitle,
                            style: GoogleFonts.robotoMono(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 20,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  task.time,
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _deleteTask(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newTask = await Navigator.push<Task>(
              context,
              MaterialPageRoute(builder: (context) => const AddTask()),
            );
            if (newTask != null) {
              setState(() {
                taskbox.add(newTask);
              });
            }
          },
          backgroundColor: const Color.fromRGBO(100, 68, 200, 1),
          elevation: 0.0,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: Text(
        "Task List",
        style: GoogleFonts.robotoMono(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
      centerTitle: true,
    );
  }

  Widget nodataEmoji() {
    return Center(
      child: Image.asset("assets/nodata.gif"),
    );
  }
}
