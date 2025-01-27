import 'dart:io';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/logics/note_controller.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../models/note.dart';
import 'widgets/image_box.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<String> images = [];

  final List<Uint8List> convertedImages = [];

  Future<Uint8List> convertFileToUint8List(File imageFile) async {
    return await imageFile.readAsBytes();
  }

  void selectImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        images.add(file.absolute.path);
      });
      Uint8List cim = await convertFileToUint8List(file);
      convertedImages.add(cim);
      dev.log(file.toString());
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final NoteController noteCtl = Get.find<NoteController>();

  void reset() {
    titleController.clear();
    contentController.clear();
    setState(() {
      images.clear();
      convertedImages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: height / 35,
            horizontal: width / 35,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              TopBar(
                title: "New note",
              ),
              SizedBox(
                height: height / 35,
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: "Note title",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              TextField(
                controller: contentController,
                maxLines: int.parse((height / 58).toStringAsFixed(0)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  hintText: "Note text",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              Container(
                alignment: Alignment.center,
                height: height / 8.5,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: width / 25,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Check if index is within bounds of the images list
                    String imagePath =
                        index < images.length ? images[index] : "";
                    dev.log(imagePath);
                    return ImageBox(
                      imagePath: imagePath,
                      onClick: () {
                        selectImages();
                      },
                      height: height,
                      width: width,
                    );
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              BasicButton(
                onClick: () {
                  if (titleController.text.isEmpty &&
                      contentController.text.isEmpty &&
                      convertedImages.isEmpty) {
                    Get.snackbar(
                      "Warning!",
                      "Please enter title, text and select images",
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.all(10),
                    );
                    return;
                  }
                  Note note = Note(
                    title: titleController.text,
                    text: contentController.text,
                    images: convertedImages,
                    created: DateTime.now().toString(),
                  );
                  dev.log(note.toString());
                  noteCtl.saveNote(
                    note,
                    () async {
                      reset();
                    },
                  );
                },
                title: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
