import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class ImageBox extends StatelessWidget {
  final Function() onClick;
  final double height;
  final double width;
  final String imagePath;

  const ImageBox(
      {super.key,
        required this.onClick,
        required this.height,
        required this.width,
        required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [10, 10],
        color: imagePath.isEmpty ? Colors.grey : Colors.transparent,
        strokeWidth: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: height / 8,
            width: width * 0.26,
            child: imagePath.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svgs/image.svg",
                ),
                SizedBox(
                  height: height * 0.1 / 25,
                ),
                Text(
                  "Add image",
                  style: GilroyTextStyle.style(
                      color: AppColors.umber, size: height / 75),
                )
              ],
            )
                : Image.file(
              File(imagePath),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
