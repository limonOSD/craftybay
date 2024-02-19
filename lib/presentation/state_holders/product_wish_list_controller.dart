import 'package:craftybay/data/models/product_wish_list_model.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';

class ProductWishListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ProductWishListModel _productWishListModel = ProductWishListModel();
  ProductWishListModel get productWishListModel => _productWishListModel;

  Future<bool> getProductWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.wishItemList,
    );

    _inProgress = false;
    if (response.isSuccess) {
      _productWishListModel =
          ProductWishListModel.fromJson(response.responseData);
      isSuccess = true;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
