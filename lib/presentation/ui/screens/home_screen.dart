import 'package:craftybay/data/models/product_model.dart';
import 'package:craftybay/presentation/state_holders/auth_controller.dart';
import 'package:craftybay/presentation/state_holders/home_banner_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:craftybay/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay/presentation/ui/utility/assets_path.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:craftybay/presentation/ui/widgets/home/category_list.dart';
import 'package:craftybay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:craftybay/presentation/ui/widgets/banner_carousel.dart';
import 'package:craftybay/presentation/ui/widgets/home/section_title.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 210,
                  child: GetBuilder<HomeBannerController>(
                      builder: (homeBannerController) {
                    return Visibility(
                        visible: homeBannerController.inProgress == false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: BannerCarousel(
                          bannerList:
                              homeBannerController.bannerListModel.bannerList ??
                                  [],
                        ));
                  })),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                return Visibility(
                  visible: popularProductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: productList(
                      popularProductController.productListModel.productList ??
                          []),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                return Visibility(
                  visible: specialProductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: productList(
                      specialProductController.productListModel.productList ??
                          []),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {},
              ),
              GetBuilder<NewProductController>(builder: (newProductController) {
                return Visibility(
                    visible: newProductController.inProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: productList(
                        newProductController.productListModel.productList ??
                            []));
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: productList.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCardItem(
            product: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
            onTap: () async {
              await AuthController.clearAuthData();
              Get.offAll(() => const VerifyEmailScreen());
            },
            iconData: Icons.logout),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
            onTap: () {}, iconData: Icons.notifications_active_outlined),
      ],
    );
  }
}
