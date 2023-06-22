import 'package:bima_g/app/modules/help/views/custom/help_options_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../tell_us_how_view.dart';

class FourthHelpOption extends StatelessWidget {
  FourthHelpOption({required this.index});

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
          text: 'What is a claim?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'who can intimate a claim?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text:
              'Who is eligible to receive claim benefit in the absence of nomination/unfortunate demise of a nominee?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text: 'What is the average time taken to settle the claim?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text:
              'Which KYC documents are to be submitted under the following instances?',
        ),
        HelpOptionsBtn(
          onClick: (text) => Get.to(
            TellUsHowView(
              title: helpController.helpOptionsList[index].filterName,
              subtitle: text,
            ),
          ),
          text:
              'What is the average time taken to settle the claim intimated to us?',
        ),
      ],
    );
  }
}
