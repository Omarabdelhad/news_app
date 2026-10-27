import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: AppBar(
            title: Text(
              selectedCategory != null
                  ? selectedCategory!.title
                  : StringsManager.home,
            ),
            actions: [SvgPicture.asset(AssetsManager.search)],
          ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 16.h),
            Text(
              StringsManager.welcome,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: .w500),
            ),
          ],
        ),
      ),
    );
  }
}
