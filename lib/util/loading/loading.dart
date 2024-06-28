import 'package:flutter/material.dart';
import 'package:pet_care_task/util/resources/r.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white_FFFFFF.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: R.colors.navyBlue_263C51,
        ),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
