import 'package:flutter/material.dart';
import 'package:health_mate/src/call/presentaion/view/incomming_call_overlay_view.dart';

class GlobalNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static void showIncomingCallOverlay() {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay != null) {
      late OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(
        builder: (context) => IncommingCallOverlayView(
          onReject: () {
            overlayEntry.remove();
          },
        ),
      );
      overlay.insert(overlayEntry);
    }
  }
}
