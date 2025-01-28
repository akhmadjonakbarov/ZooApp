
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../../../core/screens.dart';
import '../../../shared/logics/note_controller.dart';
import '../../../shared/widgets/buttons.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../note/models/note.dart';
import 'widgets/gallery_item.dart';

class MyGalleryScreen extends StatefulWidget {
  const MyGalleryScreen({super.key});

  @override
  State<MyGalleryScreen> createState() => _MyGalleryScreenState();
}

class _MyGalleryScreenState extends State<MyGalleryScreen> {
  final NoteController noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: CustomScaffold(
        body: ResponsiveWidget(
          builder: (ctx, width, height) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopBar(title: "My Gallery"),
              Obx(
                () => SizedBox(
                  height: height * 0.79,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: noteController.notes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final Note note = noteController.notes[index];
                      return GalleryItem(
                        title: note.title,
                        date: DateFormat("dd/MM/yyyy HH:mm")
                            .format(DateTime.parse(note.created)),
                        image: note.images.first,
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: height / 12,
                padding: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                ),
                alignment: Alignment.center,
                child: BasicButton(
                    onClick: () {
                      Get.toNamed(Screens.newNote);
                    },
                    title: "+ add new note"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
