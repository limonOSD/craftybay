import 'package:craftybay/data/models/brand_item.dart';
import 'package:craftybay/data/models/category_list_item.dart';
import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({
    super.key,
    this.categoryListItem,
    this.brandList,
  });

  final CategoryListItem? categoryListItem;
  final BrandList? brandList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          category:
              categoryListItem?.categoryName ?? brandList?.brandName ?? '',
          categoryId: categoryListItem?.id ?? brandList?.id,
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  categoryListItem?.categoryImg ?? brandList?.brandImg ?? '',
                  width: 50,
                  height: 50,
                )),
          ),
          Text(
            categoryListItem?.categoryName ?? brandList?.brandName ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
