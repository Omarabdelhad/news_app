import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_colors.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: REdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.lightPrimaryColor
        )
        
      ),
      child: Column(
        spacing: 10.h,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn5gsAN8K6WZ6KCcKJAZzXBn0yzSaMYFEzYZEtsy3ODA&s",
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "40-year-old man falls 200 feet to his death while canyoneering at national park",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By : Jon Haworth",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "15 minutes ago",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}