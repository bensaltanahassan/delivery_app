import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/linkapi.dart';

class CategorieData {
  Crud crud;
  CategorieData(this.crud);
  getdata({required String email, required String token}) async {
    var response = await crud.getData(
      linkUrl: AppLinks.categories,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
