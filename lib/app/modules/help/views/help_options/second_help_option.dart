import 'package:bima_g/app/modules/help/views/custom/help_options_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../tell_us_how_view.dart';

class SecondHelpOption extends StatelessWidget {
  SecondHelpOption({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'I have a financial issue',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'Freelook',
        ),
      ],
    );
  }
}
