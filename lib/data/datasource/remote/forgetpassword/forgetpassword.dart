import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/linkapi.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  postData(String email, {String phone = ""}) async {
    var response = await crud.postData(linkUrl: AppLinks.forgetpassword, data: {
      "users_email": email,
      "users_phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
