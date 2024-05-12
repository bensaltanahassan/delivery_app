import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductInOrder extends StatelessWidget {
  const CustomProductInOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      textColor: AppColors.whiteColor,
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: Image.asset(AppImageAsset.pizza)),
      title: Text(
        "Pizza",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text("\$50.000",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("\$100.00",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              )),
          Text("x2",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
