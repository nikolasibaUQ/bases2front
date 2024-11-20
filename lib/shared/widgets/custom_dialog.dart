import 'package:bases2/shared/utils/image_paths.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:bases2/shared/widgets/custom_card.dart';
import 'package:flutter/material.dart';

/// The `CustomAlertDialog` class in Dart represents a customizable alert dialog that can be shown in a
/// the application.
class CustomAlertDialog {
  final double? height;
  final double? width;
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool hasCloseButton;
  final VoidCallback? onClose;
  final BuildContext context;
  final bool barrierDismissible;
  final Duration? autoCloseDuration;
  final VoidCallback? onAutoClose;
  final VoidCallback? subtitleOnTap;
  Function(bool)? onPopInvoked;

  CustomAlertDialog({
    this.title,
    this.height,
    this.width,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.hasCloseButton = true,
    this.onClose,
    this.icon,
    required this.context,
    this.barrierDismissible = false,
    this.autoCloseDuration,
    this.onAutoClose,
    this.onPopInvoked,
    this.subtitleOnTap,
  }) {
    showAlertDialog();
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: barrierDismissible,
        onPopInvoked: onPopInvoked,
        child: BodyAlert(
          icon: icon,
          title: title,
          onClose: onClose,
          subtitle: subtitle,
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
          height: height,
          width: width,
          hasCloseButton: hasCloseButton,
          subtitleOnTap: subtitleOnTap,
        ),
      ),
      barrierDismissible: barrierDismissible,
    );

    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration!, () {
        if (onAutoClose != null) {
          onAutoClose!();
        }
      });
    }
  }
}

/// The `BodyAlert` class is a Flutter widget that displays an alert with an icon, title, subtitle, and
/// a close button.
class BodyAlert extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool hasCloseButton;
  final VoidCallback? onClose;
  final double? height;
  final double? width;
  final VoidCallback? subtitleOnTap;

  const BodyAlert({
    super.key,
    this.icon,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.onClose,
    this.height,
    this.width,
    this.hasCloseButton = true,
    this.subtitleOnTap,
  });

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return CustomCard(
      height: height ?? responsive.dp(15),
      width: width ?? responsive.dp(20),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
      content: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: responsive.dp(8),
                height: responsive.dp(8),
                child: icon ?? Image.asset(AssetsPaths.images.warning),
              ),
              if (title != null)
                SizedBox(
                  child: Center(
                    child: Text(
                      title!,
                      style: titleStyle ?? const TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (subtitle != null)
                Column(
                  children: [
                    SizedBox(height: responsive.hp(2)),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        child: Center(
                          child: GestureDetector(
                            onTap: subtitleOnTap ?? () {},
                            child: Text(subtitle!,
                                textAlign: TextAlign.center,
                                style: subtitleStyle ?? const TextStyle()
                                // TextStyles.dynamicTextStyle(
                                //   fontSize: responsive.fp(15),
                                //   color: MyColors.violetBlue,
                                //   fontFamily: Fonts.montserratRegular,

                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (hasCloseButton)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                key: const Key('close_button'),
                onTap: onClose ??
                    () {
                      Navigator.pop(context);
                    },
                child: Image.asset(
                  AssetsPaths.images.exit,
                  height: responsive.hp(7),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
