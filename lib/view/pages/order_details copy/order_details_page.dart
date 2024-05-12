import 'package:delivery_app/controllers/order_details/order_details_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
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
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ORDER #1234'),
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
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.mainPadding)
            .copyWith(bottom: 0)
            .r,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GetBuilder<OrderDetailsController>(
                  id: "statusIndex",
                  builder: (controller) {
                    return EasyStepper(
                      activeStep: controller.currentStatusIndex.value,
                      onStepReached: (index) =>
                          controller.changeStatusIndex(index),
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
                          isDone: controller.currentStatusIndex.value > 0,
                        ),
                        customStep(
                          title: "Shipping",
                          icon: Icons.local_shipping,
                          isActive: controller.currentStatusIndex.value > 0,
                          isDone: controller.currentStatusIndex.value > 1,
                        ),
                        customStep(
                          title: "Delivered",
                          icon: Icons.delivery_dining,
                          isActive: controller.currentStatusIndex.value > 1,
                          isDone: controller.currentStatusIndex.value >= 2,
                        ),
                      ],
                    );
                  }),
              SizedBox(height: (AppDimensions.mainSpacing).h),
              const CustomListTileOrderDetails(
                title: "Address",
                subtitle: "Jl. Raya Kedung Baruk No. 1",
              ),
              SizedBox(height: (AppDimensions.mainSpacing).h),
              Row(
                children: [
                  const Expanded(
                    child: CustomListTileOrderDetails(
                      title: "Phone",
                      subtitle: "08123456789",
                    ),
                  ),
                  SizedBox(width: (AppDimensions.mainSpacing).w),
                  const Expanded(
                    child: CustomListTileOrderDetails(
                      title: "Date",
                      subtitle: "12/12/2021",
                    ),
                  )
                ],
              ),
              SizedBox(height: (AppDimensions.mainSpacing).h),
              const CustomListTileOrderDetails(
                title: "Email",
                subtitle: "bensaltanahassan@gmail.com",
              ),
              SizedBox(height: (AppDimensions.mainSpacing).h),
              const CustomListTileOrderDetails(
                title: "Payment Method",
                subtitle: "Cash",
              ),
              SizedBox(height: (AppDimensions.mainSpacing).h),
              const CustomListTileOrderDetails(
                title: "Comment",
                subtitle: "No Comment",
              ),
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
                                  color: AppColors.whiteColor),
                            ),
                            const CustomProductInOrder(),
                            SizedBox(height: (AppDimensions.mainSpacing).r),
                            const CustomProductInOrder(),
                            SizedBox(height: (AppDimensions.mainSpacing).r),
                            const CustomProductInOrder(),
                            SizedBox(height: (AppDimensions.mainSpacing).r),
                            const CustomProductInOrder(),
                            SizedBox(height: (AppDimensions.mainSpacing).r),
                            const CustomProductInOrder()
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ColoredBox(
                          color: Colors.green[200]!,
                          child: Column(
                            children: [
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Subtotal",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$100.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Shipping",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$10.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                textColor: AppColors.primaryColor,
                                title: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  "\$110.00",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EasyStep customStep({
    required String title,
    required IconData icon,
    required bool isActive,
    required bool isDone,
  }) {
    return EasyStep(
        title: title,
        customStep: CircleAvatar(
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
