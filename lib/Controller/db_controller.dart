import 'dart:convert';
import 'package:crud_getx/Models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DbController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  String url = "https://657dcb6f3e3f5b1894632a76.mockapi.io/note";

  RxList<NoteModel> notesList = RxList<NoteModel>();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController titleDetails = TextEditingController();
  TextEditingController desDetails = TextEditingController();

  Future<void> getNotes() async {
    var response = await http.get(
      Uri.parse(url),
    );
    var notes = jsonDecode(response.body);
    notesList.clear();
    for (var note in notes) {
      notesList.add(NoteModel.fromJson(note));
    }
    print("Note get");
  }

  Future<void> addNotes() async {
    var newNote = NoteModel(
      title: title.text,
      description: des.text,
      date: DateTime.now().toString(),
      time: "",
    );
    if (title.text != "" || des.text != "") {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(newNote.toJson()),
        headers: {"Content-type": "application/json"},
      );
      if (response.statusCode == 201) {
        title.clear();
        des.clear();
        print("Note added");
        getNotes();
      }
    } else {
      print("Please enter something");
    }
  }

  Future<void> deleteNotes(String id) async {
    var newUrl = "https://657dcb6f3e3f5b1894632a76.mockapi.io/note/$id";
    final response = await http.delete(Uri.parse(newUrl));
    if (response.statusCode == 200) {
      print("Note delete");
      getNotes();
      Get.back();
    }
  }

  Future<void> updateNotes(String id) async {
    var newUrl = "https://657dcb6f3e3f5b1894632a76.mockapi.io/note/$id";
    var updatedNotes = NoteModel(
      title: titleDetails.text,
      description: desDetails.text,
    );
    var response = await http.put(Uri.parse(newUrl),
        body: jsonEncode(updatedNotes.toJson()),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      print("Note updated");
      getNotes();
    }
  }
}
