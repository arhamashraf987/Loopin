import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/controller/auth_controller.dart';
import 'package:convo_sphere/features/Auth/models/country_data.dart';
import 'package:convo_sphere/features/Auth/models/country_model.dart';
import 'package:flutter/services.dart';
class PhoneField extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
   PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
         color:  AppColors.violet
        )
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            child: GestureDetector(
              onTap: (){
                Get.bottomSheet(phoneSheet(controller));
              },
              child: Obx(()=>
                 Row(
                  children: [
                    Text(controller.selectedCountry.value.isoCode, style: AppTextStyles.regular,),
                    SizedBox(width: 6.w,),
                    Text(controller.selectedCountry.value.dialCode, style: AppTextStyles.regular,),
                    
                  ],
                ),
              ),
            ),
          ),
          Container(
                  width: 1,
                  color: AppColors.violet,
                  height: 35.h,
                ),
                Expanded(child: TextField(
                  style: AppTextStyles.regular,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter phone number here", hintStyle: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                  ),
                ))
        ],
      ),
    );
  }
  Widget phoneSheet(AuthController controller) {
  
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
      children: [
         Container(
          height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: AppColors.surfaceColor,
                        border: Border.all(
                          color: AppColors.borderStylingColor2.withOpacity(0.2)
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10.w,),
                          Icon(Icons.search, color: AppColors.primaryWhiteTextColor, size: 30.sp,),
                          Expanded(
                            child: TextField(
                              controller: controller.countryQuery,
                              style: AppTextStyles.regular,
                              decoration: InputDecoration(
                                 border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 15.w)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Expanded(
                      child: Obx(()=>
                        ListView.builder(
                          itemCount: controller.filteredCountries.length,
                          itemBuilder: ((context, index) {
                            final Country = controller.filteredCountries[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    controller.selectCountry(Country);
                                    Get.back();
                                  },
                                  child: Row(
                                    children: [
                                      Text(Country.flag, style: TextStyle(fontSize: 24.sp),),
                                      SizedBox(width: 20.w,),
                                      Text(Country.name , style: AppTextStyles.regular,),
                                      Spacer(),
                                      Text(Country.dialCode,style: AppTextStyles.regular,),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h,)
                              ],
                            );
                          }
                          ),
                          ),
                      ),
                        )
      ],
      ),
    );
  }
}