import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/app_drawer.dart';
import 'package:news_app/screens/widgets/category_widgets/category_widget.dart';
import 'package:news_app/screens/widgets/articles_widget/articleswidget.dart';

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
      body: selectedCategory != null ? ArticlesWidget() : CategoryWidget(
        onCategoryClicked: chooseCategory,
      ),
    );
  }
   void chooseCategory(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }
   void unselectCategory() {
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }
}
