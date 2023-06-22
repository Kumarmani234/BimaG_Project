/*
 * Copyright 2020 PayG-Future POS. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * Created by Jagdish Kumawat on 12/24/20 3:34 PM
 *
 */

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/authentication/views/login_view.dart';
import 'package:bima_g/app/modules/businesses/controllers/businesses_controller.dart';
import 'package:bima_g/app/modules/compare_plans/controllers/compare_plans_controller.dart';
import 'package:bima_g/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bima_g/app/modules/fetch_address/controllers/fetch_address_controller.dart';
import 'package:bima_g/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance/controllers/health_insurance_controller.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/controllers/home_insurance_controller.dart';
import 'package:bima_g/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:bima_g/app/modules/insurance_appbar/controllers/insurance_appbar_controller.dart';
import 'package:bima_g/app/modules/near_by/controllers/near_by_controller.dart';
import 'package:bima_g/app/modules/policies/controllers/policies_controller.dart';
import 'package:bima_g/app/modules/policy_quote_list/controllers/policy_quote_list_controller.dart';
import 'package:bima_g/app/modules/profile/controllers/profile_controller.dart';
import 'package:bima_g/app/modules/profile_address/controllers/profile_address_controller.dart';
import 'package:bima_g/app/modules/profile_assets/controllers/profile_assets_controller.dart';
import 'package:bima_g/app/modules/profile_assets/views/profile_assets_view.dart';
import 'package:bima_g/app/modules/profile_family/controllers/profile_family_controller.dart';
import 'package:bima_g/app/modules/profile_pic_update/controllers/profile_pic_update_controller.dart';
import 'package:bima_g/app/modules/sort_by/controllers/sort_by_controller.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/controllers/bike_insurance_controller.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_plan_selection/controllers/two_wheeler_plan_selection_controller.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


SharedPrefs sharedPrefs = SharedPrefs.instance;

class SharedPrefs {

  static const String DEBUG_MODE = 'debugMode';
  static const String IS_LOGGED_IN = "isLoggedIn";
  static const String currentLanguage = "currentLanguage";
  static const String isLanguageSelected = "isLanguageSelected";
  static const String loginToken = "loginToken";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String phoneNumber = "phoneNumber";
  static const String userEmail = "userEmail";
  static const String userName = "userName";
  static const String dob = "dob";
  static const String gender = "gender";
  static const String uniqueUserId = "uniqueUserId";
  static const String pincodeId = "pincodeId";
  static const String pincode = "pincode";
  static const String streetAddress = "streetAddress";
  static const String profileData = "profileData";
  static const String profileImage = "profileImage";
  static const String city = "city";

  //saved address
  static const String savedAddressType = "savedAddressType";
  static const String savedStreetAddress = "savedStreetAddress";
  static const String savedPincode = "savedPincode";
  static const String savedCity = "savedCity";
  static const String savedAddressId = "savedAddressId";


  static SharedPrefs _instance = SharedPrefs._();

  SharedPrefs._();

  static SharedPrefs get instance => _instance;

  final EncryptedSharedPreferences _prefs = EncryptedSharedPreferences();

  Future<bool> setString(key, value) async {
    await _prefs.setString(key, value);
    return true;
  }

  Future<String> getString(key) async {
    String posId = await _prefs.getString(key);
    return posId;
  }


  Future<bool> isDebugMode() async {
    bool flag;
    String val = (await _prefs.getString(DEBUG_MODE));
    if (val == null) {
      flag = false;
    } else {
      if (val.toLowerCase() == 'true') {
        flag = true;
      } else {
        flag = false;
      }
    }
    return flag;
  }


  Future<bool> setDebugMode(bool flag) async {
    String debugMode = (flag == true) ? "true" : "false";
    await _prefs.setString(DEBUG_MODE, debugMode);
    return true;
  }

   onLogout() async {
     await _prefs.clear();
     await Get.delete<ProfileController>(force: true);
     await Get.delete<ProfileAddressController>(force: true);
     await Get.delete<NearByController>(force: true);
     await Get.delete<ProfileAssetsController>(force: true);
     await Get.delete<ProfileFamilyController>(force: true);
     //await Get.delete<ProfileDocumentController>(force: true);
     await Get.delete<FetchAddressController>(force: true);

     await Get.delete<DashboardController>(force: true);
     await Get.delete<HomepageController>(force: true);
     await Get.delete<BusinessesController>(force: true);
     await Get.delete<ComparePlansController>(force: true);
     await Get.delete<ForgotPasswordController>(force: true);
     await Get.delete<HealthInsuranceController>(force: true);
     await Get.delete<HomeInsuranceController>(force: true);
     await Get.delete<InsuranceAppbarController>(force: true);
     await Get.delete<PoliciesController>(force: true);
     await Get.delete<PolicyQuoteListController>(force: true);
     await Get.delete<ProfilePicUpdateController>(force: true);
     await Get.delete<SortByController>(force: true);
     await Get.delete<TwoWheelerPlanSelectionController>(force: true);
     await Get.delete<BikeInsuranceController>(force: true);
     await Get.offAll(LoginView());
  }

}
