import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/issue/issue_controller.dart';
import 'package:test_intern/presentation/widget/item_widget.dart';
import 'package:test_intern/resources/app_color.dart';

class IssuePage extends GetView<IssueController> {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(SizeApp.SPACE_COMPONENT),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                //add border radius here
                child: Container(
                  width: SizeApp.setSize(percent: 0.05),
                  height: SizeApp.setSize(percent: 0.05),
                  decoration: const BoxDecoration(
                    color: ColorResources.GREY,
                  ),
                  child: Image.network(
                      'https://static.vecteezy.com/system/resources/previews/011/675/382/original/man-avatar-image-for-profile-png.png'),
                ), //add image location here
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                    )),
                IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_rounded,
                    ))
              ],
            ),
          ],
        ),
        const SizedBox(
          height: SizeApp.RADIUS_2X,
        ),
        Row(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: SizeApp.SPACE_COMPONENT),
            child: Text(
              'Vấn đề',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeApp.DISPLAY_MEDIUM_FONT_SIZE),
            ),
          ),
        ]),
        const ItemWidget(),
      ],
    ));
  }
}
