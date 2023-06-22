import 'package:bima_g/app/modules/agent_lead_status/model/lead_item.dart';
import 'package:get/get.dart';

class AgentLeadStatusController extends GetxController {
  RxList<AgentLeadItemModel> leadItemsList = <AgentLeadItemModel>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    getLeadItemsList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getLeadItemsList() {
    leadItemsList.add(AgentLeadItemModel(
        username: 'Rajendra Yadav',
        email: 'rsyadav@gmail.com',
        policy: 'Car insurance',
        date: '31/05/2023',
        location: 'Ahmedabad',
        status: 2));
    leadItemsList.add(AgentLeadItemModel(
        username: 'Rajendra Yadav',
        email: 'rsyadav@gmail.com',
        policy: 'Bike insurance',
        date: '31/05/2023',
        location: 'Baroda',
        status: 2));
    leadItemsList.add(AgentLeadItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      policy: 'Health insurance',
      date: '31/05/2023',
      location: 'Surat',
    ));
    leadItemsList.add(AgentLeadItemModel(
        username: 'Rajendra Yadav',
        email: 'rsyadav@gmail.com',
        policy: 'Home insurance',
        date: '31/05/2023',
        location: 'Bhavnagar',
        status: 3));
    leadItemsList.add(AgentLeadItemModel(
        username: 'Rajendra Yadav',
        email: 'rsyadav@gmail.com',
        policy: 'Term insurance',
        date: '31/05/2023',
        location: 'Ghandhinagar',
        status: 3));
    leadItemsList.add(AgentLeadItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      policy: 'Life insurance',
      date: '31/05/2023',
      location: 'surendranagar',
    ));
    leadItemsList.add(AgentLeadItemModel(
        username: 'Rajendra Yadav',
        email: 'rsyadav@gmail.com',
        policy: 'Bike insurance',
        date: '31/05/2023',
        location: 'Ahmedabad',
        status: 2));
  }
}
