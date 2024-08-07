import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class EditNote extends StatefulWidget {
  final Note note;
  const EditNote({super.key, required this.note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController titleText = TextEditingController();
  TextEditingController addnoteText = TextEditingController();
  //Color selectcolor=Colors.white;

  late Color selectcolor;

  @override
  void initState() {
    super.initState();
    titleText = TextEditingController(text: widget.note.title);
    addnoteText = TextEditingController(text: widget.note.addnote);
    selectcolor = widget.note.color;
  }

  void _editNote() {
    final title = titleText.text;
    final addnote = addnoteText.text;

    // final newNote = Note(title: title, addnote: addnote, color: selectcolor);

    // Navigator.pop(context, newNote);
    if (title.isNotEmpty && addnote.isNotEmpty) {
      final editNote = Note(
        title: title,
        addnote: addnote,
        color: selectcolor,
      );
      Navigator.pop(context, editNote);
    } else {
      final snackbar = AnimatedSnackBar(
        builder: ((context) {
          return Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            height: 25,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('Please fill in all fields.'),
          );
        }),
      );
      snackbar.show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textFeild(
                "Title",
                20,
                titleText,
                Colors.black,
                null,
              ),
              textFeild("Add Note", 18, addnoteText, Colors.grey.shade500, 4),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: _editNote,
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      //backgroundColor: const Color.fromARGB(255, 39, 38, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Edit",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 236, 224, 224),
      title: Text(
        "Edit Note",
        style: GoogleFonts.robotoMono(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 22,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget textFeild(String hintext, double? fontsize,
      TextEditingController controller, Color color, int? maxline) {
    return SingleChildScrollView(
      child: TextField(
        controller: controller,
        maxLines: maxline,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintext,
          hintStyle: GoogleFonts.robotoMono(fontSize: fontsize, color: color),
        ),
      ),
    );
  }
}
