import 'package:test_intern/core/hepler/app_input.dart';

import '../../resources/export/core_export.dart';

class DiologApp extends StatelessWidget {
  DiologApp(
      {super.key,
      this.inputController,
      required this.onTap,
      this.title,
      this.content,
      this.nameButtonLeft,
      this.nameButtonRight,
      this.lable,
      this.isInput = true});
  final TextEditingController? inputController;
  final Function onTap;
  final String? title;
  final String? content;
  final String? nameButtonLeft;
  final String? nameButtonRight;
  final String? lable;
  final bool isInput;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      insetPadding: SizeApp.setEdgeInsetsOnly(
        left: SizeApp.setSizeWithWidth(percent: .07),
        right: SizeApp.setSizeWithWidth(percent: .07),
      ),
      backgroundColor: ColorResources.WHITE,
      child: Container(
        padding: SizeApp.setEdgeInsetsOnly(
            left: SizeApp.setSizeWithWidth(percent: .05),
            right: SizeApp.setSizeWithWidth(percent: .05),
            top: SizeApp.setSize(percent: .01),
            bottom: SizeApp.setSize(percent: .01)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title ?? 'Add Column',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: ColorResources.MAIN_APP)),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 22.sp,
                      color: ColorResources.BLACK.withOpacity(.5),
                    )),
              ],
            ),
            Gap(5),
            content != null
                ? Text(
                    content!,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w400, color: ColorResources.BLACK.withOpacity(.5)),
                    textAlign: TextAlign.justify,
                  )
                : SizedBox(),
            Gap(5),
            isInput
                ? AppInput(
                    controller: inputController ?? TextEditingController(),
                    autofocus: true,
                    colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                    maxLengthInput: 50,
                    label: lable ?? 'Column name'.tr,
                    labelStyle: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 11, 196, 199)),
                    type: AppInputType.TEXT,
                    maxLine: 2,
                    isBorder: true,
                    fillColor: Colors.transparent,
                  )
                : SizedBox.shrink(),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    onTap();
                  },
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      nameButtonLeft ?? 'Add',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
                    ),
                  ),
                  highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                  focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                  splashColor: ColorResources.MAIN_APP.withOpacity(.2),
                ),
                Gap(20),
                InkWell(
                  onTap: () {
                    inputController?.clear();
                    Get.back();
                  },
                  borderRadius: BorderRadius.circular(10.sp),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      nameButtonRight ?? 'Cancel',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorResources.MAIN_APP),
                    ),
                  ),
                  highlightColor: ColorResources.MAIN_APP.withOpacity(.2),
                  focusColor: ColorResources.MAIN_APP.withOpacity(.2),
                  splashColor: ColorResources.MAIN_APP.withOpacity(.2),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
