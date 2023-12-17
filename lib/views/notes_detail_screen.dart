import 'package:crud_getx/Controller/db_controller.dart';
import 'package:crud_getx/Models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesDetails extends StatelessWidget {
  final NoteModel noteModel;
  const NotesDetails({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    DbController controller = Get.put(DbController());
    controller.titleDetails.text = noteModel.title.toString();
    controller.desDetails.text = noteModel.description.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "New Notes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.deleteNotes(noteModel.id!);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.titleDetails,
              decoration: const InputDecoration(
                hintText: "Tittle",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: controller.desDetails,
              maxLines: 20,
              decoration: const InputDecoration(
                hintText: "Description",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.addNotes();
                },
                child: Text("S A V E"))
          ],
        ),
      ),
    );
  }
}
