import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/screen/addnote_screen.dart';
import 'package:noteapp/screen/drawer.dart';
import 'package:noteapp/screen/edit_note.dart';

class NoteHome extends StatefulWidget {
  const NoteHome({super.key});

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {
  late Box<Note> boxNote;

  @override
  void initState() {
    super.initState();
    boxNote = Hive.box<Note>('notes');
  }

  // Delete Note
  void _deleteNote(int index) {
    setState(() {
      boxNote.deleteAt(index);
    });
  }

  // Add Note
  Future<void> _addNote() async {
    final newNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (context) => const AddNote()),
    );
    if (newNote != null) {
      setState(() {
        boxNote.add(newNote);
      });
    }
  }

  ///edit Note
  Future<void> _editNote(int index) async {
    final noteToEdit = boxNote.getAt(index);
    if (noteToEdit == null) return;

    final editedNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(
        builder: (context) => EditNote(note: noteToEdit),
      ),
    );

    if (editedNote != null) {
      setState(() {
        boxNote.putAt(index, editedNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 224, 224),
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 17, top: 0),
          child: ValueListenableBuilder(
            valueListenable: boxNote.listenable(),
            builder: (context, Box<Note> box, _) {
              if (box.isEmpty) {
                return const Center(
                  child: Text('No notes available'),
                );
              } else {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.getAt(index);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        noteBox(note!.title, note.addnote, index, note.color,
                            _deleteNote, _editNote),
                        const SizedBox(height: 5),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
        drawer: const NoteDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _addNote,
          backgroundColor: const Color.fromARGB(255, 161, 101, 76),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          color: Color.fromARGB(255, 219, 201, 201),
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 236, 224, 224),
      elevation: 0.0,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Icon(Icons.menu,
                  size: 27, color: Color.fromARGB(255, 39, 38, 38)),
            ),
          );
        },
      ),
    );
  }

  Widget noteBox(String title, String addnote, int index, Color color,
      void Function(int) onDelete, void Function(int) onEdit) {
    final nWidthSize = MediaQuery.of(context).size.width;
    return Container(
      width: nWidthSize * 0.92,
      decoration: BoxDecoration(
        //color: const Color.fromARGB(255, 233, 213, 182),
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 50, 44, 25),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.robotoMono(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        onDelete(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onEdit(index);
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              addnote,
              style: GoogleFonts.robotoMono(
                fontSize: 15,
                color: const Color.fromARGB(255, 36, 35, 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
