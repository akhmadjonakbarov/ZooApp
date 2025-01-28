import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoo_app/app/core/screens.dart';
import 'package:zoo_app/app/features/animal/data/data.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../models/animal.dart';
import 'widgets/animal_item.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      backgroundColor: AppColors.background,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => ListView(
          padding: EdgeInsets.symmetric(
            vertical: height / 30,
            horizontal: width / 25,
          ),
          children: [
            TopBar(
              title: "Learn more about animals",
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Animal animal = animals[index];
                return AnimalItem(
                  name: animal.title,
                  imgUrl: animal.imgUrl,
                  onClick: () => Get.toNamed(
                    Screens.detailAnimal,
                    arguments: animal,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: height / 95,
              ),
              itemCount: animals.length,
            )
          ],
        ),
      ),
    );
  }
}
