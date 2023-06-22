import 'package:bima_g/app/modules/register_business/views/tabs/business_type_tab_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/personal_info_tab_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/reg_bank_details_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/reg_business_info_tab_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/reg_document_tab_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/register_bottombar_view.dart';
import 'package:bima_g/app/modules/register_business/views/tabs/register_tabbar_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../module_controllers.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/register_business_controller.dart';

class RegisterBusinessView extends GetView<RegisterBusinessController> {
  const RegisterBusinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'register_business'.tr,
        ),
        preferredSize: Size.fromHeight(48.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: Container(
              child: RegisterTabarView(),
            ),
          ),
          Obx(
            () {
              switch (registerBusinessController.currentTabIndex.value) {
                case 0:
                  return BusinessTypeTabView();
                case 1:
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: registerBusinessController.businessInfoKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: RegBusinessInfoTabView(),
                      ),
                    ),
                  );
                case 2:
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: registerBusinessController.personalInfoKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: PersonalInfoTabView(),
                      ),
                    ),
                  );
                case 3:
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: registerBusinessController.bankDetailsKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: RegBankDetailsView(),
                      ),
                    ),
                  );
                case 4:
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: registerBusinessController.documentsKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: RegDocumentTabView(),
                      ),
                    ),
                  );
                default:
                  return SizedBox(); // handle invalid index
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: RegisterBusinessBottomBar(),
    );
  }
}


// case 0:
                //   return Expanded(
                //     child: SingleChildScrollView(
                //       physics: BouncingScrollPhysics(),
                //       child: Form(
                //         key: registerBusinessController.personalInfoKey,
                //         autovalidateMode: AutovalidateMode.onUserInteraction,
                //         child: PersonalInfoTabView(),
                //       ),
                //     ),
                //   );
                // case 1:
                //   return BusinessTypeTabView();

                // case 2:
                //   return Expanded(
                //     child: SingleChildScrollView(
                //       physics: BouncingScrollPhysics(),
                //       child: Form(
                //         key: registerBusinessController.businessInfoKey,
                //         autovalidateMode: AutovalidateMode.onUserInteraction,
                //         child: RegBusinessInfoTabView(),
                //       ),
                //     ),
                //   );
