import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
class AddFriendList extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
   AddFriendList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.addUsers.length,
      itemBuilder: (context, index){
       final user = controller.addUsers[index];
        return Padding(
          padding:  EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(99.r),
                child: Image.asset(user.image, height: 70.h, width: 70.h, fit: BoxFit.cover,),
              ),
              SizedBox(width: 15.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: AppTextStyles.semiBold,),
                  SizedBox(height: 5.h,),
                  Text(user.userName, style: AppTextStyles.medium.copyWith(color: AppColors.textPrimary),),
                ],
              ),
              Spacer(),
              requestButton(controller, index)

            ],
          ),
        );
      });
  }
  Widget requestButton(HomeController controller,int index) {
    final isSent = controller.addUsers[index].isSent;
    final isAccepted = controller.addUsers[index].isAccepted;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99.r),
        border: Border.all(
          color:isSent? isAccepted? AppColors.mint :AppColors.borderStylingColor2.withOpacity(0.2)  :  AppColors.violet
        ),
      ),
      child: Text( isSent? isAccepted? "Accepted": "Requested": "Add", style: AppTextStyles.regular.copyWith(color: isSent? isAccepted? AppColors.mint: AppColors.borderStylingColor2.withOpacity(0.4) :AppColors.violet),),
    );
  }
}