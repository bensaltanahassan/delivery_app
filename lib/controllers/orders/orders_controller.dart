import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersController extends GetxController {
  final RxString selectedStatus = 'All'.obs;
  final searchController = TextEditingController();
  final _pageSize = 10;

  final PagingController<int, String> pagingController =
      PagingController(firstPageKey: 0);

  List<String> statuss =
      DeliveryStatus.values.map((e) => e.toString()).toList();

  void changeStatus(DeliveryStatus status) {
    selectedStatus.value = status.toString();
    pagingController.refresh();

    update(["status"]);
  }

  Future<List<String>> getData(int page, String statusFilter) async {
    await Future.delayed(const Duration(seconds: 2));
    final newItems = List.generate(10, (index) {
      if (statusFilter != "All") {
        return statusFilter;
      }
      return statuss[index % statuss.length];
    });
    return newItems;
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await getData(pageKey, selectedStatus.value);
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
}
