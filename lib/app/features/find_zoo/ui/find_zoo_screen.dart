import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/headers.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/app_colors.dart';
import '../logic/zoo_controller.dart';
import 'widgets/zoo_item.dart';

class FindZooScreen extends StatelessWidget {
  FindZooScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final ZooController zooController = Get.find<ZooController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ResponsiveWidget(
        builder: (ctx, width, height) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  TopBar(
                    title: "Find Zoo",
                  ),
                  SizedBox(height: height / 100),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: height / 30,
                        color: AppColors.umber.withOpacity(0.4),
                      ),
                      fillColor: AppColors.searchBar,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.umber.withOpacity(0.2),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ZooItem(),
              separatorBuilder: (context, index) => SizedBox(
                height: height / 75,
              ),
              itemCount: 10,
            )
          ],
        ),
      ),
    );
  }
}
