import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
import 'package:convo_sphere/features/Home/models/friends_model.dart';
class GroupCallList extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
   GroupCallList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.friends.length,
      itemBuilder: (context, index) {
        final user = controller.friends[index];
        return Padding(
          padding:  EdgeInsets.only(bottom: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(99.r),
                  child: Image.asset(user.image, height: 70.h, width: 70.h, fit: BoxFit.cover,),
                ),
                Text(user.name, style: AppTextStyles.semiBold.copyWith(fontSize: 20.sp),),
                Obx(()=> selectedIcon(controller, user))

            ],
          ),
        );
      });
  }
  Widget selectedIcon(HomeController controller, FriendsModel user) {
    final isSelected = controller.selectedgroup.contains(user);
    return GestureDetector(
      onTap: (){
        controller.selectgroup(user);
      },
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99.r),
          color: isSelected? AppColors.violet : Colors.transparent,
          border: Border.all(
            color: AppColors.violet
          )
        ),
        child: isSelected? Icon(Icons.check, color: AppColors.primaryWhiteTextColor, size: 22.sp,): null,
      ),
      
    );
  }
}