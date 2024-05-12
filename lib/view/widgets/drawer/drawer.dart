import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.secondColor))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "BENSALTANA HASSAN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                    onPressed: () {},
                    child: const Text(
                      "View Profile",
                      style: TextStyle(color: AppColors.secondColor),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDrawetItem(
                  title: "Home",
                  icon: Icons.home_outlined,
                  onPressed: () {},
                  isSelected: false,
                ),
                SizedBox(height: 20.h),
                CustomDrawetItem(
                  title: "Notifications",
                  icon: Icons.notifications_outlined,
                  onPressed: () {},
                  isSelected: false,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20).r,
            child: CustomButton(
              radius: 30,
              buttonColor: AppColors.secondColor,
              title: "Log Out",
              titleColor: AppColors.whiteColor,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 20.h)
        ],
      ),
    );
  }
}

class CustomDrawetItem extends StatelessWidget {
  const CustomDrawetItem({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      ),
      label: Text(
        title,
        style: TextStyle(
            color: isSelected ? AppColors.primaryColor : AppColors.whiteColor),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              isSelected ? AppColors.secondColor : Colors.teal),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.maxFinite, 1)),
          alignment: Alignment.centerLeft,
          padding: MaterialStatePropertyAll(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r)),
    );
  }
}
