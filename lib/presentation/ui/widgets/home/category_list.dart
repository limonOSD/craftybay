import 'package:craftybay/presentation/ui/widgets/category_itme.dart';
import 'package:flutter/material.dart';

SizedBox get categoryList {
  return SizedBox(
    height: 130,
    child: ListView.separated(
      itemCount: 10,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const CategoryItem();
      },
      separatorBuilder: (_, __) {
        return const SizedBox(
          width: 8,
        );
      },
    ),
  );
}
