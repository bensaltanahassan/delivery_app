import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);
  postData(
      {required String email,
      String? phone,
      required String verifyCode}) async {
    var response = await crud.postData(
      linkUrl: AppLinks.verifycodesignup,
      data: {
        "email": email,
        //TODO "phone": phone
        "verifyCode": verifyCode,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
