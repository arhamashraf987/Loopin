import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/reusable_border_styling.dart';
import 'package:convo_sphere/features/Home/widgets/add_friend_list.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        child: Column(
          children: [
            header(),
            SizedBox(height: 30.h),
            searchbar(),
            Expanded(child: AddFriendList())
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: ReusableBorderStyling(
            height: 36.h,
            width: 36.w,
            backgroundColor: AppColors.glassButtonBackgroundColor.withValues(
              alpha: 0.2,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: AppColors.primaryWhiteTextColor,
            ),
          ),
        ),
        SizedBox(width: 105.w),
        Text("Add Friend", style: AppTextStyles.bold.copyWith(fontSize: 26.sp)),
      ],
    );
  }

  Widget searchbar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        border: Border.all(
          color: AppColors.borderStylingColor2.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Icon(
              Icons.search,
              color: AppColors.primaryWhiteTextColor,
              size: 36.sp,
            ),
          ),
          Expanded(
            child: TextField(
              style: AppTextStyles.regular,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search username here",
                hintStyle: AppTextStyles.regular.copyWith(
                  color: AppColors.textPrimary,
                ),
                contentPadding: EdgeInsets.only(left: 10.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
