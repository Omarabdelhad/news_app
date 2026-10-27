import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/core/resources/assets_manager.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List<String> itemsLanguage = ['English', 'العربية'];
  List<String> itemsTheme = ['Dark', 'Light'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            height: 166.h,
            alignment: .center,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.lightSecondaryColor),
            child: Text(
              StringsManager.appTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  spacing: 8.w,

                  children: [
                    SvgPicture.asset(
                      AssetsManager.home,
                      height: 24.h,
                      width: 24.w,
                    ),
                    Text(
                      StringsManager.goToHome,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Divider(color: AppColors.lightSecondaryColor, thickness: 1),
                SizedBox(height: 24.h),
                Row(
                  spacing: 8.w,

                  children: [
                    SvgPicture.asset(
                      AssetsManager.theme,
                      height: 24.h,
                      width: 24.w,
                    ),
                    Text(
                      StringsManager.theme,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                DropdownMenu(
                  dropdownMenuEntries: [
                    const DropdownMenuEntry(
                      value: 'Dark',
                      label: 'Dark',
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.lightSecondaryColor,
                        ),
                      ),
                    ),
                    const DropdownMenuEntry(
                      value: 'Light',
                      label: 'Light',
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.lightSecondaryColor,
                        ),
                      ),
                    ),
                  ],

                  width: double.infinity,
                  trailingIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  initialSelection: 'Dark',
                  textStyle: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontWeight: .w500),
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.lightPrimaryColor,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  onSelected: (value) {
                    print('Selected value : $value ');
                  },
                  enableSearch: true,
                  enableFilter: true,
                  requestFocusOnTap: true,
                ),
                SizedBox(height: 16.h),
                Divider(color: AppColors.lightSecondaryColor, thickness: 1),
                SizedBox(height: 24.h),
                Row(
                  spacing: 8.w,

                  children: [
                    SvgPicture.asset(
                      AssetsManager.language,
                      height: 24.h,
                      width: 24.w,
                    ),
                    Text(
                      StringsManager.language,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                DropdownMenu(
                  dropdownMenuEntries: [
                    const DropdownMenuEntry(
                      value: 'English',
                      label: 'English',
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.lightSecondaryColor,
                        ),
                      ),
                    ),
                    const DropdownMenuEntry(
                      value: 'العربية',
                      label: 'العربية',
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          AppColors.lightSecondaryColor,
                        ),
                      ),
                    ),
                  ],

                  width: double.infinity,
                  trailingIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  selectedTrailingIcon: const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                  initialSelection: 'English',
                  textStyle: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontWeight: .w500),
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.lightPrimaryColor,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  onSelected: (value) {
                    print('Selected value : $value ');
                  },
                  enableSearch: true,
                  enableFilter: true,
                  requestFocusOnTap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
