import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/imageassets.dart';
import 'package:delivery_app/data/model/order_details_model.dart'
    as OrderDetailsModel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductInOrder extends StatelessWidget {
  const CustomProductInOrder({
    super.key,
    required this.orderItem,
  });

  final OrderDetailsModel.OrderItems orderItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      textColor: AppColors.whiteColor,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: Image.asset(AppImageAsset.pizza)),
      title: Text(
        orderItem.product?.name ?? "",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text("\$${orderItem.product?.price ?? 0.00}",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("\$${orderItem.product!.price! * orderItem.quantity!}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              )),
          Text("x${orderItem.quantity}",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
