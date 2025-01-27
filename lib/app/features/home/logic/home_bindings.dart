import 'package:get/get.dart';
import 'package:zoo_app/app/features/find_zoo/logic/zoo_controller.dart';
import 'package:zoo_app/app/shared/logics/note_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ZooController());
    Get.lazyPut(() => NoteController());
  }
}
