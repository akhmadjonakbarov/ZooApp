import 'package:flutter/material.dart';

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
        builder: (ctx, width, height) => ListView(
          children: [],
        ),
      ),
    );
  }
}
