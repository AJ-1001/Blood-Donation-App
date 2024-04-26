import 'package:blood_donor/features/authentication/controller/signup/signup_controller.dart';
import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:blood_donor/utils/constants/text_strings.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionCheckBox extends StatelessWidget {
  const TermsAndConditionCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '${TTexts.iAgreeTo} ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: TTexts.privacyPolicy,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColors.white : TColors.primary),
          ),
          TextSpan(
            text: ' ${TTexts.and}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: ' ${TTexts.termsOfUse}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColors.white : TColors.primary),
          ),
        ])),
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
      ],
    );
  }
}
