import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview/config/styles/text_styles.dart';
import 'package:interview/core/extensions/dimens_extension.dart';
import 'package:interview/core/extensions/sized_box_extension.dart';
import 'package:interview/core/routes/screen_names.dart';
import 'package:interview/core/utils/app_colors.dart';
import 'package:interview/core/utils/app_strings.dart';
import 'package:interview/core/widgets/app_button.dart';
import 'package:interview/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:interview/gen/assets.gen.dart';
import 'package:interview/locator.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});
  final TextEditingController tec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthenticationBloc>(),
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.getWidth(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.logo.path),
            40.sizedBoxHeight(context),
            const Text(
              AppStrings.mainTitle,
              style: AppTextStyle.mainTitleTextStyle,
            ),
            16.sizedBoxHeight(context),
            const Text(
              AppStrings.subTitle,
              style: AppTextStyle.subTitleTextStyle,
            ),
            60.sizedBoxHeight(context),
            RichText(
              text: const TextSpan(
                  text: AppStrings.phoneTitle,
                  style: AppTextStyle.phoneTitleTextStyle,
                  children: [
                    TextSpan(text: "*", style: TextStyle(color: Colors.red))
                  ]),
            ),
            8.sizedBoxHeight(context),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                final route = ModalRoute.of(context);
                final isCurrentRoute = route?.isCurrent ?? false;
                if (isCurrentRoute) {
                  if (state is PhoneCompleted) {
                    Navigator.pushNamed(context, ScreenNames.otpScreen,
                        arguments: tec.text);
                  }
                }
              },
              builder: (context, state) {
                final route = ModalRoute.of(context);
                final isCurrentRoute = route?.isCurrent ?? false;
                if (isCurrentRoute) {
                  return Column(
                    children: [
                      TextField(
                        controller: tec,
                        maxLength: 11,
                        cursorColor: AppColors.phoneNumber,
                        style: state is PhoneError
                            ? AppTextStyle.wrongPhoneNumberTextStyle
                            : AppTextStyle.phoneNumberTextStyle,
                        keyboardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                            constraints: BoxConstraints(
                              maxHeight: 58.getHeight(context),
                              maxWidth: double.infinity,
                            ),
                            filled: true,
                            fillColor: AppColors.textField,
                            counter: const SizedBox(),
                            suffixIcon: SvgPicture.asset(
                              Assets.images.keyboard,
                              fit: BoxFit.scaleDown,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      state is PhoneError
                          ? Row(
                              children: [
                                SvgPicture.asset(Assets.images.warning),
                                6.sizedBoxWidth(context),
                                const Text(
                                  AppStrings.wrongPhoneNumber,
                                  style: AppTextStyle
                                      .wrongPhoneNumberHelperTextTextStyle,
                                )
                              ],
                            )
                          : const SizedBox(),
                      13.sizedBoxHeight(context),
                      AppButton(
                          isLoading: state is PhoneLoading,
                          onTap: () {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(PhoneAuthEvent(tec.text));
                          })
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      )),
    );
  }
}
