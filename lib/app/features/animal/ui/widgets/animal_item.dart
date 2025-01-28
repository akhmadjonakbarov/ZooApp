
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class AnimalItem extends StatelessWidget {
  final Function() onClick;
  final String name;
  final String imgUrl;

  const AnimalItem({
    super.key,
    required this.onClick,
    required this.name,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => GestureDetector(
        onTap: onClick,
        child: Container(
          height: height / 4,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: CachedNetworkImageProvider(imgUrl),
            //   fit: BoxFit.cover,
            // ),
            borderRadius: BorderRadius.circular(height / 35),
            border: Border.all(color: AppColors.red, width: 3),
          ),
          child: Stack(
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error),
                  ),
                ),
              ),
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
