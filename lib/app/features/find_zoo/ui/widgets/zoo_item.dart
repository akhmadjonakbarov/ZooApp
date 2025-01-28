import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_widget.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class ZooItem extends StatelessWidget {
  const ZooItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (ctx, width, height) => Container(
        padding: EdgeInsets.all(8),
        height: height / 7,
        decoration: BoxDecoration(
            color: AppColors.zooBack, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              width: width / 3.6,
            ),
            SizedBox(
              width: width * 0.1 / 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wroclaw Zoo & Afrykarium",
                      style: GilroyTextStyle.style(
                        weight: FontWeight.w600,
                        color: AppColors.umber,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.red,
                        ),
                        Text(
                          "123 Main St, City, State, 12345",
                          style: GilroyTextStyle.style(
                            size: height / 65,
                            color: AppColors.umber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.map)
              ],
            )
          ],
        ),
      ),
    );
  }
}
