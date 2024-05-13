import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/constants.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';
import 'package:delivery_app/core/functions/format_date.dart';
import 'package:delivery_app/data/model/get_deliveries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDelivery extends StatelessWidget {
  const CustomDelivery({
    super.key,
    required this.delivery,
    required this.onPressed,
  });

  final Delivery delivery;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  delivery.order?.user?.fullName ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formatDate(delivery.createdAt.toString()),
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                ),
                Text(
                  delivery.order?.adress ?? "",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  delivery.order?.phoneNumber ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  delivery.status ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: delivery.status ==
                            DeliveryStatus.Shipping.toString().split('.').last
                        ? Colors.orange
                        : Colors.green,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                          color: AppColors.primaryColor, width: 1),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
