import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/data/model/get_deliveries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDelivery extends StatelessWidget {
  const CustomDelivery({
    super.key,
    required this.delivery,
  });

  final Delivery delivery;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.orderdetails);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.mainPadding,
                vertical: AppDimensions.mainPadding / 2)
            .r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(color: AppColors.greyColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(),
                title: Text('Order #${delivery.id}'),
                subtitle: Text('Order Date: ${delivery.createdAt}'),
                onTap: () {
                  Get.toNamed(AppRoutes.orderdetails);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.r),
              constraints: BoxConstraints(minWidth: 100.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Center(
                child: Text(
                  delivery.status!,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
