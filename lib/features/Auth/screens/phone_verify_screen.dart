import 'package:convo_sphere/core/constants/constant_files.dart';
import 'package:convo_sphere/features/Auth/widgets/header_reusable.dart';
import 'package:convo_sphere/features/Auth/widgets/phone_field.dart';
import 'package:flutter/material.dart' as flutter;

class PhoneVerifyScreen extends StatelessWidget {

  const PhoneVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
        child: Column(
          children: [
            HeaderReusable(),
            SizedBox(height: 50.h,),
            Text("What's your number?", style: AppTextStyles.bold.copyWith(fontSize: 32.sp),),
            SizedBox(height: 10.h,),
            Text("We'll text you a code to verify", style: AppTextStyles.regular.copyWith(color: AppColors.textPrimary),),
            SizedBox(height: 40.h,),
           PhoneField()


          ],
        ),
      ),
    );
  }

}