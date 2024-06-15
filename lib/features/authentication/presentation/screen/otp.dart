import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
import 'package:interview/features/authentication/presentation/widget/timer_and_resed.dart';
import 'package:interview/gen/assets.gen.dart';
import 'package:interview/locator.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinPutController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final mobRouteArg = ModalRoute.of(context)!.settings.arguments as String;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 72,
      textStyle: AppTextStyle.otpCodeTextStyle,
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      textStyle: AppTextStyle.correctOtpCodeTextStyle,
      decoration: BoxDecoration(
        color: AppColors.textField,
        border: Border.all(color: AppColors.correctCode),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      textStyle: AppTextStyle.correctOtpCodeTextStyle,
      decoration: BoxDecoration(
        color: AppColors.textField,
        border: Border.all(color: AppColors.correctCode),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      textStyle: AppTextStyle.wrongOtpCodeTextStyle,
      decoration: BoxDecoration(
        color: AppColors.textField,
        border: Border.all(color: AppColors.error),
        borderRadius: BorderRadius.circular(8),
      ),
    );

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
              AppStrings.otpSubTitle,
              style: AppTextStyle.subTitleTextStyle,
            ),
            40.sizedBoxHeight(context),
            TimerAndResend(
              onResend: () {
               BlocProvider.of<AuthenticationBloc>(context).add(OtpEvent(pinPutController.text, mobRouteArg));
            },),
            17.sizedBoxHeight(context),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                errorPinTheme: errorPinTheme,
                closeKeyboardWhenCompleted: true,
                keyboardType: TextInputType.number,
                controller: pinPutController,
                // inputFormatters: [TextInputFormatter.withFunction((oldValue, newValue) => null)],
              ),
            ),
            8.sizedBoxHeight(context),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is OtpCompleted) {
                  Navigator.of(context).pushNamed(ScreenNames.homeScreen);
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    state is OtpError
                        ? Row(
                            children: [
                              SvgPicture.asset(Assets.images.warning),
                              6.sizedBoxWidth(context),
                              Text(
                                state.message,
                                style: AppTextStyle
                                    .wrongOtpCodeHelperTextTextStyle,
                              )
                            ],
                          )
                        : const SizedBox(),
                    40.sizedBoxHeight(context),
                    AppButton(
                        isLoading: state is OtpLoading,
                        onTap: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(OtpEvent(pinPutController.text, mobRouteArg));
                        }),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

