import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_widgets/widget/category_item.dart';

class CategoryWidget extends StatelessWidget {
  final void Function(CategoryModel) onCategoryClicked;

  const CategoryWidget({super.key, required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: .start,
        children: [
          SizedBox(height: 16.h),
          Text(
            StringsManager.welcome,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: .w500),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                category: CategoryModel.categories[index],
                index: index,
                onCategoryClicked: onCategoryClicked,
              ),
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
