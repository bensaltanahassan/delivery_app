import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/linkapi.dart';

class DeliveriesData {
  Crud crud;
  DeliveriesData(this.crud);
  getDeliveryManById({
    required int id,
    int? deliveryId,
    String? deliveryStatus,
    required int page,
    required int limit,
  }) async {
    Map<String, dynamic> queryParameters = {
      "page": page,
      "limit": limit,
    };
    if (deliveryId != null) {
      queryParameters.addAll({"deliveryId": deliveryId});
    }
    if (deliveryStatus != null) {
      queryParameters.addAll({"deliveryStatus": deliveryStatus});
    }

    var response = await crud.getData(
      linkUrl: "${AppLinks.deliveries}/GetDeliveriesByDeliveryManId/$id",
      queryParameters: queryParameters,
    );
    return response.fold((l) => l, (r) => r);
  }
}
