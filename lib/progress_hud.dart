import 'package:flutter/material.dart';
import 'package:bmprogresshud/bmprogresshud.dart';

showLoadingHud(BuildContext context, String label) async {
  ProgressHud.of(context)?.show(ProgressHudType.loading, "$label...");
  await Future.delayed(const Duration(seconds: 3));
  ProgressHud.of(context)?.dismiss();
}

// show successHud with text
showSuccessHud(BuildContext context, String label) {
  ProgressHud.of(context)?.showAndDismiss(
    ProgressHudType.success,
    "$label success",
  );
}

// show errorHud with text
showErrorHud(BuildContext context, String label) {
  ProgressHud.of(context)?.showAndDismiss(
    ProgressHudType.error,
    "$label fail",
  );
}
