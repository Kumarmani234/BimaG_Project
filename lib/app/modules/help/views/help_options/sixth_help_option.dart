import 'package:bima_g/app/modules/help/views/tell_us_how_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../custom/help_options_btn.dart';

class SixthHelpOption extends StatelessWidget {
  SixthHelpOption({required this.index});

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
          text: 'What is a refund in insurance?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'What is a claim for a refund?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'How is a premium refund calculated?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'How do I get my money back from lapsed policy?',
        ),
      ],
    );
  }
}
