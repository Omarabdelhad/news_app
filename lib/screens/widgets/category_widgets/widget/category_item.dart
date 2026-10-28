import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final int index;
    final void Function(CategoryModel) onCategoryClicked;


  final CategoryModel category;
  const CategoryItem({super.key, required this.category, required this.index, required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
                onCategoryClicked(category);

      },
      child: Directionality(
        textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
        child: Container(
          clipBehavior: .antiAlias,
          height: 198.h,
      
          decoration: BoxDecoration(
            color: AppColors.lightPrimaryColor,
            borderRadius: .circular(24.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  category.imagePath,
                  fit: .cover,
                  height: 198.h,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: index.isOdd
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      category.title,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 24.sp),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(84.r),
                        color: AppColors.lightSecondaryColor.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      child: Row(
                        spacing: 10.w,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringsManager.viewAll,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          CircleAvatar(
                            radius: 27.r,
                            backgroundColor: AppColors.lightSecondaryColor,
                            child: SvgPicture.asset(
                              AssetsManager.arrow,
                              matchTextDirection: true,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }
}
