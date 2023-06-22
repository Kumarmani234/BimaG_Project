import 'package:bima_g/main.dart' as app;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("BimaG APP: Integration Testing For My Profile Module", (WidgetTester tester) async {
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


    //My Profile Module
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('my_profile_key')));
    await tester.pumpAndSettle();


    //Profile Info Page
    await tester.tap(find.byIcon(Icons.keyboard_arrow_right));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.tap(find.byKey(Key('first_name_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('first_name_key')), 'Kumar');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('last_name_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('last_name_key')), 'Ketha');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('mail_address_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('mail_address_key')), 'Kumar234@gmail.com');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('select_gender_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('D_O_B_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('June 2016'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2020'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('16'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.dragUntilVisible(
    find.byKey(const ValueKey('street_address_key')), // what you want to find
    find.byKey(ValueKey('D_O_B_key')), // widget you want to scroll
    const Offset(-350, 0),// delta to move
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pincode_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('pincode_key')), '533201');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 2));
    await tester.tap(find.byKey(Key('village_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('street_address_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('street_address_key')), '6-4-67/1,Ashok Nagar,533201.');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();


    //Polices Module
    await tester.tap(find.byKey(Key('policies_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.keyboard_arrow_right_outlined).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();

    //Family Module
    await tester.tap(find.byKey(Key('family_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_a_family_member_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_family_member_save_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter Member's Full Name"), findsOneWidget);
    expect(find.text('Please Enter Date Of Birth'), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('relationship_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('member_full_name_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('member_full_name_key')), 'Sri');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('DOB_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('June 2023'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2016'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('20'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('gender_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_family_member_save_key')));
    await tester.pump(Duration(seconds: 2));
    await tester.tap(find.byKey(Key('family_member_edit_key')).at(0));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('relationship_dropdown_key')).last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('member_full_name_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('member_full_name_key')), 'Kumari');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('DOB_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('June 2016'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2019'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('20'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('gender_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_family_member_save_key')));
    await tester.pumpAndSettle();


    //Assets Module
    await tester.tap(find.byKey(Key('assets_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_assets_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_assets_save_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter Registration Number"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Property'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Owned'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_assets_save_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter City Name"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('city_field_key')));
    await tester.enterText(find.byKey(Key('city_field_key')), 'Amalapuram');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('age_of_property_key')));
    await tester.enterText(find.byKey(Key('age_of_property_key')), '5');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('structure_value_key')));
    await tester.enterText(find.byKey(Key('structure_value_key')), '8000000');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('assets_policy_expire_date_key'),));
    await tester.pumpAndSettle();
    await tester.tap(find.text('June 2023'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2019'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('19'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_assets_save_key')));
    await tester.pumpAndSettle();


    //Address Module
    await tester.tap(find.byKey(Key('address_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_a_new_address_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_address_save_key')));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter Pincode Number"), findsOneWidget);
    expect(find.text("Please Enter Street Address"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('address_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pincode_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('pincode_key')), '533201');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 3));
    await tester.tap(find.byKey(Key('add_new_address_save_key')));
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
    await tester.tap(find.byKey(Key('add_new_address_save_key')));
    await tester.pump(Duration(seconds: 2));
    await tester.tap(find.byKey(Key('address_edit_key')).at(0));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('address_dropdown_key')).last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pincode_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('pincode_key')), '500062');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(Duration(seconds: 3));
    await tester.tap(find.byKey(Key('village_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('street_address_key')));
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('street_address_key')), 'North Kamala Nagar');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_new_address_save_key')));
    await tester.pumpAndSettle();


    // // //Document Module
    // await tester.tap(find.byKey(Key('document_tab_key')));
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('add_a_new_document_key')));
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('document_type_key')).first);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('document_no_key')));
    // await tester.pumpAndSettle();
    // await tester.enterText(find.byKey(Key('document_no_key')), '932397509374');
    // await tester.testTextInput.receiveAction(TextInputAction.done);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    // await tester.pumpAndSettle(Duration(seconds: 2));


    //Previous tabs and Home tab
    await tester.tap(find.byKey(Key('address_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('assets_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('family_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('policies_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('home_tab_key')));
    await tester.pumpAndSettle();
  });
}