import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/middleware/mymiddleware.dart';
import 'package:delivery_app/view/pages/auth/login_page.dart';
import 'package:delivery_app/view/pages/order_details%20copy/order_details_page.dart';
import 'package:delivery_app/view/pages/orders/deliveries_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
        name: '/',
        page: () => const LoginPage(),
        middlewares: [MyMiddleWare()]),
    GetPage(name: AppRoutes.orders, page: () => const DeliveriesPage()),
    GetPage(name: AppRoutes.orderdetails, page: () => const OrderDetailsPage()),
  ];
}
