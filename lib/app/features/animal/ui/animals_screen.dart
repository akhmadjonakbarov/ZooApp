import 'package:flutter/material.dart';
import 'package:zoo_app/app/ui/text_styles.dart';
import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';

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
              itemBuilder: (context, index) => AnimalItem(
                name: "Wolf",
                onClick: () {},
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: height / 95,
              ),
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }
}

class AnimalItem extends StatelessWidget {
  final Function() onClick;
  final String name;

  const AnimalItem({super.key, required this.onClick, required this.name});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onClick,
        child: Container(
          height: height / 4,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(height / 35),
              border: Border.all(color: AppColors.red, width: 3)),
          child: Stack(
            children: [
              Positioned(
                bottom: height / 50,
                left: width / 25,
                child: SizedBox(
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: GilroyTextStyle.style(size: height / 35),
                      ),
                      Transform.rotate(
                        angle: 3.1,
                        child: Icon(Icons.arrow_back_ios_new),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
