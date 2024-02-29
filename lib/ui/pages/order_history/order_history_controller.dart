import 'dart:convert';
import 'package:bwa_masteringflutter/services/balance_service.dart';
import 'package:bwa_masteringflutter/services/order_service.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../models/order.dart';
import '../../../shared/api_url.dart';

class OrderHistoryController extends GetxController{

  List<OrderModel> orderData = [];
  var userController = Get.find<HomePageController>();

  @override
  void onInit() async {
    await getOrderFromFirebase();
    fetchOrders(userController.user!.id);
    super.onInit();
  }

  Future<void> getOrderFromFirebase() async {
    try{
      orderData = await OrderService().fetchOrder();
      update();
    }catch(e){
      update();
    }
  }

  Future<void> fetchOrders(String uid) async {
    final String url = '$getOrderApi=$uid';
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
      if(response.statusCode == 200){
        print("Get Data");
        final List<dynamic> orders = json.decode(response.body);
        getDataFromDb(orders);
      }
  }
  void getDataFromDb(List<dynamic> orders) async {
    for (var element in orders) {
      OrderModel order = OrderModel.fromJson(element);
      if (orderData.any((existingOrder) => existingOrder.order_id == order.order_id)) {
        print('Order dengan id ${order.order_id} sudah pernah ditambahkan sebelumnya');
      }
      else {
        if(order.status == 'Paid'){
          print('Order dengan id ${order.order_id}');
          OrderService().addOrder(order);
          BalanceService().updateBalance(userController.user!.id, order.total_topup + userController.user!.balance);
        }
        else{
          print('Else Order dengan id ${order.order_id}');
          orderData.add(order);
        }
      }
    }
    update();
  }
}