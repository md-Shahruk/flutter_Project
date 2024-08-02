import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/models/task_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleText = TextEditingController();
  TextEditingController subtitleText = TextEditingController();
  Color selectedColor = Colors.white;
  TimeOfDay? stratTime;
  TimeOfDay? endTime;

  void _addTask() {
    final title = titleText.text;
    final subtitle = subtitleText.text;

    //Convert Start time and end time readable format

    final strTime = stratTime != null ? stratTime!.format(context) : 'N/A';
    final enTime = endTime != null ? endTime!.format(context) : 'N/A';
    final time = "$strTime - $enTime";

    //final time = DateTime.now();

    final newTask = Task(
        title: title, subtitle: subtitle, time: time, color: selectedColor);

    Navigator.pop(context, newTask);
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          stratTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sHeightSize = MediaQuery.of(context).size.height;
    var sWidthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task",
          style: GoogleFonts.robotoMono(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: sWidthSize * 0.08, top: sHeightSize * 0.05),
              height: sHeightSize * 0.1,
              width: sWidthSize * 0.85,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(248, 232, 238, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: sWidthSize * 0.011,
                    horizontal: sHeightSize * 0.03),
                // padding: EdgeInsets.all(8.0),

                child: TextField(
                  controller: titleText,
                  decoration: const InputDecoration(
                    hintText: "Add Title",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: sWidthSize * 0.08, top: sHeightSize * 0.05),
              height: sHeightSize * 0.2,
              width: sWidthSize * 0.85,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(248, 232, 238, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: sWidthSize * 0.025,
                    horizontal: sHeightSize * 0.03),
                child: TextField(
                  controller: subtitleText,
                  decoration: const InputDecoration(
                    hintText: "Add Subtitle",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sHeightSize * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: sWidthSize * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => _selectTime(context, true),
                    child: Text(
                      "Start Time",
                      style: GoogleFonts.robotoMono(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectTime(context, false),
                    child: Text(
                      " End Time",
                      style: GoogleFonts.robotoMono(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildColor(const Color.fromRGBO(221, 240, 201, 1)),
                _buildColor(const Color.fromRGBO(250, 242, 234, 1)),
                _buildColor(const Color.fromRGBO(206, 206, 245, 1)),
              ],
            ),
            SizedBox(
              height: sHeightSize * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: _addTask,
                    child: Text(
                      "Add",
                      style: GoogleFonts.robotoMono(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.robotoMono(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColor(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:
                    selectedColor == color ? Colors.black : Colors.transparent,
                width: 2)),
      ),
    );
  }
}
