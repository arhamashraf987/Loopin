import 'package:convo_sphere/core/constants/app_routes.dart';
import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
import 'package:convo_sphere/features/Home/widgets/active_users_list.dart';
import 'package:convo_sphere/features/Home/widgets/friends_list.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    AppText.appName,
                    style: AppTextStyles.bold.copyWith(fontSize: 26.sp),
                  ),
                  Spacer(),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceColor,
                      border: Border.all(color: AppColors.violet),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.group_add,
                      color: AppColors.primaryWhiteTextColor,
                      size: 22.sp,
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Logo(
                    height: 40.h,
                    width: 40.w,
                    child:ClipRRect(
                  borderRadius: BorderRadius.circular(99.r),
                  child: Image.asset(AppImages.profile4, fit: BoxFit.cover, )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
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
                          hintText: "Search you friend here",
                          hintStyle: AppTextStyles.regular.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          contentPadding: EdgeInsets.only(left: 10.w),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "ACTIVE NOW",
              style: AppTextStyles.bold.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 10.h),
            controller.activeUsers.isEmpty
                ? Image.asset(AppImages.noInternet, height: 120.h,)
                : SizedBox(height: 150.h, child: ActiveUsersList()),
                SizedBox(height: 30.h,),
            Text(
              "FRIENDS",
              style: AppTextStyles.bold.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  FriendsList(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:  EdgeInsets.only(right: 30.w, bottom: 50.h),
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.addFriendScreen);
                        },
                        child: Container(
                          height: 80.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [AppColors.violet, AppColors.coral],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add, color: AppColors.backgroundColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
