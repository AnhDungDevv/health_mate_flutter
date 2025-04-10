import 'package:flutter/material.dart';
import 'package:health_mate/src/call/presentaion/view/incomming_call_overlay_view.dart';

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void navigateToChat(String conversationId) {
    navigatorKey.currentState?.pushNamed(
      '/chat',
      arguments: {'conversationId': conversationId},
    );
  }

  static OverlayEntry? _incomingCallOverlay;

  static void showIncomingCallOverlay({
    String? callerName,
    VoidCallback? onAccept,
    VoidCallback? onReject,
  }) {
    if (_incomingCallOverlay != null) return; // Tránh hiện nhiều overlay

    final overlay = navigatorKey.currentState?.overlay;
    if (overlay != null) {
      _incomingCallOverlay = _createIncomingCallOverlayEntry(
        callerName: callerName,
        onAccept: onAccept,
        onReject: onReject,
      );
      overlay.insert(_incomingCallOverlay!);
    }
  }

  static void hideIncomingCallOverlay() {
    _incomingCallOverlay?.remove();
    _incomingCallOverlay = null;
  }

  static OverlayEntry _createIncomingCallOverlayEntry({
    String? callerName,
    VoidCallback? onAccept,
    VoidCallback? onReject,
  }) {
    return OverlayEntry(
      builder: (context) => IncommingCallOverlayView(
        onReject: () {
          hideIncomingCallOverlay();
          onReject?.call();
        },
      ),
    );
  }
}
