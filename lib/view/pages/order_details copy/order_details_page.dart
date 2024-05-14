import 'package:delivery_app/controllers/order_details/order_details_controller.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
import 'package:delivery_app/core/functions/format_date.dart';
import 'package:delivery_app/view/widgets/order_details/custom_listtile_orderdetails.dart';
import 'package:delivery_app/view/widgets/order_details/custom_product_in_order.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController c = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text('ORDER #${c.orderId}'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GetBuilder<OrderDetailsController>(builder: (c) {
        return c.statusRequest == StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(AppDimensions.mainPadding)
                    .copyWith(bottom: 0)
                    .r,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GetBuilder<OrderDetailsController>(
                          id: "orderStatus",
                          builder: (controller) {
                            return EasyStepper(
                              activeStep: controller.currentStatusIndex,
                              onStepReached: (index) {
                                if (index == 2 &&
                                    controller.order!.orderStatus ==
                                        "Shipping") {
                                  controller.markAsDelivered();
                                }
                              },
                              showLoadingAnimation: false,
                              finishedStepBackgroundColor: Colors.transparent,
                              activeStepTextColor: Colors.black87,
                              finishedStepTextColor: Colors.black87,
                              padding: EdgeInsets.zero,
                              lineStyle: LineStyle(lineLength: 60.w),
                              steps: [
                                customStep(
                                  title: "Pending",
                                  icon: Icons.pending_actions,
                                  isActive: true,
                                  isDone: true,
                                ),
                                customStep(
                                  title: "Shipping",
                                  icon: Icons.local_shipping,
                                  isActive: true,
                                  isDone: controller.currentStatusIndex > 1,
                                ),
                                customStep(
                                  title: "Delivered",
                                  icon: Icons.delivery_dining,
                                  isActive: controller.currentStatusIndex > 1,
                                  isDone: controller.currentStatusIndex >= 2,
                                  statusRequest:
                                      controller.statusRequestOfDeliveryStatus,
                                ),
                              ],
                            );
                          }),
                      SizedBox(height: (AppDimensions.mainSpacing).h),
                      CustomListTileOrderDetails(
                          title: "Address", subtitle: c.order?.adress ?? ""),
                      SizedBox(height: (AppDimensions.mainSpacing).h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomListTileOrderDetails(
                                title: "Phone",
                                subtitle: c.order?.phoneNumber ?? ""),
                          ),
                          SizedBox(width: (AppDimensions.mainSpacing).w),
                          Expanded(
                            child: CustomListTileOrderDetails(
                                title: "Date",
                                subtitle: formatDate(
                                    c.order?.createdAt.toString() ?? "")),
                          )
                        ],
                      ),
                      SizedBox(height: (AppDimensions.mainSpacing).h),
                      CustomListTileOrderDetails(
                          title: "Email", subtitle: c.order?.user?.email ?? ""),
                      SizedBox(height: (AppDimensions.mainSpacing).h),
                      CustomListTileOrderDetails(
                          title: "Payment Method",
                          subtitle: c.order?.paymentMethod ?? ""),
                      SizedBox(height: (AppDimensions.mainSpacing).h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10).r,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyColor),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                        horizontal: AppDimensions.mainSpacing,
                                        vertical: AppDimensions.mainSpacing / 3)
                                    .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Products in order",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor),
                                    ),
                                    ...(c.order?.orderItems!
                                            .map((e) => Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomProductInOrder(
                                                      orderItem: e,
                                                    ),
                                                    SizedBox(
                                                        height: (AppDimensions
                                                                .mainSpacing)
                                                            .r),
                                                  ],
                                                ))
                                            .toList() ??
                                        []),
                                  ],
                                ),
                              ),
                              ColoredBox(
                                  color: Colors.green[200]!,
                                  child: ListTile(
                                    textColor: AppColors.primaryColor,
                                    title: Text(
                                      "Total",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Text(
                                      "\$${c.order?.totalPrice!.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  EasyStep customStep({
    required String title,
    required IconData icon,
    required bool isActive,
    required bool isDone,
    StatusRequest? statusRequest,
  }) {
    return EasyStep(
        title: title,
        customStep: statusRequest == StatusRequest.loading
            ? const CircularProgressIndicator()
            : CircleAvatar(
                radius: 30.r,
                backgroundColor: isDone
                    ? Colors.green
                    : isActive
                        ? Colors.blue
                        : Colors.grey,
                child: Icon(
                  isDone ? Icons.check : icon,
                  color: AppColors.whiteColor,
                ),
              ));
  }
}
