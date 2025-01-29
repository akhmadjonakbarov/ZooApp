import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoo_app/app/core/screens.dart';
import 'package:zoo_app/app/shared/widgets/buttons.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width / 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BasicButton(
                  onClick: () => Get.toNamed(Screens.animals),
                  title: "Learn More",
                ),
                BasicButton(
                  onClick: () => Get.toNamed(Screens.findZoo),
                  title: "Find Zoo",
                ),
                BasicButton(
                  onClick: () => Get.toNamed(Screens.myGallery),
                  title: "My Gallery",
                ),
                BasicButton(
                  onClick: () => Get.toNamed(Screens.about),
                  title: "About",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
