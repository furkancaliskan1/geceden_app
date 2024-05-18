
import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class OtpForm extends StatelessWidget {

  final TextEditingController otpController;

  const OtpForm({super.key, required this.otpController});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: SizedBox(
        child: Pinput(
          validator: (input) {
            if (input != null) {
              if (input.length == 6) {
                /////
              }
              else {
                return 'Bu alan boş bırakılamaz';
              }
            }
            else {
              return 'Bu alan boş bırakılamaz';
            }
            return null;
          },
          controller: otpController,
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          defaultPinTheme: PinTheme(
            height: 60,
            width: 50,
            textStyle: AppTextStyles.inputText,
            decoration: BoxDecoration(
              color: AppColors.formFieldBackGroundColor,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15),
            )
          ),
          errorPinTheme: PinTheme(
            height: 60,
            width: 50,
            textStyle: AppTextStyles.inputText,
            decoration: BoxDecoration(
              color: AppColors.formFieldBackGroundColor,
              border: Border.all(
                color: Colors.red.withOpacity(0.3),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15),
            )
          ),
          focusedPinTheme: PinTheme(
            height: 60,
            width: 50,
            textStyle: AppTextStyles.inputText,
            decoration: BoxDecoration(
              color: AppColors.formFieldBackGroundColor,
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15),
            )
          ),
        ),
      ),
    );
  }
}