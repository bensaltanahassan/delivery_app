import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/functions/handlingdatacontroller.dart';
import 'package:delivery_app/data/datasource/remote/orders/orders_data.dart';
import 'package:delivery_app/data/model/order_details_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final RxInt currentStatusIndex = 0.obs;
  GetOrderDetailsModel? getOrderDetailsModel;
  StatusRequest statusRequest = StatusRequest.loading;
  OrdersData ordersData = OrdersData(Get.find<Crud>());

  late int orderId;

  Future<void> getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getSingleOrder(
      orderId: orderId.toString(),
      token: "",
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      getOrderDetailsModel = GetOrderDetailsModel.fromJson(response);
    }
    update();
  }

  void changeStatusIndex(int index) {
    currentStatusIndex.value = index;
    update(["statusIndex"]);
  }

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    getOrderDetails();
    super.onInit();
  }
}
