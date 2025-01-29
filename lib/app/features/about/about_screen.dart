import 'package:flutter/material.dart';

import '../../shared/widgets/buttons.dart';
import '../../shared/widgets/custom_scaffold.dart';
import '../../shared/widgets/responsive_widget.dart';
import '../../ui/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BasicButton(
              onClick: () {},
              title: "About App",
            ),
            BasicButton(
              onClick: () {},
              title: "Privacy Policy",
            ),
            BasicButton(
              onClick: () {},
              title: "Terms of Use",
            ),
            BasicButton(
              onClick: () {},
              title: "Contact us",
            )
          ],
        ),
      ),
    );
  }
}
