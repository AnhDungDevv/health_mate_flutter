import 'package:flutter/material.dart';

enum TransitionType { fade, slideLeft, slideRight, slideUp, slideDown, scale }

class AppPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final TransitionType transitionType;

  AppPageRoute({required this.page, required this.transitionType})
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
              reverseCurve: Curves.easeInOut,
            );

            switch (transitionType) {
              case TransitionType.fade:
                return FadeTransition(opacity: curvedAnimation, child: child);
              case TransitionType.slideLeft:
                return _buildSlideTransition(
                    curvedAnimation, const Offset(1.0, 0.0), child);
              case TransitionType.slideRight:
                return _buildSlideTransition(
                    curvedAnimation, const Offset(-1.0, 0.0), child);
              case TransitionType.slideUp:
                return _buildSlideTransition(
                    curvedAnimation, const Offset(0.0, 1.0), child);
              case TransitionType.slideDown:
                return _buildSlideTransition(
                    curvedAnimation, const Offset(0.0, -1.0), child);
              case TransitionType.scale:
                return ScaleTransition(
                  scale: Tween(begin: 0.85, end: 1.0).animate(curvedAnimation),
                  child: child,
                );
            }
          },
        );

  static Widget _buildSlideTransition(
      Animation<double> animation, Offset beginOffset, Widget child) {
    return SlideTransition(
      position: Tween(begin: beginOffset, end: Offset.zero).animate(animation),
      child: child,
    );
  }
}
