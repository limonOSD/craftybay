import 'package:craftybay/presentation/state_holders/product_controller.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category, this.categoryId});

  final String? category;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category ?? 'Product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<ProductController>(builder: (productController) {
          return Visibility(
            visible: productController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: Visibility(
              visible:
                  productController.productListModel.productList?.isNotEmpty ??
                      false,
              replacement: const Center(
                child: Text('No Products'),
              ),
              child: GridView.builder(
                  itemCount:
                      productController.productListModel.productList?.length ??
                          0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.90,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 4,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return FittedBox(
                        child: ProductCardItem(
                            product: productController
                                .productListModel.productList![index]));
                  }),
            ),
          );
        }),
      ),
    );
  }
}
