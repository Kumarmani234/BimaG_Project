import 'package:bima_g/app/modules/help/views/tell_us_how_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../custom/help_options_btn.dart';

class FirstHelpOption extends StatelessWidget {
  FirstHelpOption({required this.index});
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
            text: 'How can I cancel my Insurance?'),
        HelpOptionsBtn(
            onClick: (text) => Get.to(
                  TellUsHowView(
                    title: helpController.helpOptionsList[index].filterName,
                    subtitle: text,
                  ),
                ),
            text: 'What happens if I cancel the policy?'),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'Withdrawal Policy',
        ),
      ],
    );
  }
}
