import 'package:delivery_app/controllers/deliveries/deliveries_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:delivery_app/data/model/get_deliveries_model.dart';
import 'package:delivery_app/view/widgets/deliveries/custom_delivery.dart';
import 'package:delivery_app/view/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DeliveriesPage extends StatelessWidget {
  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeliveriesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Deliveries'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                color: AppColors.whiteColor,
              );
            },
          ),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.mainPadding,
                  vertical: AppDimensions.mainPadding / 2)
              .r,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
                child: SearchBar(
                    controller: controller.searchController,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: false,
                      decimal: false,
                    ),
                    hintText: "Search for Delivery",
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: controller.search,
                      )
                    ]),
              ),
              GetBuilder<DeliveriesController>(
                  id: "status",
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<String>(
                        showSelectedIcon: false,
                        style: SegmentedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          selectedBackgroundColor: AppColors.primaryColor,
                          backgroundColor: AppColors.whiteColor,
                          foregroundColor: AppColors.primaryColor,
                          selectedForegroundColor: AppColors.whiteColor,
                        ),
                        selected: controller.selectedStatusStringSet,
                        onSelectionChanged: (p0) => controller.changeStatus(
                            DeliveryStatus.values.firstWhere((element) =>
                                element
                                    .toString()
                                    .split(".")
                                    .last
                                    .capitalizeFirst ==
                                p0.first)),
                        segments: DeliveryStatus.values
                            .map((e) => ButtonSegment<String>(
                                  label: Text(e
                                      .toString()
                                      .split(".")
                                      .last
                                      .capitalizeFirst!),
                                  value: e
                                      .toString()
                                      .split(".")
                                      .last
                                      .capitalizeFirst!,
                                ))
                            .toList(),
                      ),
                    );
                  }),
              SizedBox(height: 10.h),
              Expanded(
                child: GetBuilder<DeliveriesController>(
                  id: "deliveries",
                  builder: (controller) {
                    return PagedListView<int, Delivery>(
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Delivery>(
                        noItemsFoundIndicatorBuilder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delivery_dining_outlined,
                              size: 100,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              "No Deliveries Found",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (context, item, i) => CustomDelivery(
                          delivery: item,
                          onPressed: () => controller.goToOrderDetails(
                              item.order!.id!, item.id!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
