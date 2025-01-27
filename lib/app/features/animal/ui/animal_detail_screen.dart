import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_scaffold.dart';
import '../../../shared/widgets/responsive_widget.dart';
import '../../../ui/text_styles.dart';


class AnimalDetailScreen extends StatelessWidget {
  const AnimalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: EdgeInsets.zero,
      body: ResponsiveWidget(
        builder: (ctx, width, height) => Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: height / 35,
                right: height / 35,
                bottom: height / 35,
              ),
              height: height / 2.5,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(height / 15),
                  bottomRight: Radius.circular(height / 15),
                ),
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Bengal Tiger",
                      style: GilroyTextStyle.style(
                        weight: FontWeight.bold,
                        size: height / 32,
                      ),
                      children: [
                        TextSpan(text: "\n"),
                        WidgetSpan(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            width: width / 1.8,
                            child: Text(
                              "Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. ",
                              style: GilroyTextStyle.style(
                                size: height / 75,
                                weight: FontWeight.w300,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.only(
                left: height / 35,
                right: height / 35,
              ),
              children: [
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat. Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat."),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat. Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat."),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat. Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat."),
                Text(
                    "Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat. Lorem ipsum dolor sit amet consectetur. Nulla ipsum rhoncus adipiscing orci viverra cursus orci eu. Tortor ipsum semper lacus sollicitudin orci facilisi. Sed tellus ut feugiat aliquet nec et urna vel. Elementum eget tellus enim velit eu duis aenean volutpat.")
              ],
            ))
          ],
        ),
      ),
    );
  }
}
