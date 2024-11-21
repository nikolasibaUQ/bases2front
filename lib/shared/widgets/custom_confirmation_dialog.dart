import 'dart:ui';

import 'package:bases2/shared/colors/colors.dart';
import 'package:bases2/shared/utils/image_paths.dart';
import 'package:bases2/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomConfirmationDialog {
  final Widget? icon;
  final String? title;
  final String? subtitle;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;
  final BuildContext context;
  final bool barrierDismissible;
  final String? cancelButtonText;
  final String? acceptButtonText;

  CustomConfirmationDialog(
      {this.title,
      this.subtitle,
      this.onAccept,
      this.onCancel,
      this.icon,
      required this.context,
      this.barrierDismissible = false,
      this.cancelButtonText,
      this.acceptButtonText}) {
    showAlertDialog();
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          final Responsive responsive = Responsive.of(context);
          final bool isDesktop = responsive.isDesktop;

          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              fit: StackFit.loose,
              children: [
                BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    )),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: responsive.dp(0.5),
                        vertical: responsive.dp(0.5)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColors.darkWhite,
                    ),
                    width: isDesktop ? responsive.dp(22) : responsive.dp(35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              color: MyColors.white,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                  maxWidth: responsive.isDesktop
                                      ? responsive.dp(2.5)
                                      : responsive.dp(5),
                                  maxHeight: responsive.isDesktop
                                      ? responsive.dp(2.5)
                                      : responsive.dp(5),
                                  minWidth: responsive.isDesktop
                                      ? responsive.dp(2.5)
                                      : responsive.dp(5),
                                  minHeight: responsive.isDesktop
                                      ? responsive.dp(2.5)
                                      : responsive.dp(5)),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          MyColors.violetBlue)),
                              onPressed:
                                  onCancel ?? () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close_rounded,
                                size: responsive.isDesktop
                                    ? responsive.dp(2)
                                    : responsive.dp(3.5),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: responsive.dp(1.5)),
                          child: Column(
                            children: [
                              SizedBox(
                                width:
                                    responsive.dp(responsive.isDesktop ? 5 : 8),
                                height:
                                    responsive.dp(responsive.isDesktop ? 5 : 8),
                                child: icon ??
                                    Image.asset(AssetsPaths.images.warning),
                              ),
                              if (title != null)
                                SizedBox(
                                  height: responsive.dp(1),
                                ),
                              if (title != null)
                                Text(
                                  title!,
                                ),
                              if (subtitle != null)
                                SizedBox(
                                  height: responsive.dp(1),
                                ),
                              if (subtitle != null)
                                Text(
                                  subtitle!,
                                  textAlign: TextAlign.center,
                                  // style: TextStyles.dynamicTextStyle(
                                  //   fontSize: isDesktop
                                  //       ? responsive.fpw(16)
                                  //       : responsive.fp(16),
                                  //   color: MyColors.grayDarkText,
                                  //   lineSpacing: 1.4,
                                  //   fontFamily: Fonts.montserratRegular,
                                  // ),
                                ),
                              if (subtitle != null)
                                SizedBox(height: responsive.hp(1.5)),
                              SizedBox(height: responsive.hp(1.5)),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: onCancel ??
                                            () => Navigator.pop(context),
                                        child: Text(
                                          cancelButtonText ?? 'Canelar',
                                          style:
                                              TextStyle(color: MyColors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: responsive.dp(0.8)),
                                    Flexible(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: MyColors.violetBlue,
                                        ),
                                        onPressed: onAccept ?? () {},
                                        child: Text(
                                          acceptButtonText ?? 'Aceptar',
                                          style:
                                              TextStyle(color: MyColors.white),
                                        ),
                                      ),
                                    )
                                  ]),
                              SizedBox(
                                  height: responsive.dp(isDesktop ? 0.8 : 2.5)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }
}