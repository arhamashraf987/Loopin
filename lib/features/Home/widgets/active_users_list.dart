import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
class ActiveUsersList extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
   ActiveUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.h,),
      scrollDirection: Axis.horizontal,
      itemCount: controller.activeUsers.length,
      itemBuilder: (context, index) {
        final user = controller.activeUsers[index];
        return Padding(
          padding:  EdgeInsets.only(right: 20.h),
          child: Column(
            children: [
              Logo(
                
                paddingWidth: 6.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99.r),
                  child: Image.asset(user.image, fit: BoxFit.cover, )),
              ),
              SizedBox(height: 5.h,),
              Text(user.name, style: AppTextStyles.regular,)
            ],
          ),
        );
      });
  }
}