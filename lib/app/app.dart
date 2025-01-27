import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoo_app/app/features/exports.dart';
import 'package:zoo_app/app/features/home/logic/home_bindings.dart';

import 'core/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strimi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Screens.home,
      getPages: [
        GetPage(
          name: Screens.home,
          page: () => const HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: Screens.animals,
          page: () => const AnimalsScreen(),
        ),
        GetPage(
          name: Screens.detailAnimal,
          page: () => const AnimalDetailScreen(),
        ),
        GetPage(
          name: Screens.findZoo,
          page: () => FindZooScreen(),
        ),
        GetPage(
          name: Screens.myGallery,
          page: () => MyGalleryScreen(),
        ),
        GetPage(
          name: Screens.newNote,
          page: () => NoteScreen(),
        ),
        GetPage(
          name: Screens.about,
          page: () => const AboutScreen(),
        ),
      ],
    );
  }
}
