import 'package:bima_g/main.dart' as app;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("BimG APP: Integration Testing For Agent Module", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    //Language Module
    await tester.tap(find.byKey(Key('language_0_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('continue_key')));
    await tester.pump(Duration(seconds: 2));


    //Info Sliders Module
    for (int i = 0; i <= 3; i++) {
      await tester.tap(find.byKey(Key('info_sliders_key')));
      await tester.pump();
    }
    await tester.pump(Duration(seconds: 1));
    await tester.tap(find.byKey(Key('check_box_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('verify_num_n_login_key')));
    await tester.pump(Duration(seconds: 2));


    //Login Module
    await tester.tap(find.byKey(Key('mobile_no_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('mobile_no_key')), '6305889568');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('login_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('password_field_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('password_field_key')), '1234567890');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('login_key')));
    await tester.pump(Duration(seconds: 2));


    //Agent Module
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('menu_drawer_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('agent_tap_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('commission_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('all_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('earned_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pending_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('withdrawal_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('withdraw_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('amount_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('amount_key')), '1500');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('drop_key')));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byIcon(Icons.cancel_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('lead_status_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('link_status_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('create_link_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('link_title_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('link_title_key')), 'PayG');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('link_name_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('link_name_key')), 'payg.in');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.cancel_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurer_0_key'),));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('buy_new_policy_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurance_type_0_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurance_type_1_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurance_type_2_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurance_type_3_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.cancel_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('insurer_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add Insurer'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_insurer_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('add_documents_key')));
    await tester.pumpAndSettle();
    expect(find.text('Please Enter First Name'), findsOneWidget);
    expect(find.text('Please Enter Last Name'), findsOneWidget);
    expect(find.text('Please Enter Date Of Birth'), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('first_name_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey( Key('first_name_key')), 'Sri Kumar');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('last_name_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey( Key('last_name_key')), 'Asapu');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('mobile_no_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey( Key('mobile_no_key')), '6305889568');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('email_address_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey( Key('email_address_key')), 'kumar@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('D_O_B_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('June 2023'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2018'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('13'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.dragUntilVisible(
      find.byKey(const ValueKey('street_address_key')), // what you want to find
      find.byKey(ValueKey('D_O_B_key')), // widget you want to scroll
      const Offset(-250, 0),// delta to move
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_documents_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter Pincode Number"), findsOneWidget);
    expect(find.text("Please Enter Street Address"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pincode_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('pincode_key')), '533201');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 3));
    await tester.tap(find.byKey(Key('add_documents_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Select Village"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('village_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('street_address_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('street_address_key')), '6-4-67/1,Ashok nagar,Amalapuram,533201');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_documents_key')));
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('add_a_new_document_key')));
    // await tester.pumpAndSettle();
    // await tester.tap(find.text('Save'));
    // await tester.pumpAndSettle();
    // expect(find.text('Document No is required'), findsOneWidget);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('document_type_key')).first);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('document_no_key')));
    // await tester.pumpAndSettle();
    // await tester.enterText(find.byKey(Key('document_no_key')), '932397509374');
    // await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.cancel_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('home_tab_key')));
    await tester.pumpAndSettle();
  });
}