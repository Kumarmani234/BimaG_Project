import 'package:bima_g/app/modules/agent_homepage/model/agent_item_model.dart';
import 'package:bima_g/app/modules/agent_homepage/model/insurer_item_model.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentHomepageController extends GetxController {
  final count = 0.obs;
  RxList<AgentItemModel> commisionGridList = <AgentItemModel>[].obs;
  RxList<AgentItemModel> leadStatusGridList = <AgentItemModel>[].obs;
  RxList<AgentItemModel> linkStatusGridList = <AgentItemModel>[].obs;
  RxList<InsurerItemModel> insurerList = <InsurerItemModel>[].obs;

  GlobalKey<ScaffoldState> agentScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    getCommissionList();
    getLeasStatusList();
    getLinkStatusList();
    getInsurerList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getCommissionList() {
    commisionGridList.add(AgentItemModel(
        id: 0, title: '₹10247', subtitle: 'Earned', imgUrl: AssetPath.rs_hand));
    commisionGridList.add(AgentItemModel(
        id: 1,
        title: '₹4852',
        subtitle: 'Pending',
        imgUrl: AssetPath.watch,
        status: 2));
  }

  getLeasStatusList() {
    leadStatusGridList.add(AgentItemModel(
        id: 0,
        title: '102',
        subtitle: 'Total',
        imgUrl: AssetPath.total,
        status: 0));
    leadStatusGridList.add(AgentItemModel(
      id: 1,
      title: '98',
      subtitle: 'Successful',
      imgUrl: AssetPath.successful,
    ));
    leadStatusGridList.add(AgentItemModel(
        id: 2,
        title: '2',
        subtitle: 'Pending',
        imgUrl: AssetPath.pending,
        status: 2));
    leadStatusGridList.add(AgentItemModel(
        id: 3,
        title: '2',
        subtitle: 'Failed',
        imgUrl: AssetPath.failed,
        status: 3));
  }

  getLinkStatusList() {
    linkStatusGridList.add(AgentItemModel(
        id: 0,
        title: '102',
        subtitle: 'Total',
        imgUrl: AssetPath.link,
        status: 0));
    linkStatusGridList.add(AgentItemModel(
      id: 1,
      title: '540',
      subtitle: 'Views',
      imgUrl: AssetPath.eye,
    ));
    linkStatusGridList.add(AgentItemModel(
        id: 2,
        title: '313',
        subtitle: 'Clicks',
        imgUrl: AssetPath.arrow_click,
        status: 2));
  }

  getInsurerList() {
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
  }
}
