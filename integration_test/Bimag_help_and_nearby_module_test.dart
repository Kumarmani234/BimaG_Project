import 'package:bima_g/app/data/api_client_provider.dart';
import 'package:bima_g/main.dart' as app;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("BimaG APP: Integration Testing For NearBy and Help Modules", (WidgetTester tester) async {
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


    //Help Module
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('help_tab_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('ticket_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('open_tickets_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey( Key('concern_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));


    //Near By Module
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('nearby_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('drop_down_key')));
    await tester.pumpAndSettle();
    await tester.dragUntilVisible(
      find.byKey(const ValueKey('add_address_key')), // what you want to find
      find.byKey(ValueKey('list_key')), // widget you want to scroll
      const Offset(-800, 0),// delta to move
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('add_address_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text("Please Enter Pincode Number"), findsOneWidget);
    expect(find.text("Please Enter Street Address"), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('address_dropdown_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('pincode_key')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('pincode_key')), '533201');
    await tester.pump(Duration(seconds:2));
    await tester.tap(find.text('Save'));
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
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(Key('rounded_check_box_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('drop_down_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('business_call_key')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('info_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('services_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('photos_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('reviews_key')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Write a review'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.arrow_back_ios));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('home_tab_key')));
    await tester.pumpAndSettle();
  });
}