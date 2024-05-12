import 'package:delivery_app/controllers/login/login_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widgets/buttons/custom_button.dart';
import 'package:delivery_app/view/widgets/shared/custom_text_formfield_auth.dart';
import 'package:delivery_app/view/widgets/shared/stack_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return StackAuth(
      opacity: .2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: GetBuilder<LoginController>(
              id: "loading",
              builder: (c) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (widget, animation) => ScaleTransition(
                    scale: animation,
                    child: widget,
                  ),
                  child: c.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          width: double.maxFinite,
                          buttonColor: AppColors.secondColor,
                          onPressed: () => c.login(),
                          title: "Login",
                          titleColor: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          titleSize: 20,
                        ),
                );
              }),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15).r,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(10).r,
              border: Border.all(color: AppColors.whiteColor),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
            child: Form(
              key: controller.formState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.whiteColor),
                  ),
                  const CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email",
                    fontColor: AppColors.whiteColor,
                    hintColor: AppColors.whiteColor,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.whiteColor),
                  ),
                  GetBuilder<LoginController>(
                      id: "password",
                      builder: (c) {
                        return CustomTextFormField(
                          labelText: "Password",
                          isPassword: !c.showPassword.value,
                          keyboardType: TextInputType.text,
                          fontColor: AppColors.whiteColor,
                          hintColor: AppColors.whiteColor,
                          suffixIcon: IconButton(
                            onPressed: controller.handlePassword,
                            icon: Icon(
                              c.showPassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
