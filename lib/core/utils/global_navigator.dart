import 'package:flutter/material.dart';
import 'package:health_mate/src/call/presentaion/view/incomming_call_overlay_view.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // ======= Chat =======
  static String? currentChatUserId;

  static bool isOnChatWithUser(String senderId) {
    return currentChatUserId == senderId;
  }

  static void navigateToChat(String conversationId, String senderId) {
    currentChatUserId = senderId;
    navigatorKey.currentState?.pushNamed(
      '/chatDetail',
      arguments: {
        'conversationId': conversationId,
        'senderId': senderId,
      },
    );
  }

  static void clearChatUser() {
    currentChatUserId = null;
  }

  // ======= Incoming Call Overlay =======
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
