import 'package:test_intern/core/hepler/app_input.dart';
import 'package:test_intern/presentation/pages/create_project/create_project_controller.dart';
import 'package:test_intern/resources/export/core_export.dart';

class CreateProjectPage extends GetView<CreateProjectController> {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: SizeApp.setSize(percent: .25),
            child: Stack(
              children: [
                Positioned.fill(
                  child: AppImage(
                    ImagesPath.createProjectImg,
                    height: SizeApp.setSize(percent: .25),
                    width: SizeApp.getMaxWidth(),
                  ),
                ),
                Positioned(
                    top: 20.sp,
                    left: 10.sp,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close, size: 24.sp, color: ColorResources.GREY))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.sp, left: 25.sp, right: 20.sp),
            child: Column(
              children: [
                AppInput(
                  controller: controller.nameProjectController,
                  autofocus: true,
                  colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                  maxLengthInput: 50,
                  label: "Project name".tr,
                  onChanged: (value) => controller.onNameFieldSubmitted(value),
                  labelStyle: TextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.5)),
                  type: AppInputType.TEXT,
                  maxLine: 1,
                  isBorder: true,
                  fontSize: 14.sp,
                  fillColor: Colors.transparent,
                  borderSide: BorderSide.none,
                ),
                Gap(15),
                Obx(
                  () => AppInput(
                    allowEdit: false,
                    // lấy 3 chữ cái đầu của project name in hoa để tạo project key mặc định
                    controller: TextEditingController(text: controller.keyProjectController.value),
                    autofocus: true,
                    colorDisibleBorder: Color.fromARGB(255, 11, 196, 199),
                    label: "Project key".tr,
                    labelStyle: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500, color: ColorResources.BLACK.withOpacity(.5)),
                    type: AppInputType.TEXT,
                    maxLine: 1,
                    isBorder: true,
                    fillColor: Colors.transparent,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(30),
                AppButton(
                  borderRadius: 5.sp,
                  height: 50.sp,
                  width: SizeApp.getMaxWidth(),
                  colorBG: ColorResources.MAIN_APP,
                  fontSizedLabel: 16.sp,
                  fontWeight: FontWeight.w500,
                  onTap: () {
                    controller.addProject();
                  },
                  label: "CREATE PROJECT".tr,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
