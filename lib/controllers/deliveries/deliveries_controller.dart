import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:delivery_app/core/functions/handlingdatacontroller.dart';
import 'package:delivery_app/data/datasource/remote/deliveries/deliveries_data.dart';
import 'package:delivery_app/data/model/get_deliveries_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DeliveriesController extends GetxController {
  DeliveryStatus selectedStatus = DeliveryStatus.All;
  String get selectedStatusString => selectedStatus.toString().split(".").last;
  Set<String> get selectedStatusStringSet => {selectedStatusString};
  final searchController = TextEditingController();
  final _pageSize = 10;
  DeliveriesData deliveriesData = DeliveriesData(Get.find<Crud>());

  final PagingController<int, Delivery> pagingController =
      PagingController(firstPageKey: 1);

  List<String> statuss =
      DeliveryStatus.values.map((e) => e.toString()).toList();

  void changeStatus(DeliveryStatus status) {
    selectedStatus = status;
    pagingController.refresh();

    update(["status"]);
  }

  Future<List<Delivery>> getDeliveries(int page) async {
    StatusRequest statusRequest = StatusRequest.loading;
    List<Delivery> deliveries = [];
    var response = await deliveriesData.getDeliveryManById(
      id: 1,
      page: page,
      limit: _pageSize,
      deliveryStatus:
          selectedStatus == DeliveryStatus.All ? null : selectedStatusString,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      final GetDeliveriesModel getDeliveryManModel =
          GetDeliveriesModel.fromJson(response);
      deliveries = getDeliveryManModel.data!;
    }
    return deliveries;
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await getDeliveries(pageKey);

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    pagingController.dispose();
    super.onClose();
  }

  void goToOrderDetails(int orderId) {
    Get.toNamed(AppRoutes.orderdetails, arguments: {"orderId": orderId});
  }
}
