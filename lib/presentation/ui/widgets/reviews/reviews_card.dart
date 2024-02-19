import 'package:craftybay/data/models/review_list_item.dart';
import 'package:flutter/material.dart';

import '../home/circle_icon_button.dart';

class ReviewsCard extends StatefulWidget {
  const ReviewsCard({
    super.key,
    required this.reviewListItem,
  });
  final ReviewListItem reviewListItem;

  @override
  State<ReviewsCard> createState() => _ReviewsCardState();
}

class _ReviewsCardState extends State<ReviewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleIconButton(
                  onTap: () {},
                  iconData: Icons.person,
                ),
                const SizedBox(width: 5),
                Text(
                  '${widget.reviewListItem.profile!.cusName}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.reviewListItem.description}',
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
