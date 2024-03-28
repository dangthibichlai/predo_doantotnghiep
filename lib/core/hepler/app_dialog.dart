import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_intern/core/hepler/generate_dialog.dart';
import 'package:test_intern/core/hepler/size-app.dart';

mixin BaseDialog {
  static Future<void> showGenerateDialog({
    required BuildContext context,
    bool? isGenerateDialog = false,
    bool? isAllowCloseOutSize = true,
    Widget? childWidget,
    Function? onWillPop,
  }) async {
    await showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        final curve = Curves.easeInOut.transform(a1.value);
        return WillPopScope(
          onWillPop: () async {
            if (onWillPop != null) {
              Get.back();
              onWillPop();
            }
            return true;
          },
          child: Transform.scale(
            scale: curve,
            child: Dialog.fullscreen(
              backgroundColor: Colors.black.withOpacity(.5),
              child: GestureDetector(
                onTap: isGenerateDialog!
                    ? null
                    : () {
                        if (isAllowCloseOutSize!) {
                          Get.back();
                        }
                      },
                child: Container(
                  width: SizeApp.getMaxWidth(),
                  height: SizeApp.getMaxHeight(),
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isGenerateDialog) const GenerateDialog() else childWidget!,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 50),
    );
  }
}
