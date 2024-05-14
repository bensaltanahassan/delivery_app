import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:delivery_app/core/functions/handlingdatacontroller.dart';
import 'package:delivery_app/data/datasource/remote/deliveries/deliveries_data.dart';
import 'package:delivery_app/data/datasource/remote/orders/orders_data.dart';
import 'package:delivery_app/data/model/order_details_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  int currentStatusIndex = 0;
  GetOrderDetailsModel? getOrderDetailsModel;
  Order? get order => getOrderDetailsModel!.order;

  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest? statusRequestOfDeliveryStatus;
  OrdersData ordersData = OrdersData(Get.find<Crud>());

  DeliveriesData deliveriesData = DeliveriesData(Get.find<Crud>());

  late int orderId;
  late int deliveryId;

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
      if (getOrderDetailsModel!.order!.orderStatus == "Delivered") {
        currentStatusIndex = 2;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderId = Get.arguments["orderId"];
    deliveryId = Get.arguments["orderId"];
    getOrderDetails();
    super.onInit();
  }

  void markAsDelivered() async {
    statusRequestOfDeliveryStatus = StatusRequest.loading;
    update(["orderStatus"]);
    var response = await deliveriesData.updateDeliveryStatus(
      deliveryId: deliveryId,
      status: DeliveryStatus.Delivered,
    );
    statusRequestOfDeliveryStatus = handlingData(response);
    if (statusRequestOfDeliveryStatus == StatusRequest.success) {
      currentStatusIndex = 2;
      order!.orderStatus = "Delivered";
    }
    update(["orderStatus"]);
  }
}
