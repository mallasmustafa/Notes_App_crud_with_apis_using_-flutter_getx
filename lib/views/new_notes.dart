import 'package:crud_getx/Controller/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNotes extends StatelessWidget {
  const NewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    DbController controller = Get.put(DbController());
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
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.title,
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
              controller: controller.des,
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
