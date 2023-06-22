import 'package:bima_g/app/modules/help/views/custom/help_options_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../tell_us_how_view.dart';

class ThirdHelpOption extends StatelessWidget {
  ThirdHelpOption({required this.index});

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
          text: 'How to update my profile?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'How to update policy-related details',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'How to update documents',
        ),
      ],
    );
  }
}
