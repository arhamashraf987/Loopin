import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
class FriendsList extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
   FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        itemCount: controller.friends.length,
        itemBuilder: (context, index){
          final friend = controller.friends[index];
          return Padding(
            padding:  EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Logo(
                  height: 75.h,
                  width: 75.w,
                  paddingWidth: 6.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99.r),
                    child: Image.asset(friend.image, fit: BoxFit.cover, )),
                ), SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(friend.name, style: AppTextStyles.medium,),
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text(friend.isAudio?"Audio":"Video", style: AppTextStyles.semiBold.copyWith(color: AppColors.textPrimary,),),
                          Text(" . ", style: AppTextStyles.semiBold.copyWith(color: AppColors.textPrimary,),),
                          Text(friend.timeStamp, style: AppTextStyles.semiBold.copyWith(color: AppColors.textPrimary,),),
                          Spacer(),
                          callIcon(Icons.call),
                          SizedBox(width: 15.h,),
                          callIcon(Icons.videocam)
                        ],
                      )
                    ],
                  ),
                ),
              
                
              ],
            ),
          );
        }),
    );
  }
  Widget callIcon(IconData callIcon,  ) {
    return Container(
                  height: 35.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceColor,
                    border: Border.all(color: AppColors.violet),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(callIcon, color: AppColors.primaryWhiteTextColor, size: 22.sp,),
                );
  }
}