import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

class ProfilePoliciesTabs extends StatelessWidget {
  const ProfilePoliciesTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.only(top:10.w, left: 15.w, right: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w)
      ),
      child: Obx(() => Row(
        children: [
          Expanded(
            child: OutlineButton(
              onClicked: ()=> policiesController.currentProfilePolicyTabIndex.value = 0,
              title: 'All',
              isSelected: policiesController.currentProfilePolicyTabIndex.value == 0,
            ),
          ),

          SizedBox(width: 10.w,),

          Expanded(
            child: OutlineButton(
              onClicked: ()=>policiesController.currentProfilePolicyTabIndex.value = 1,
              title: 'Active',
              isSelected: policiesController.currentProfilePolicyTabIndex.value == 1,
            ),
          ),

          SizedBox(width: 10.w,),

          Expanded(
            child: OutlineButton(
              onClicked: ()=>policiesController.currentProfilePolicyTabIndex.value = 2,
              title: 'Expired',
              isSelected: policiesController.currentProfilePolicyTabIndex.value == 2,
            ),
          )
        ],
      )),
    );
  }
}
