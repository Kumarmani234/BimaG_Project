import 'package:get/get.dart';

import '../modules/agent_add_insurer/bindings/agent_add_insurer_binding.dart';
import '../modules/agent_add_insurer/views/agent_add_insurer_view.dart';
import '../modules/agent_comission/bindings/agent_comission_binding.dart';
import '../modules/agent_comission/views/agent_comission_view.dart';
import '../modules/agent_dashboard/bindings/agent_dashboard_binding.dart';
import '../modules/agent_dashboard/views/agent_dashboard_view.dart';
import '../modules/agent_homepage/bindings/agent_homepage_binding.dart';
import '../modules/agent_homepage/views/agent_homepage_view.dart';
import '../modules/agent_insurer/bindings/agent_insurer_binding.dart';
import '../modules/agent_insurer/views/agent_insurer_view.dart';
import '../modules/agent_lead_status/bindings/agent_lead_status_binding.dart';
import '../modules/agent_lead_status/views/agent_lead_status_view.dart';
import '../modules/agent_link_status/bindings/agent_link_status_binding.dart';
import '../modules/agent_link_status/views/agent_link_status_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/login_view.dart';
import '../modules/auto_insurance/bindings/auto_insurance_binding.dart';
import '../modules/auto_insurance/views/auto_insurance_view.dart';
import '../modules/businesses/bindings/businesses_binding.dart';
import '../modules/businesses/views/businesses_view.dart';
import '../modules/compare_plans/bindings/compare_plans_binding.dart';
import '../modules/compare_plans/views/compare_plans_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/fetch_address/bindings/fetch_address_binding.dart';
import '../modules/fetch_address/views/fetch_address_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/four_wheeler_insurance/car_insurance/bindings/car_insurance_binding.dart';
import '../modules/four_wheeler_insurance/car_insurance/views/car_insurance_view.dart';
import '../modules/health_insurance_module/health_insurance_plan_selection/bindings/health_insurance_plan_selection_binding.dart';
import '../modules/health_insurance_module/health_insurance_plan_selection/views/health_insurance_plan_selection_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_home_view.dart';
import '../modules/home_insurance_module/home_insurance/bindings/home_insurance_binding.dart';
import '../modules/home_insurance_module/home_insurance/views/home_insurance_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/info_sliders/bindings/info_sliders_binding.dart';
import '../modules/info_sliders/views/info_sliders_view.dart';
import '../modules/insurance_appbar/bindings/insurance_appbar_binding.dart';
import '../modules/insurance_appbar/views/insurance_appbar_view.dart';
import '../modules/languages/bindings/languages_binding.dart';
import '../modules/languages/views/languages_view.dart';
import '../modules/menu_drawer/bindings/menu_drawer_binding.dart';
import '../modules/menu_drawer/views/menu_drawer_view.dart';
import '../modules/near_by/bindings/near_by_binding.dart';
import '../modules/near_by/views/near_by_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/policies/bindings/policies_binding.dart';
import '../modules/policies/views/offline_policies_view.dart';
import '../modules/policy_filter/bindings/policy_filter_binding.dart';
import '../modules/policy_filter/views/policy_filter_view.dart';
import '../modules/policy_quote_list/bindings/policy_quote_list_binding.dart';
import '../modules/policy_quote_list/views/policy_quote_list_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_basic_details_form.dart';
import '../modules/profile_address/bindings/profile_address_binding.dart';
import '../modules/profile_address/views/profile_address_view.dart';
import '../modules/profile_assets/bindings/profile_assets_binding.dart';
import '../modules/profile_assets/views/profile_assets_view.dart';
import '../modules/profile_family/bindings/profile_family_binding.dart';
import '../modules/profile_family/views/profile_family_view.dart';
import '../modules/profile_pic_update/bindings/profile_pic_update_binding.dart';
import '../modules/profile_pic_update/views/profile_pic_update_view.dart';
import '../modules/register_business/bindings/register_business_binding.dart';
import '../modules/register_business/views/register_business_view.dart';
import '../modules/sort_by/bindings/sort_by_binding.dart';
import '../modules/sort_by/views/sort_by_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/topbar_authentication/bindings/topbar_authentication_binding.dart';
import '../modules/topbar_authentication/views/topbar_authentication_view.dart';
import '../modules/two_wheeler_insurance/two_wheeler_details/bindings/bike_insurance_binding.dart';
import '../modules/two_wheeler_insurance/two_wheeler_details/views/bike_insurance_view.dart';
import '../modules/webview_bimag/bindings/webview_bimag_binding.dart';
import '../modules/webview_bimag/views/webview_bimag_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANGUAGES;

  static final routes = [
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => LoginView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INFO_SLIDERS,
      page: () => InfoSlidersView(),
      binding: InfoSlidersBinding(),
    ),
    GetPage(
      name: _Paths.POLICIES,
      page: () => OfflinePoliciesView(),
      binding: OfflinePoliciesBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () => LanguagesView(),
      binding: LanguagesBinding(),
    ),
    GetPage(
      name: _Paths.TOPBAR_AUTHENTICATION,
      page: () => TopbarAuthenticationView(),
      binding: TopbarAuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.NEAR_BY,
      page: () => NearByView(),
      binding: NearByBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileBasicDetailsFormView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.BIKE_INSURANCE,
      page: () => BikeInsuranceView(),
      binding: BikeInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.CAR_INSURANCE,
      page: () => CarInsuranceView(),
      binding: CarInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.SORT_BY,
      page: () => SortByView(),
      binding: SortByBinding(),
    ),
    GetPage(
      name: _Paths.INSURANCE_APPBAR,
      page: () => InsuranceAppbarView(title: ''),
      binding: InsuranceAppbarBinding(),
    ),
    GetPage(
      name: _Paths.POLICY_FILTER,
      page: () => PolicyFilterView(),
      binding: PolicyFilterBinding(),
    ),
    GetPage(
      name: _Paths.COMPARE_PLANS,
      page: () => ComparePlansView(),
      binding: ComparePlansBinding(),
    ),
    GetPage(
      name: _Paths.POLICY_QUOTE_LIST,
      page: () => PolicyQuoteListView(),
      binding: PolicyQuoteListBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_INSURANCE_PLAN_SELECTION,
      page: () => HealthInsurancePlanSelectionView(),
      binding: HealthInsurancePlanSelectionBinding(),
    ),
    GetPage(
      name: _Paths.HOME_INSURANCE,
      page: () => HomeInsuranceView(),
      binding: HomeInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESSES,
      page: () => BusinessesView(),
      binding: BusinessesBinding(),
    ),
    GetPage(
      name: _Paths.FETCH_ADDRESS,
      page: () => FetchAddressView(),
      binding: FetchAddressBinding(),
      children: [
        GetPage(
          name: _Paths.FETCH_ADDRESS,
          page: () => FetchAddressView(),
          binding: FetchAddressBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.AUTO_INSURANCE,
      page: () => AutoInsuranceView(),
      binding: AutoInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_ASSETS,
      page: () => ProfileAssetsView(),
      binding: ProfileAssetsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_ADDRESS,
      page: () => ProfileAddressView(),
      binding: ProfileAddressBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_FAMILY,
      page: () => ProfileFamilyView(),
      binding: ProfileFamilyBinding(),
    ),
    GetPage(
      name: _Paths.WEBVIEW_BIMAG,
      page: () => const WebviewBimagView(),
      binding: WebviewBimagBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PIC_UPDATE,
      page: () => ProfilePicUpdateView(),
      binding: ProfilePicUpdateBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MENU_DRAWER,
      page: () => MenuDrawerView(),
      binding: MenuDrawerBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_BUSINESS,
      page: () => const RegisterBusinessView(),
      binding: RegisterBusinessBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_DASHBOARD,
      page: () => AgentDashboardView(),
      binding: AgentDashboardBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_INSURER,
      page: () => const AgentInsurerView(),
      binding: AgentInsurerBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_HOMEPAGE,
      page: () => const AgentHomepageView(),
      binding: AgentHomepageBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_ADD_INSURER,
      page: () => AgentAddInsurerView(),
      binding: AgentAddInsurerBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_COMISSION,
      page: () => const AgentComissionView(),
      binding: AgentComissionBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_LEAD_STATUS,
      page: () => AgentLeadStatusView(),
      binding: AgentLeadStatusBinding(),
    ),
    GetPage(
      name: _Paths.AGENT_LINK_STATUS,
      page: () => AgentLinkStatusView(),
      binding: AgentLinkStatusBinding(),
    ),
  ];
}
