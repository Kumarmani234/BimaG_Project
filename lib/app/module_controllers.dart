import 'package:bima_g/app/modules/agent_comission/controllers/agent_comission_controller.dart';
import 'package:bima_g/app/modules/agent_dashboard/controllers/agent_dashboard_controller.dart';
import 'package:bima_g/app/modules/agent_homepage/controllers/agent_homepage_controller.dart';
import 'package:bima_g/app/modules/agent_insurer/controllers/agent_insurer_controller.dart';
import 'package:bima_g/app/modules/agent_lead_status/controllers/agent_lead_status_controller.dart';
import 'package:bima_g/app/modules/agent_link_status/controllers/agent_link_status_controller.dart';
import 'package:bima_g/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_search_controller.dart';
import 'package:bima_g/app/modules/compare_plans/controllers/compare_plans_controller.dart';
import 'package:bima_g/app/modules/member_document/controllers/member_document_controller.dart';
import 'package:bima_g/app/modules/payment/controllers/payment_controller.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/controllers/home_insurance_controller.dart';
import 'package:bima_g/app/modules/profile_family/controllers/profile_family_controller.dart';
import 'package:bima_g/app/modules/register_business/controllers/register_business_controller.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/controllers/bike_insurance_search_controller.dart';
import 'package:get/get.dart';
import '../utility/preferences.dart';
import 'data/api_client_provider.dart';
import 'modules/agent_add_insurer/controllers/agent_add_insurer_controller.dart';
import 'modules/authentication/controllers/authentication_controller.dart';
import 'modules/businesses/controllers/businesses_controller.dart';
import 'modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'modules/dashboard/controllers/dashboard_controller.dart';
import 'modules/fetch_address/controllers/fetch_address_controller.dart';
import 'modules/four_wheeler_insurance/car_insurance_plan_selection/controllers/car_insurance_plan_selection_controller.dart';
import 'modules/health_insurance_module/health_insurance/controllers/health_insurance_controller.dart';
import 'modules/health_insurance_module/health_insurance_plan_selection/controllers/health_insurance_plan_selection_controller.dart';
import 'modules/help/controllers/help_controller.dart';
import 'modules/home_insurance_module/home_insurance_plan_selection/controllers/home_insurance_plan_selection_controller.dart';
import 'modules/homepage/controllers/homepage_controller.dart';
import 'modules/info_sliders/controllers/info_sliders_controller.dart';
import 'modules/languages/controllers/languages_controller.dart';
import 'modules/near_by/controllers/near_by_controller.dart';
import 'modules/policies/controllers/policies_controller.dart';
import 'modules/policy_filter/controllers/policy_filter_controller.dart';
import 'modules/policy_quote_list/controllers/policy_quote_list_controller.dart';
import 'modules/profile/controllers/profile_controller.dart';
import 'modules/profile_assets/controllers/profile_assets_controller.dart';
import 'modules/profile_address/controllers/profile_address_controller.dart';
import 'modules/profile_pic_update/controllers/profile_pic_update_controller.dart';
import 'modules/sort_by/controllers/sort_by_controller.dart';
import 'modules/splash/controllers/splash_controller.dart';
import 'modules/topbar_authentication/controllers/topbar_authentication_controller.dart';
import 'modules/two_wheeler_insurance/two_wheeler_details/controllers/bike_insurance_controller.dart';
import 'modules/two_wheeler_insurance/two_wheeler_plan_selection/controllers/two_wheeler_plan_selection_controller.dart';

AuthenticationController authenticationController =
    Get.put(AuthenticationController());
BikeInsuranceController bikeInsuranceController =
    Get.put(BikeInsuranceController());
CarInsuranceController carInsuranceController =
    Get.put(CarInsuranceController());
DashboardController dashboardController = Get.put(DashboardController());
HelpController helpController = Get.put(HelpController());
HomepageController homepageController = Get.put(HomepageController());
InfoSlidersController infoSlidersController = Get.put(InfoSlidersController());
LanguagesController languagesController = Get.put(LanguagesController());
NearByController nearByController = Get.put(NearByController());
PoliciesController policiesController = Get.put(PoliciesController());
ProfileController profileController = Get.put(ProfileController());
SplashController splashController = Get.put(SplashController());
TopbarAuthenticationController topbarAuthenticationController =
    Get.put(TopbarAuthenticationController());
SortByController sortByController = Get.put(SortByController());
PolicyFilterController policyFilterController =
    Get.put(PolicyFilterController());
ComparePlansController comparePlansController =
    Get.put(ComparePlansController());
PolicyQuoteListController policyQuoteListController =
    Get.put(PolicyQuoteListController());
TwoWheelerPlanSelectionController twoWheelerPlanSelectionController =
    Get.put(TwoWheelerPlanSelectionController());
HealthInsuranceController healthInsuranceController =
    Get.put(HealthInsuranceController());
HealthInsurancePlanSelectionController healthInsurancePlanSelectionController =
    Get.put(HealthInsurancePlanSelectionController());

BusinessesController businessesController = Get.put(BusinessesController());
PaymentController paymentController = Get.put(PaymentController());
FetchAddressController fetchAddressController =
    Get.put(FetchAddressController());
HomeInsuranceController homeInsuranceController =
    Get.put(HomeInsuranceController());
HomeInsurancePlanSelectionController homeInsurancePlanSelectionController =
    Get.put(HomeInsurancePlanSelectionController());

PrefController prefController = Get.put(PrefController());
MemberDocumentController memberDocumentController =
    Get.put(MemberDocumentController());
ApiClientProvider apiClientProvider = Get.put(ApiClientProvider());
HomepageController homeController = Get.put(HomepageController());
BikeInsuranceSearchController bikeInsuranceSearchController =
    Get.put(BikeInsuranceSearchController());
ProfileFamilyController profileFamilyController =
    Get.put(ProfileFamilyController());
ProfileAddressController profileAddressController =
    Get.put(ProfileAddressController());
ProfileAssetsController profileAssetsController =
    Get.put(ProfileAssetsController());

CarInsuranceSearchController carInsuranceSearchController =
    Get.put(CarInsuranceSearchController());

CarInsurancePlanSelectionController carInsurancePlanSelectionController =
    Get.put(CarInsurancePlanSelectionController());

ProfilePicUpdateController profilePicUpdateController =
    Get.put(ProfilePicUpdateController());

ForgotPasswordController forgotPasswordController =
    Get.put(ForgotPasswordController());

RegisterBusinessController registerBusinessController =
    Get.put(RegisterBusinessController());

AgentDashboardController agentDashboardController =
    Get.put(AgentDashboardController());

AgentHomepageController agentHomepageController =
    Get.put(AgentHomepageController());

AgentComissionController agentComissionController =
    Get.put(AgentComissionController());

AgentLeadStatusController agentLeadStatusController =
    Get.put(AgentLeadStatusController());

AgentLinkStatusController agentLinkStatusController =
    Get.put(AgentLinkStatusController());

AgentInsurerController agentInsurerController =
    Get.put(AgentInsurerController());

AgentAddInsurerController agentAddInsurerController =
    Get.put(AgentAddInsurerController());
