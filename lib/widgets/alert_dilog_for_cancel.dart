import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/colors.dart';

showAlertDialog(
  BuildContext context,
  void Function()? onPressed,
    Widget? title,
  Widget? content,
    List ? actions,
) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "LocaleKeys.cancel.tr()",
      style:   TextStyle(
        color: AppColors.blackColor,
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    onPressed: onPressed,
    child:   Text(
      "LocaleKeys.activateYourAccount.tr()",
      style: const   TextStyle(
        color: AppColors.blackColor,
      ),
    ),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    title: title,
    content: content,

    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogTheme(
              backgroundColor:
                  AppColors.whiteColor, // Set the background color here
            ),
          ),
          child: alert);
    },
  );
}
