import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';

// class HelpOptionsBtn extends StatelessWidget {
//   HelpOptionsBtn({required this.text, required this.onClick});

//   final String text;
//   final onClick;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.grey1,
//           elevation: 0,
//           padding: EdgeInsets.zero),
//       onPressed: () {
//         if (onClick != null) {
//           onClick(text);
//         }
//       },
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               text,
//               style: Ts.medium13(AppColors.grey5),
//             ),
//           ),
//           SizedBox(width: 5.w),
//           Icon(
//             Icons.chevron_right,
//             color: AppColors.grey4,
//           ),
//         ],
//       ),
//     );
//   }
// }

class HelpOptionsBtn extends StatelessWidget {
  HelpOptionsBtn({
    required this.text,
    required this.onClick,
  });

  final String text;
  final onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.grey1,
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: () {
                if (onClick != null) {
                  onClick(text);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.w, right: 2.w, top: 10.h, bottom: 10.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: Ts.medium13(AppColors.grey5),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.grey4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
