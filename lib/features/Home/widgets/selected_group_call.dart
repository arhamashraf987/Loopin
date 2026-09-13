import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/core/shared_widgets/logo.dart';
import 'package:convo_sphere/features/Home/controller/home_controller.dart';
class SelectedGroupCall extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
   SelectedGroupCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.selectedgroup.length,
        itemBuilder: (context, index) {
          final users = controller.selectedgroup[index];
          return Row(
            children: [
               Padding(
                 padding:  EdgeInsets.only(right: 20.h),
                 child: Stack(
                   children: [ 
                    
                    Logo(
                        height: 75.h,
                        width: 75.w,
                        paddingWidth: 6.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(99.r),
                          child: Image.asset(users.image, fit: BoxFit.cover,)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 50.w),
                        child: GestureDetector(
                          onTap: (){
                            controller.selectgroup(users);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: AppColors.borderStylingColor1
                              ),
                              borderRadius: BorderRadius.circular(99.r)
                            ),
                          child: Icon(
                            Icons.close, size: 20.sp,
                            color: AppColors.primaryWhiteTextColor,),
                                              ),
                        ),
                      ),
                   ]
                 ),
               ),
            ],
          );
        }),
    );
  }
}