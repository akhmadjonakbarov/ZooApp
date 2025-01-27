import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoo_app/app/core/data_storage.dart';
import 'package:zoo_app/app/features/note/models/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  final DataStorage dataStorage = DataStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    getNotes();
    super.onInit();
  }

  void getNotes() async {
    final nts = await dataStorage.getNotes();
    for (var note in nts) {
      notes.add(note);
    }
  }

  void saveNote(Note note, Function() onReset) async {
    int row = await dataStorage.insertNote(note);
    if (row > 0) {
      Get.snackbar("Success", "Note added successfully");
      await onReset();
    }
  }
}
