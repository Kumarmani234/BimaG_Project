import 'package:flutter/material.dart';

import 'colors.dart';

class Styles{
  static shadow(){
    return BoxShadow(
        color: AppColors.grey1,
        spreadRadius: 10,
        blurRadius: 10,
        offset: Offset(3, 3)
    );
  }

  static upperShadow(){
    return BoxShadow(
        color: AppColors.grey1,
        spreadRadius: 5,
        blurRadius: 5,
        offset: Offset(0, -5)
    );
  }

  static bottomShadow(){
    return BoxShadow(
        color: AppColors.grey2,
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 5)
    );
  }

  static bottomLightShadow(){
    return BoxShadow(
        color: AppColors.grey2,
        spreadRadius: 5,
        blurRadius: 5,
        offset: Offset(0, 2)
    );
  }

  static dropShadowZ100(){
    return BoxShadow(
        color: AppColors.dropShadow100.withOpacity(0.15),
        blurRadius: 10,
        offset: Offset(0, 4)
    );
  }

  static dropShadowZ200(){
    return BoxShadow(
        color: AppColors.dropShadow100.withOpacity(0.20),
        blurRadius: 20,
        offset: Offset(0, 8)
    );
  }

  static dropShadowZ300(){
    return BoxShadow(
        color: AppColors.dropShadow100.withOpacity(0.25),
        blurRadius: 30,
        offset: Offset(0, 16)
    );
  }
}