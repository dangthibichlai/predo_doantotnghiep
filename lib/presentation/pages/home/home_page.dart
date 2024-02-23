import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/hepler/app-image.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/presentation/pages/home/home_controller.dart';
import 'package:test_intern/resources/app_color.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.BGAPP,

      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(SizeApp.RADIUS_2X),
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
            IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.add_rounded,
                ))
          ],
        ),
        const SizedBox(
          height: SizeApp.RADIUS_2X,
        ),
        Row(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: SizeApp.RADIUS_2X),
            child: Text(
              'Hello, Nhật Tân',
              textAlign: TextAlign.left,
              style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 25.sp),
            ),
          ),
        ]),
        const SizedBox(
          height: SizeApp.RADIUS_3X,
        ),
        Row(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: SizeApp.RADIUS_2X),
              child: Text(
                'Quick access',
                textAlign: TextAlign.left,
                style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 15.sp),
              )),
        ]),
        Container(
          margin: const EdgeInsets.only(left: SizeApp.RADIUS_2X, top: SizeApp.RADIUS_5X, right: SizeApp.RADIUS_2X),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(SizeApp.RADIUS_2X),
                  child: AppImage(
                    'assets/features/home/quick_access_empty.png',
                    width: SizeApp.setSizeWithWidth(percent: 0.1),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Personalize this space',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                    const SizedBox(
                      height: SizeApp.RADIUS_2X,
                    ),
                    Text(
                      'Add your most important stuff here, for fast access.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                    const SizedBox(
                      height: SizeApp.RADIUS_2X,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Add items',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 14.sp, color: ColorResources.MAIN_APP),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: SizeApp.RADIUS_3X,
        ),
        Row(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: SizeApp.RADIUS_2X),
              child: Text(
                'Recent items',
                textAlign: TextAlign.left,
                style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 15.sp),
              )),
        ]),
        Container(
          margin: const EdgeInsets.only(left: SizeApp.RADIUS_2X, top: SizeApp.RADIUS_5X, right: SizeApp.RADIUS_2X),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(SizeApp.RADIUS_2X),
                  child: AppImage(
                    'assets/features/home/recent_item_empty.png',
                    width: SizeApp.setSizeWithWidth(percent: 0.3),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Personalize this space',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                    const SizedBox(
                      height: SizeApp.RADIUS_2X,
                    ),
                    Text(
                      'Add your most important stuff here, for fast access.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.notoSans(fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                    const SizedBox(
                      height: SizeApp.RADIUS_2X,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Add items',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w500, fontSize: 14.sp, color: ColorResources.MAIN_APP),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
