import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview/config/styles/text_styles.dart';
import 'package:interview/core/extensions/sized_box_extension.dart';
import 'package:interview/core/utils/app_strings.dart';
import 'package:interview/gen/assets.gen.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerAndResend extends StatefulWidget {
  final VoidCallback onResend;

  const TimerAndResend({super.key, required this.onResend});

  @override
  State<TimerAndResend> createState() => _TimerAndResendState();
}

class _TimerAndResendState extends State<TimerAndResend> {
  bool showTimer = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 50),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: showTimer == false
          ? GestureDetector(
              key: const ValueKey('resend'),
              onTap: () {
                setState(() {
                  showTimer = true;
                });
                widget.onResend();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.images.resend,
                    height: 24,
                  ),
                  10.sizedBoxWidth(context),
                  const Text(
                    AppStrings.resend,
                    style: AppTextStyle.resendTextStyle,
                  )
                ],
              ),
            )
          : Row(
              key: const ValueKey('timer'),
              children: [
                SvgPicture.asset(Assets.images.timer, height: 24),
                const Text(
                  AppStrings.remainingTime,
                  style: AppTextStyle.subTitleTextStyle,
                ),
                Countdown(
                  seconds: 60,
                  build: (_, double time) => Text(time.toInt().toString(),
                      style: AppTextStyle.timerTextStyle),
                  onFinished: () {
                    setState(() {
                      showTimer = false;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
