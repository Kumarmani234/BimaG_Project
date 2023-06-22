import 'package:bima_g/app/modules/agent_link_status/model/link_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentLinkStatusController extends GetxController {
  RxList<AgentLinkItemModel> linkItemList = <AgentLinkItemModel>[].obs;

  Rx<TextEditingController> linkTitleController = TextEditingController().obs;
  Rx<TextEditingController> linkNameController = TextEditingController().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getLinkItemList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getLinkItemList() {
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
    linkItemList.add(AgentLinkItemModel(
        date_time: '13 April, 02:14 PM',
        link: 'www.bimag.com/hardikUrlRegister',
        earn: 102,
        views: 540,
        clicks: 313));
  }
}
