import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/state_holders/product_wish_list_controller.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductWishListController>().getProductWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Wishlist',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          elevation: 3,
        ),
        body: GetBuilder<ProductWishListController>(
            builder: (productWishListController) {
          if (productWishListController.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Visibility(
              visible: productWishListController
                      .productWishListModel.productList?.isNotEmpty ??
                  false,
              replacement: const Center(
                child: Text('Product not available'),
              ),
              child: GridView.builder(
                  itemCount: productWishListController
                          .productWishListModel.productList?.length ??
                      0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.90,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return FittedBox(
                        child: ProductCardItem(
                            product: productWishListController
                                .productWishListModel
                                .productList![index]
                                .product!));
                  }),
            ),
          );
        }),
      ),
    );
  }
}
