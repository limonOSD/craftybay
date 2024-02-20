import 'package:craftybay/presentation/state_holders/brand_list_controller.dart';
import 'package:craftybay/presentation/ui/widgets/brand_screen.dart/category_brand_item.dart';

import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: GetBuilder<BrandController>(builder: (brandController) {
          return Visibility(
            visible: brandController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: GridView.builder(
              itemCount: brandController.brandListModel.brandList?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: CategoryBrandItem(
                    brandList: brandController.brandListModel.brandList![index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Brand'),
    );
  }
}
