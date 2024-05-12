import 'package:delivery_app/controllers/orders/orders_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:delivery_app/view/widgets/drawer/drawer.dart';
import 'package:delivery_app/view/widgets/orders/custom_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
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
                    hintText: "Search for orders",
                    onChanged: (value) {},
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      )
                    ]),
              ),
              GetBuilder<OrdersController>(
                  id: "status",
                  builder: (controller) {
                    return Wrap(
                      spacing: 10.w,
                      children: <String>[
                        "All",
                        ...DeliveryStatus.values
                            .map((e) => e.toString())
                            .toList()
                      ].map((e) {
                        return ChoiceChip(
                          label: Text(e),
                          selected: controller.selectedStatus.value == e,
                          onSelected: (bool selected) {
                            controller.changeStatus(DeliveryStatus.values
                                .firstWhere(
                                    (element) => element.toString() == e));
                          },
                        );
                      }).toList(),
                    );
                  }),
              SizedBox(height: 10.h),
              Expanded(
                child: GetBuilder<OrdersController>(
                  id: "orders",
                  builder: (controller) {
                    return PagedListView<int, String>(
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<String>(
                        itemBuilder: (context, item, i) => CustomOrder(
                          id: i,
                          status: item,
                        ),
                      ),
                    );
                    // ListView.separated(
                    //   physics: const BouncingScrollPhysics(),
                    //   itemCount: 20,
                    //   separatorBuilder: (BuildContext context, int index) {
                    //     return SizedBox(height: 10.h);
                    //   },
                    //   itemBuilder: (BuildContext context, int i) {
                    //     return CustomOrder(
                    //       status: i % 3 == 0
                    //           ? "Pending"
                    //           : i % 2 == 0
                    //               ? "Shipping"
                    //               : "Delivered",
                    //     );
                    //   },
                    // );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
