import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';

class ToolTip extends StatelessWidget {
  final Widget child;
  final String message;

  ToolTip({
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      preferBelow: false,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(6.w),
      ),
      textStyle: Ts.regular12(AppColors.white),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onInfoIconTap(key),
        child: child,
      ),
    );
  }

  void onInfoIconTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();

    Future.delayed(Duration(milliseconds: 1500), () {
      tooltip?.deactivate();
    });
  }
}
