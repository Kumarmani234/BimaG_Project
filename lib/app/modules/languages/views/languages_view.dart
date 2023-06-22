// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/buttons.dart';
import '../controllers/languages_controller.dart';
import 'language_box.dart';

class LanguagesView extends GetView<LanguagesController> {
  bool isFromMenu = false;
  LanguagesView({this.isFromMenu = false, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TopBarHelpPolicesButton(),
              SizedBox(
                height: 40.h,
              ),

              Padding(
                padding: EdgeInsets.all(20.w),
                child: SvgPicture.asset(
                  AssetPath.black_text_logo,
                  height: 25.h,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                child: Text('choose_your_language'.tr,
                    style: Ts.semiBold24(Colors.black)),
              ),

              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
                child: Text('choose_your_language_info'.tr,
                    style: Ts.regular14(AppColors.grey4)),
              ),

              SizedBox(height: 8.h),

              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: languagesController.listLanguages.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(15.w),
                    itemBuilder: (ctx, ind) => LanguageBox(
                      onClick: () => languagesController.onChangeLanguage(ind),
                      languageViewModel: languagesController.listLanguages[ind],
                      key: Key('language_${ind}_key'),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 80.h,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() => Opacity(
                  opacity: languagesController.isLoading.value ? 0.3 : 1.0,
                  child: BottomButton(
                    key: Key('continue_key'),
                    text: 'continue'.tr,
                    onClick: () => isFromMenu
                        ? Get.back()
                        : languagesController.onContinue(),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
