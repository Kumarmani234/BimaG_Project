import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';

class WithdrawelLinkStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: agentComissionController.withdrawelDetailLinkList.length,
          itemBuilder: (ctx, ind) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailRow(
                icon: Icons.check,
                title: agentComissionController
                    .withdrawelDetailLinkList[ind].statusName,
                time: agentComissionController
                    .withdrawelDetailLinkList[ind].date_n_time,
              ),
              if (ind !=
                  (agentComissionController.withdrawelDetailLinkList.length -
                      1))
                Dash()
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  DetailRow({
    required this.icon,
    required this.title,
    required this.time,
  });
  final IconData icon;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.w,
          width: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.green),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 15.w,
              color: AppColors.green,
            ),
          ),
        ),
        SizedBox(width: 13.w),
        Expanded(
          child: Text(
            title,
            style: Ts.regular15(AppColors.grey5),
          ),
        ),
        Text(
          time,
          style: Ts.regular12(AppColors.grey4),
        ),
      ],
    );
  }
}

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.5.w),
      child: CustomPaint(
        painter: DashedLineVerticalPainter(),
        size: Size(1.w, 17.h),
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 3.h, dashSpace = 2.h, startY = 0;
    final paint = Paint()
      ..color = AppColors.green
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
