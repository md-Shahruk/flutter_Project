import 'package:flutter/material.dart';
import 'package:noteapp/components/drawertile.dart';

class NoteDrawer extends StatefulWidget {
  const NoteDrawer({super.key});

  @override
  State<NoteDrawer> createState() => _NoteDrawerState();
}

class _NoteDrawerState extends State<NoteDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      backgroundColor: Color.fromARGB(255, 236, 220, 220),
      child: Column(
        children: [
          //header
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.transparent),
              ),
            ),
            child: Image.asset("assets/drawer.gif"),
          ),
          //notes tile
          DrawerTile(
              title: "Notes",
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              }),

          DrawerTile(
              title: "Settings", leading: Icon(Icons.settings), onTap: () {}),
        ],
      ),
    );
  }
}
