import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/core/constant/linkapi.dart';
import 'package:delivery_app/core/enums/delivery_status.dart';

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
    print(queryParameters);

    var response = await crud.getData(
      linkUrl: "${AppLinks.deliveries}/GetDeliveriesByDeliveryManId/$id",
      queryParameters: queryParameters,
    );
    return response.fold((l) => l, (r) => r);
  }

  updateDeliveryStatus(
      {required int deliveryId, required DeliveryStatus status}) async {
    final outputStatus = status.toString().split(".").last.toLowerCase();
    var response = await crud.putData(
      linkUrl: "${AppLinks.deliveries}/UpdateDeliveryStatus/$deliveryId",
      data: {},
      queryParameters: {"status": outputStatus},
    );
    return response.fold((l) => l, (r) => r);
  }
}
