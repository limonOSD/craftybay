import 'package:craftybay/data/models/brand_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BrandController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  BrandListModel _brandListModel = BrandListModel();
  BrandListModel get brandListModel => _brandListModel;

  Future<bool> getBrandList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.brandItemList,
    );

    _inProgress = false;
    if (response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.responseData);
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
