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
    DeliveriesController controller = Get.put(DeliveriesController());
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
                    hintText: "Search for Delivery",
                    onChanged: (value) {},
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      )
                    ]),
              ),
              GetBuilder<DeliveriesController>(
                  id: "status",
                  builder: (controller) {
                    return Wrap(
                      spacing: 10.w,
                      children: <String>[
                        ...DeliveryStatus.values
                            .map((e) =>
                                e.toString().split(".").last.capitalizeFirst!)
                            .toList()
                      ].map((e) {
                        return ChoiceChip(
                            label: Text(e),
                            selected: controller.selectedStatus
                                    .toString()
                                    .split(".")
                                    .last
                                    .capitalizeFirst ==
                                e,
                            onSelected: (bool selected) {
                              controller.changeStatus(DeliveryStatus.values
                                  .firstWhere((element) =>
                                      element
                                          .toString()
                                          .split(".")
                                          .last
                                          .toLowerCase() ==
                                      e.toLowerCase()));
                            });
                      }).toList(),
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
                        itemBuilder: (context, item, i) =>
                            CustomDelivery(delivery: item),
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
