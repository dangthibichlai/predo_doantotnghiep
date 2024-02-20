import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/app_color.dart';
import 'package:icons_plus/icons_plus.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: SizeApp.SPACE_SMALL_COMPONENT,
          right: SizeApp.SPACE_SMALL_COMPONENT),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                //add border radius here
                child: Container(
                  width: SizeApp.setSize(percent: 0.04),
                  height: SizeApp.setSize(percent: 0.04),
                  decoration: const BoxDecoration(
                    color: Color(0xAADCDFE4),
                  ),
                  child: const Icon(
                    Icons.folder_outlined,
                    color: ColorResources.BLACK,
                  ),
                ),
              ),
              Text(
                'Phân công cho tôi',
                style: GoogleFonts.roboto(
                    fontSize: SizeApp.BODY_LARGE_FONT_SIZE,
                    color: ColorResources.BLACK),
              ),
              const Icon(
                FontAwesome.chevron_down_solid,
                color: ColorResources.BLACK,
              )
            ],
          )
        ],
      ),
    );
  }
}
