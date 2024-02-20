import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {
  bool _inProgress = false;
  String _errormessage = '';

  bool get inPogress => _inProgress;
  String get errormessage => _errormessage;

  Future<bool> addWishListItem(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.createWishList(productId));

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errormessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
