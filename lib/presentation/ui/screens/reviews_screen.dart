import 'package:craftybay/presentation/state_holders/review_controller.dart';
import 'package:craftybay/presentation/ui/screens/create_review_screen.dart';
import 'package:craftybay/presentation/ui/utility/app_colors.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/reviews/reviews_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewListController>().getReviewList(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: GetBuilder<ReviewListController>(builder: (reviewListController) {
        if (reviewListController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Visibility(
                  visible: reviewListController
                          .reviewListModel.reviewListItem?.isNotEmpty ??
                      false,
                  replacement: const Center(
                    child: Text('Review not found'),
                  ),
                  child: ListView.separated(
                    itemCount: reviewListController
                            .reviewListModel.reviewListItem?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return ReviewsCard(
                        reviewListItem: reviewListController
                            .reviewListModel.reviewListItem![index],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                  ),
                ),
              ),
            ),
            addToReviewSection(
                reviewListController.reviewListModel.reviewListItem?.length ??
                    0),
          ],
        );
      }),
    );
  }

  Container addToReviewSection(int reviewratting) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews(${reviewratting.toString()})',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Get.to(() => const CreateReviewScreen());
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
